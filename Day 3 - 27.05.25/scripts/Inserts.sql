CREATE TABLE kunden (
    kunde_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL, 
    vorname VARCHAR(255), 
    nachname VARCHAR(255), 
    land_id INT, 
    wohnort VARCHAR(255)
);

INSERT INTO kunden VALUES (NULL, 'Heinrich', 'Schmitt', 2, 'Zürich');
INSERT INTO kunden VALUES (NULL, 'Sabine', 'Müller', 2, 'Bern');
INSERT INTO kunden VALUES (NULL, 'Markus', 'Mustermann', 1, 'Wien');
INSERT INTO kunden (nachname) VALUES ('Maier');
INSERT INTO kunden (nachname, wohnort) VALUES ('Bulgur', 'Sirnach');
INSERT INTO kunden (vorname, nachname) VALUES ('Maria', 'Manta');
