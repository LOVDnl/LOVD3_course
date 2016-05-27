#!/usr/bin/php
<?php
/*******************************************************************************
 *
 * LOVD scripts: Training database creator
 *
 * Created     : 2016-05-27
 * Modified    : 2016-05-27
 * Version     : 0.0.6
 * For LOVD    : 3.0-15
 *
 * Purpose     : Create or reset LOVD3 training databases, based on a master
 *               database installation. The master database must have "master"
 *               in its table prefix (config.ini.php), in its URL (TABLE_CONFIG)
 *               and in its LOVD signature (TABLE_STATUS).
 *
 * Changelog   : 0.1    2016-05-2?
 *               Initial release.
 *
 * Copyright   : 2004-2016 Leiden University Medical Center; http://www.LUMC.nl/
 * Programmer  : Ing. Ivo F.A.C. Fokkema <I.F.A.C.Fokkema@LUMC.nl>
 *
 *
 * This file is part of LOVD.
 *
 * LOVD is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * LOVD is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with LOVD.  If not, see <http://www.gnu.org/licenses/>.
 *
 *************/

if (isset($_SERVER['HTTP_HOST'])) {
    die('Please run this script through the command line.' . "\n");
}

$_CONFIG = array(
    'version' => '0.0.6',
    'config_file' => 'config.ini.php', // The name of the LOVD config file that we'll search for.
    'master_dump_file' => 'SQL_dump_master.sql',
    'full_dump_file' => 'SQL_dump_ALL.sql',
    'default_relative_training_path' => '../', // The path where we build the trainings databases, relative to the master.
    'maximum_training_instances' => 25,
    'user' => array(
        // Variables we will be asking the user.
        'lovd_master_path' => '',
        'lovd_training_databases_path' => '',
        'training_instances' => 25,
        'master_dump_file_overwrite' => 'y',
        'mysql_username' => '', // Will only be used if the LOVD's user does not have the proper rights.
        'mysql_password' => '', // Will only be used if the LOVD's user does not have the proper rights.
    ),
);





function lovd_verifySettings ($sKeyName, $sMessage, $sVerifyType, $options)
{
    // Based on a function provided by Ileos.nl in the interest of Open Source.
    // Check if settings match certain input.
    global $_CONFIG;

    switch($sVerifyType) {
        case 'array':
            $aOptions = $options;
            if (!is_array($aOptions)) {
                return false;
            }
            break;

        case 'int':
            // Integer, options define a range in the format '1,3' (1 to 3) or '1,' (1 or higher).
            $aRange = explode(',', $options);
            if (!is_array($aRange) ||
                ($aRange[0] === '' && $aRange[1] === '') ||
                ($aRange[0] !== '' && !ctype_digit($aRange[0])) ||
                ($aRange[1] !== '' && !ctype_digit($aRange[1]))) {
                return false;
            }
            break;
    }

    while (true) {
        print('  ' . $sMessage .
            ($sVerifyType != 'int' || ($aRange === array('', ''))? '' : ' (' . (int) $aRange[0] . '-' . $aRange[1] . ')') .
            (empty($_CONFIG['user'][$sKeyName])? '' : ' [' . $_CONFIG['user'][$sKeyName] . ']') . ' : ');
        $sInput = trim(fgets(STDIN));
        if (!strlen($sInput) && !empty($_CONFIG['user'][$sKeyName])) {
            $sInput = $_CONFIG['user'][$sKeyName];
        }

        switch ($sVerifyType) {
            case 'array':
                $sInput = strtolower($sInput);
                if (in_array($sInput, $aOptions)) {
                    $_CONFIG['user'][$sKeyName] = $sInput;
                    return true;
                }
                break;

            case 'int':
                $sInput = (int) $sInput;
                // Check if input is lower than minimum required value (if configured).
                if ($aRange[0] !== '' && $sInput < $aRange[0]) {
                    break;
                }
                // Check if input is higher than maximum required value (if configured).
                if ($aRange[1] !== '' && $sInput > $aRange[1]) {
                    break;
                }
                $_CONFIG['user'][$sKeyName] = $sInput;
                return true;

            case 'string':
                $sInput = $sInput;
                $_CONFIG['user'][$sKeyName] = $sInput;
                return true;

            case 'file':
            case 'lovd_path':
            case 'path':
                // Always accept the default (if non-empty) or the given options.
                if (($sInput && ($sInput == $_CONFIG['user'][$sKeyName] ||
                        $sInput === $options)) ||
                    (is_array($options) && in_array($sInput, $options))) {
                    $_CONFIG['user'][$sKeyName] = $sInput; // In case an option was chosen that was not the default.
                    return true;
                }
                if (in_array($sVerifyType, array('lovd_path', 'path')) && !is_dir($sInput)) {
                    print('    Given path is not a directory.' . "\n");
                    break;
                } elseif (!is_readable($sInput)) {
                    print('    Cannot read given path.' . "\n");
                    break;
                }

                if ($sVerifyType == 'lovd_path') {
                    if (!file_exists($sInput . '/' . $_CONFIG['config_file'])) {
                        if (file_exists($sInput . '/src/' . $_CONFIG['config_file'])) {
                            $sInput .= '/src';
                        } else {
                            print('    Cannot locate ' . $_CONFIG['config_file'] . ' in given path.' . "\n" .
                                  '    Please check that the given path is a correct path to an LOVD installation.' . "\n");
                            break;
                        }
                    }
                    if (!is_readable($sInput . '/' . $_CONFIG['config_file'])) {
                        print('    Cannot read configuration file in given LOVD directory.' . "\n");
                        break;
                    }
                    // We'll set everything up later, because we don't want to
                    // keep the $_DB open for as long as the user is answering questions.
                }
                $_CONFIG['user'][$sKeyName] = $sInput;
                return true;

            default:
                return false;
        }
    }

    return false; // We'd actually never get here.
}





// We might be running for quite some time.
set_time_limit(0);





print('LOVD3 training database creator v' . $_CONFIG['version'] . '.' . "\n");

// Verify settings with user.
if (!lovd_verifySettings('lovd_master_path', 'Path of LOVD master installation to base installations on', 'lovd_path', '')) {
    die('  Failed to get LOVD path.' . "\n");
}
// Master directory should not be numeric, to prevent possible overlap with the children databases.
if (ctype_digit(basename($_CONFIG['user']['lovd_master_path']))) {
    die('  The LOVD master path can not be numeric,
    to prevent overlap with copied instances.' . "\n");
}
// Predict where we'll put the trainings databases.
$_CONFIG['user']['lovd_training_databases_path'] = realpath($_CONFIG['user']['lovd_master_path'] . '/' . $_CONFIG['default_relative_training_path']);
lovd_verifySettings('lovd_training_databases_path', 'Path where trainings databases will be created, or reset', 'path', '');
lovd_verifySettings('training_instances', 'Number of training databases to create', 'int', '1,' . $_CONFIG['maximum_training_instances']);
lovd_verifySettings('master_dump_file_overwrite', 'I\'m going to dump data into ' . $_CONFIG['master_dump_file'] . '. Overwrite file if exists? (Yes/No)', 'array', array('yes', 'no', 'y', 'n'));
$_CONFIG['user']['master_dump_file_overwrite'] = (in_array($_CONFIG['user']['master_dump_file_overwrite'], array('y', 'yes'))); // Turn into a boolean.

// Check if MySQL database dump already exists.
if (file_exists($_CONFIG['master_dump_file']) && !$_CONFIG['user']['master_dump_file_overwrite']) {
    die('  Dump file ' . $_CONFIG['master_dump_file'] . ' exists, and was requested not to overwrite.' . "\n");
}

// To create the dump, connect to the LOVD for its settings (easier than to parse the config.ini.php here, and find tables, etc.
// Find LOVD installation, run it's inc-init.php to get DB connection.
define('ROOT_PATH', $_CONFIG['user']['lovd_master_path'] . '/');
define('FORMAT_ALLOW_TEXTPLAIN', true);
$_GET['format'] = 'text/plain';
// To prevent notices when running inc-init.php.
$_SERVER = array_merge($_SERVER, array(
    'HTTP_HOST' => 'localhost',
    'REQUEST_URI' => '/' . basename(__FILE__),
    'QUERY_STRING' => '',
    'REQUEST_METHOD' => 'GET',
));
// If I put a require here, I can't nicely handle errors, because PHP will die if something is wrong.
// However, I need to get rid of the "headers already sent" warnings from inc-init.php.
// So, sadly if there is a problem connecting to LOVD, the script will die here without any output whatsoever.
ini_set('display_errors', '0');
ini_set('log_errors', '0'); // CLI logs errors to the screen, apparently.
require ROOT_PATH . 'inc-init.php';
ini_set('display_errors', '1'); // We do want to see errors from here on.

// Check if we have the FLUSH TABLES command, which is needed for the dump.
$bUseLOVDUser = (bool) $_DB->query('FLUSH TABLES', array(), false);

// If the LOVD's MySQL user does not have the proper privileges, ask the information from the user.
if (!$bUseLOVDUser) {
    print('  This LOVD\'s MySQL username does not have the proper privileges to create a database dump.' . "\n");
    while (!$_CONFIG['user']['mysql_username']) {
        lovd_verifySettings('mysql_username', '  MySQL username to use for the database dump', 'string', '');
    }
}

// Prepare dump file.
$f = fopen($_CONFIG['master_dump_file'], 'w');
fputs($f, 'SET FOREIGN_KEY_CHECKS=0; -- Necessary because we\'re dropping the tables and recreating them.' . "\n\n");
fclose($f);

// Prepare command to dump the tables.
// Note that the ORDER OF ARGUMENTS is extremely important. If --skip-opt is done last, part of the arguments are ignored.
$sCommand = 'mysqldump --skip-opt --add-drop-table --add-locks --create-options --disable-keys --flush-logs --order-by-primary --quick --set-charset --single-transaction' .
    ' --user ' . escapeshellarg(($_CONFIG['user']['mysql_username']? $_CONFIG['user']['mysql_username'] : $_INI['database']['username']));
if ($bUseLOVDUser) {
    $sCommand .= ' --password=' . escapeshellarg($_INI['database']['password']);
} else {
    // Let MySQL dump ask for a password.
    $sCommand .= ' -p';
}
$sCommand .= ' ' . escapeshellarg($_INI['database']['database']);

// Gather list of this LOVD's tables.
require ROOT_PATH . 'install/inc-sql-tables.php';
$aTables = array_map('constant', array_keys($aTableSQL));
sort($aTables); // Make it like a normal mysqldump file, which sorts the tables by name.
$sCommand .= ' ' . implode(' ', $aTables) . ' >> ' . escapeshellarg($_CONFIG['master_dump_file']);

// Dump the data!
print('  Creating an SQL dump of the master database...' . "\n" .
      '    '); // Putting a newline here, because mysqldump might ask for a password.
exec($sCommand, $aOutput, $nReturn);
if ($nReturn) {
    die('  Failed.
    Could not create database dump.' . "\n");
}

// Finish dump file.
$f = fopen($_CONFIG['master_dump_file'], 'a');
fputs($f, "\n" . 'SET FOREIGN_KEY_CHECKS=1;' . "\n");
fclose($f);

print('  OK!' . "\n");





// Write massive SQL file for all instances.
print('  Creating SQL dump for all instances... ');
$f = fopen($_CONFIG['full_dump_file'], 'w');
fputs($f, 'USE ' . $_INI['database']['database'] . "\n\n");
$sTemplate = file_get_contents($_CONFIG['master_dump_file']);

for ($i = 1; $i <= $_CONFIG['user']['training_instances']; $i++) {
    $i = str_pad($i, 2, '0', STR_PAD_LEFT);
    fputs($f, str_replace('master', $i, $sTemplate) . "\n\n\n");
}
fclose($f);
print('OK!' . "\n");





// Loop through instances, removing the original directory, copying
// master to this directory, and fix the config.ini.php file.
print('  Resetting directories...   ');
for ($i = 1; $i <= $_CONFIG['user']['training_instances']; $i++) {
    $i = str_pad($i, 2, '0', STR_PAD_LEFT);
    print(chr(8) . chr(8) . $i); // Backspace (x2), new dir name.
    $sDirName = $_CONFIG['user']['lovd_training_databases_path'] . '/' . $i;

    // Remove directory, if it exists.
    if (file_exists($sDirName)) {
        exec('rm -rf ' . $sDirName, $aOutput, $nReturn);
        if ($nReturn) {
            die("\n" . '    Failed.
      Could not remove directory ' . $sDirName . '.' . "\n");
        }
    }

    // Copy it from master.
    exec('cp -pr ' . $_CONFIG['user']['lovd_master_path'] . ' ' . $sDirName, $aOutput, $nReturn);
    if ($nReturn) {
        die("\n" . '    Failed.
      Could not copy master to ' . $sDirName . '.' . "\n");
    }

    // Modify the config.ini.php file. It's easier to take the one from master.
    exec('sed \'s/master/' . $i . '/\' ' . $_CONFIG['user']['lovd_master_path'] . '/' .
        $_CONFIG['config_file'] . ' > ' . $sDirName . '/' . $_CONFIG['config_file'],
        $aOutput, $nReturn);
    if ($nReturn) {
        die("\n" . '    Failed.
      Could not create ' . $_CONFIG['config_file'] . ' for ' . $sDirName . '.' . "\n");
    }
}
print(' OK!' . "\n");





// Finally, load in the MySQL dump file.
// Write massive SQL file for all instances.
print('  Loading SQL dump for all instances... ');
exec('mysql --user ' . escapeshellarg($_INI['database']['username']) .
    ' --password=' . escapeshellarg($_INI['database']['password']) .
    ' < ' . $_CONFIG['full_dump_file'], $aOutput, $nReturn);
if ($nReturn) {
    die('Failed.
    Could not load SQL dump.' . "\n");
}
print('OK!' . "\n" .
      'All Done!' . "\n\n");
?>
