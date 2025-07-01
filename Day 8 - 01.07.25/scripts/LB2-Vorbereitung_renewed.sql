DROP DATABASE IF EXISTS `freifaecher`;

CREATE DATABASE `freifaecher` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `freifaecher`;

CREATE TABLE lehrperson (
  idlehrperson INT NOT NULL,
  name VARCHAR(45) NOT NULL,
  geburtsdatum VARCHAR(20) NULL,
  PRIMARY KEY (idlehrperson)
) ENGINE=InnoDB;

CREATE TABLE klasse (
  idklasse VARCHAR(5) NOT NULL,
  lehrperson_idlehrperson INT NOT NULL,
  PRIMARY KEY (idklasse),
  INDEX fk_klasse_lehrperson1_idx (lehrperson_idlehrperson),
  CONSTRAINT fk_klasse_lehrperson1 FOREIGN KEY (lehrperson_idlehrperson)
    REFERENCES lehrperson(idlehrperson)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE=InnoDB;

CREATE TABLE schueler (
  idschueler INT NOT NULL,
  name VARCHAR(45) NOT NULL,
  geburtsdatum VARCHAR(20) NULL,
  klasse_idklasse VARCHAR(5) NOT NULL,
  PRIMARY KEY (idschueler),
  INDEX fk_schueler_klasse1_idx (klasse_idklasse),
  CONSTRAINT fk_schueler_klasse1 FOREIGN KEY (klasse_idklasse)
    REFERENCES klasse(idklasse)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE=InnoDB;

CREATE TABLE freifach (
  idfreifach INT NOT NULL,
  beschreibung VARCHAR(45) NOT NULL,
  tag VARCHAR(45) NOT NULL,
  zimmer VARCHAR(45) NOT NULL,
  PRIMARY KEY (idfreifach)
) ENGINE=InnoDB;

CREATE TABLE schueler_has_freifach (
  schueler_idschueler INT NOT NULL,
  freifach_idfreifach INT NOT NULL,
  PRIMARY KEY (schueler_idschueler, freifach_idfreifach),
  INDEX fk_schueler_has_freifach_freifach1_idx (freifach_idfreifach),
  INDEX fk_schueler_has_freifach_schueler_idx (schueler_idschueler),
  CONSTRAINT fk_schueler_has_freifach_schueler FOREIGN KEY (schueler_idschueler)
    REFERENCES schueler(idschueler)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_schueler_has_freifach_freifach1 FOREIGN KEY (freifach_idfreifach)
    REFERENCES freifach(idfreifach)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE=InnoDB;

-- Reaktivieren von FK-Contraints
SET FOREIGN_KEY_CHECKS = 0;


-- CSV-Import

LOAD DATA LOCAL INFILE "C:/Projects/Learningjournal_M164/Day 8 - 01.07.25/scripts/lehrperson.csv"
INTO TABLE lehrperson
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(@idlehrperson_lp, @name_lp, @geb_lp)
SET
  idlehrperson = CAST(@idlehrperson_lp AS UNSIGNED),
  name = TRIM(@name_lp),
  geburtsdatum = NULLIF(TRIM(@geb_lp), '');

LOAD DATA LOCAL INFILE "C:/Projects/Learningjournal_M164/Day 8 - 01.07.25/scripts/klasse.csv"
INTO TABLE klasse
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(@idklasse, @lehrperson_idlehrperson)
SET
  idklasse = TRIM(@idklasse),
  lehrperson_idlehrperson = CAST(@lehrperson_idlehrperson AS UNSIGNED);

LOAD DATA LOCAL INFILE "C:/Projects/Learningjournal_M164/Day 8 - 01.07.25/scripts/schueler.csv"
INTO TABLE schueler
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(@idschueler_sc, @name_sc, @geb_sc, @klasse_sc)
SET
  idschueler = CAST(@idschueler_sc AS UNSIGNED),
  name = TRIM(@name_sc),
  geburtsdatum = NULLIF(TRIM(@geb_sc), ''),
  klasse_idklasse = TRIM(@klasse_sc);

LOAD DATA lOCAL INFILE "C:/Projects/Learningjournal_M164/Day 8 - 01.07.25/scripts/freifach.csv"
INTO TABLE freifach
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(@idfreifach, @beschreibung, @tag, @zimmer)
SET
  idfreifach = CAST(@idfreifach AS UNSIGNED),
  beschreibung = TRIM(@beschreibung),
  tag = TRIM(@tag),
  zimmer = TRIM(@zimmer);

LOAD DATA LOCAL INFILE "C:/Projects/Learningjournal_M164/Day 8 - 01.07.25/scripts/schueler_has_freifaecher.csv"
INTO TABLE schueler_has_freifach
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(@schueler_id, @freifach_id)
SET
  schueler_idschueler = CAST(@schueler_id AS UNSIGNED),
  freifach_idfreifach = CAST(@freifach_id AS UNSIGNED);

SET FOREIGN_KEY_CHECKS = 1;


-- Überprüfen von Redundanzen
SELECT name, geburtsdatum, COUNT(*)
FROM schueler
GROUP BY name, geburtsdatum
HAVING COUNT(*) > 1;

SELECT name, geburtsdatum, COUNT(*)
FROM lehrperson
GROUP BY name, geburtsdatum
HAVING COUNT(*) > 1;

SELECT beschreibung, tag, zimmer, COUNT(*)
FROM freifach
GROUP BY beschreibung, tag, zimmer
HAVING COUNT(*) > 1;

SELECT idklasse, lehrperson_idlehrperson, COUNT(*)
FROM klasse
GROUP BY idklasse, lehrperson_idlehrperson
HAVING COUNT(*) > 1;

SELECT schueler_idschueler, freifach_idfreifach, COUNT(*)
FROM schueler_has_freifach
GROUP BY schueler_idschueler, freifach_idfreifach
HAVING COUNT(*) > 1;

-- Überprüfen der richtigen Werte
SELECT *
FROM schueler;

SELECT *
FROM lehrperson;

SELECT *
FROM freifach;

SELECT *
FROM klasse;

SELECT *
FROM schueler_has_freifach;


-- Einfügen weiterer Daten (über mysqlimport im cmd)

SET FOREIGN_KEY_CHECKS = 0;

-- mysqlimport --local --user=root --password=passwort --host=localhost \
-- --fields-terminated-by=';' --lines-terminated-by='\r\n' \
-- --ignore-lines=1 \
-- freifaecher \
-- "C:/Projects/Learningjournal_M164/Day 8 - 01.07.25/scripts/schueler1.csv" \
-- "C:/Projects/Learningjournal_M164/Day 8 - 01.07.25/scripts/schueler_has_freifaecher1.csv" 


-- Abfragen

SELECT COUNT(DISTINCT shf.schueler_idschueler) AS Teilnehmerzahl
FROM freifach f
JOIN lehrperson l ON f.lehrperson_idlehrperson = l.idlehrperson
JOIN schueler_has_freifach shf ON f.idfreifach = shf.freifach_idfreifach
WHERE l.name = 'Sommer Inge';

SELECT k.idklasse AS Klasse, COUNT(DISTINCT shf.schueler_idschueler) AS Anzahl_Schueler
FROM klasse k
LEFT JOIN schueler s ON s.klasse_idklasse = k.idklasse
LEFT JOIN schueler_has_freifach shf ON s.idschueler = shf.schueler_idschueler
GROUP BY k.idklasse
ORDER BY k.idklasse;

SELECT DISTINCT s.name
FROM schueler s
JOIN schueler_has_freifach shf ON s.idschueler = shf.schueler_idschueler
JOIN freifach f ON shf.freifach_idfreifach = f.idfreifach
WHERE f.beschreibung IN ('Chor', 'Elektronik');


-- Ausgabe speichern
SELECT k.idklasse AS Klasse, COUNT(DISTINCT shf.schueler_idschueler) AS Anzahl_Schueler
INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/outfile.txt'
FIELDS TERMINATED BY ';' ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
FROM klasse k
LEFT JOIN schueler s ON s.klasse_idklasse = k.idklasse
LEFT JOIN schueler_has_freifach shf ON s.idschueler = shf.schueler_idschueler
GROUP BY k.idklasse
ORDER BY k.idklasse;

-- Backup (in CMD)
-- mysqldump -u root -p Freifaecher > C:/Projects/Learningjournal_M164/Day 7 - 24.06.25/scripts/freifaecher_backup.sql