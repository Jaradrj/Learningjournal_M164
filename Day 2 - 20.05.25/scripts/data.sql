CREATE TABLE Person (
    person_id SERIAL PRIMARY KEY,
    vorname VARCHAR(50),
    nachname VARCHAR(50),
    geburtsdatum DATE
);

CREATE TABLE Ausweis (
    person_id INT,
    ausweisnummer VARCHAR(20),
    ausgestellt_am DATE,
    PRIMARY KEY (person_id),
    FOREIGN KEY (person_id) REFERENCES Person(person_id) ON DELETE CASCADE
);

CREATE TABLE Kleidungsstueck (
    kleidungsstueck_id SERIAL PRIMARY KEY,
    bezeichnung VARCHAR(100),
    farbe VARCHAR(30),
    person_id INT,
    FOREIGN KEY (person_id) REFERENCES Person(person_id) ON DELETE SET NULL
);
