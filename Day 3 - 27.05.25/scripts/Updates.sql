UPDATE dvd_sammlung
SET regisseur = 'Etan Cohen'
WHERE regisseur = 'Cohen';

UPDATE dvd_sammlung
SET laenge_minuten = 120
WHERE film = 'Angst';

RENAME TABLE dvd_sammlung TO bluray_sammlung;

ALTER TABLE bluray_sammlung
ADD COLUMN preis DECIMAL(5,2);

DELETE FROM bluray_sammlung
WHERE film = 'Angriff auf Rom' AND regisseur = 'Steven Burghofer';

ALTER TABLE bluray_sammlung
CHANGE film kinofilme VARCHAR(255) NOT NULL;

ALTER TABLE bluray_sammlung
DROP COLUMN nummer;

DROP TABLE bluray_sammlung;