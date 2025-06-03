SELECT k.name AS Kundename, k.fk_ort_postleitzahl AS PLZ, o.name AS Ort
FROM kunden k
INNER JOIN orte o ON k.fk_ort_postleitzahl = o.id_postleitzahl;

SELECT k.name AS Kundename, o.name AS Ort
FROM kunden k
INNER JOIN orte o ON k.fk_ort_postleitzahl = o.id_postleitzahl
WHERE k.fk_ort_postleitzahl = '79312';

SELECT k.name AS Kundename, o.name AS Ort
FROM kunden k
INNER JOIN orte o ON k.fk_ort_postleitzahl = o.id_postleitzahl
WHERE o.name = 'Emmendingen';

SELECT k.name, o.name, o.einwohnerzahl
FROM kunden k
INNER JOIN orte o ON k.fk_ort_postleitzahl = o.id_postleitzahl
WHERE o.einwohnerzahl > 70000;

SELECT o.name
FROM orte o
WHERE o.einwohnerzahl < 1000000;

SELECT k.name, o.name
FROM kunden k
INNER JOIN orte o ON k.fk_ort_postleitzahl = o.id_postleitzahl
WHERE o.einwohnerzahl BETWEEN 100000 AND 1500000;

SELECT k.name, o.id_postleitzahl, o.name
FROM kunden k
INNER JOIN orte o ON k.fk_ort_postleitzahl = o.id_postleitzahl
WHERE k.name LIKE "%e" AND o.name LIKE "%u%" OR o.name LIKE "%r%";