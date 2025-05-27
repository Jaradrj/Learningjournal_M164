USE meine_datenbank;

CREATE TABLE IF NOT EXISTS tbl_Orte (
  OrtID INT AUTO_INCREMENT PRIMARY KEY,
  Ortsname VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS tbl_Fahrten (
  FahrtID INT AUTO_INCREMENT PRIMARY KEY,
  FahrtName VARCHAR(100) NOT NULL
);

ALTER TABLE tbl_Fahrten
  ADD COLUMN StartOrtID INT,
  ADD CONSTRAINT FK_Fahrten_StartOrt FOREIGN KEY (StartOrtID) REFERENCES tbl_Orte(OrtID);

ALTER TABLE tbl_Fahrten
  ADD COLUMN ZielOrtID INT,
  ADD CONSTRAINT FK_Fahrten_ZielOrt FOREIGN KEY (ZielOrtID) REFERENCES tbl_Orte(OrtID);

CREATE TABLE IF NOT EXISTS tbl_Fahrten_Orte (
  FahrtID INT,
  OrtID INT,
  Reihenfolge INT, -- z.B. Reihenfolge der Stopps
  PRIMARY KEY (FahrtID, OrtID),
  FOREIGN KEY (FahrtID) REFERENCES tbl_Fahrten(FahrtID),
  FOREIGN KEY (OrtID) REFERENCES tbl_Orte(OrtID)
);

CREATE TABLE IF NOT EXISTS tbl_Mitarbeiter (
  MitarbeiterID INT AUTO_INCREMENT PRIMARY KEY,
  Name VARCHAR(100) NOT NULL,
  VorgesetzterID INT NULL,
  CONSTRAINT FK_Mitarbeiter_Vorgesetzter FOREIGN KEY (VorgesetzterID) REFERENCES tbl_Mitarbeiter(MitarbeiterID)
);

CREATE TABLE IF NOT EXISTS tbl_Mitarbeiter_Vorgesetzte (
  MitarbeiterID INT NOT NULL,
  VorgesetzterID INT NOT NULL,
  PRIMARY KEY (MitarbeiterID, VorgesetzterID),
  FOREIGN KEY (MitarbeiterID) REFERENCES tbl_Mitarbeiter(MitarbeiterID),
  FOREIGN KEY (VorgesetzterID) REFERENCES tbl_Mitarbeiter(MitarbeiterID)
);

