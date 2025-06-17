SHOW VARIABLES LIKE 'character_set_database';

CREATE DATABASE IF NOT EXISTS csv_import_demo DEFAULT CHARACTER SET utf8mb4;
USE csv_import_demo;

DROP TABLE IF EXISTS personen;
CREATE TABLE personen (
  id INT,
  vorname VARCHAR(100),
  nachname VARCHAR(100),
  geburtsdatum DATE,
  email VARCHAR(255),
  land VARCHAR(100)
);

LOAD DATA INFILE '/var/lib/mysql-files/personen.csv'
INTO TABLE personen
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT COUNT(*) FROM personen;

LOAD DATA INFILE '/var/lib/mysql-files/personen_DE.csv'
INTO TABLE personen
CHARACTER SET latin1
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

DELETE FROM personen;