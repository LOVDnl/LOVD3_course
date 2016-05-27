# LOVD3 course database creation
This repository contains the script to (re)build the LOVD3 course databases.
More generally speaking, it's a script that duplicates one LOVD3 database a certain number of times.
If the duplicates already exists, they are reset to the same status as the master copy.

### What you need
- One LOVD3 installation, with data preloaded, that you wish to duplicate.
  This is the master database.
- The master database must have "master" in its table prefix (`config.ini.php`),
   in its URL (`TABLE_CONFIG`) and optionally, in its LOVD signature (`TABLE_STATUS`).
- The `create_training_databases.php` script.

### How it works
Just run the `create_training_databases.php` script.
It is interactive, and will ask you where to find the LOVD3 installation to duplicate.
It will create a MySQL dump from it, copy the files as many times as you want and where you want,
 and load the SQL data in all copies.
The SQL that is loaded in, will have all instances of "master" replaced by a number.
