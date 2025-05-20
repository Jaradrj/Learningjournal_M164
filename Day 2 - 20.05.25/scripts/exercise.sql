CREATE SCHEMA Personal;
USE Personal;

CREATE TABLE tbl_fahrer (
    ID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    Name VARCHAR(45) NOT NULL,
    Vorname VARCHAR(30) NOT NULL,
    Telefonnummer VARCHAR(45)
);

CREATE TABLE tbl_disponent (
    ID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    Name VARCHAR(45) NOT NULL,
    Vorname VARCHAR(45) NOT NULL,
    Telefonnummer VARCHAR(45)
);

CREATE TABLE tbl_Mitarbeiter (
    MA_ID INT PRIMARY KEY,
    Name VARCHAR(50),
    Vorname VARCHAR(30),
    Geburtsdatum DATETIME,
    Telefonnummer VARCHAR(12),
    Einkommen FLOAT(10,2)
);

ALTER TABLE tbl_Mitarbeiter 
    MODIFY Name VARCHAR(50) CHARACTER SET latin1,
    MODIFY Vorname VARCHAR(30) CHARACTER SET latin1;

ALTER TABLE tbl_fahrer 
    DROP COLUMN Name,
    DROP COLUMN Vorname,
    DROP COLUMN Telefonnummer;

ALTER TABLE tbl_disponent 
    DROP COLUMN Name,
    DROP COLUMN Vorname,
    DROP COLUMN Telefonnummer;

ALTER TABLE tbl_fahrer ADD COLUMN MA_ID INT;
ALTER TABLE tbl_disponent ADD COLUMN MA_ID INT;

ALTER TABLE tbl_fahrer 
    ADD CONSTRAINT fk_fahrer_mitarbeiter 
    FOREIGN KEY (MA_ID) REFERENCES tbl_Mitarbeiter(MA_ID) 
    ON DELETE CASCADE;

ALTER TABLE tbl_disponent 
    ADD CONSTRAINT fk_disponent_mitarbeiter 
    FOREIGN KEY (MA_ID) REFERENCES tbl_Mitarbeiter(MA_ID) 
    ON DELETE CASCADE;
