USE buchladen;

SELECT l.name AS Lieferantenname, o.name AS Lieferantenort, o.postleitzahl
FROM lieferanten l
INNER JOIN orte o ON l.orte_orte_id = o.orte_id
WHERE o.name = 'Freiburg';

SELECT v.name AS Verlagsname, o.name AS Verlagsort
FROM verlage v
INNER JOIN orte o ON v.orte_orte_id = o.orte_id
WHERE o.name = 'München';

SELECT b.titel, b.erscheinungsjahr, v.name AS Verlagsname
FROM buecher b
INNER JOIN verlage v ON b.verlage_verlage_id = v.verlage_id
WHERE v.name = 'Assal'
ORDER BY b.erscheinungsjahr DESC;

SELECT b.titel, l.name AS Lieferantenname
FROM buecher b
INNER JOIN buecher_has_lieferanten bhl ON b.buecher_id = bhl.buecher_buecher_id
INNER JOIN lieferanten l ON bhl.lieferanten_lieferanten_id = l.lieferanten_id
WHERE l.name = 'Schustermann';

SELECT b.titel, s.bezeichnung AS Sparte
FROM buecher b
INNER JOIN buecher_has_sparten bhs ON b.buecher_id = bhs.buecher_buecher_id
INNER JOIN sparten s ON bhs.sparten_sparten_id = s.sparten_id
WHERE s.bezeichnung = 'Thriller'
ORDER BY b.titel;

SELECT b.titel, s.bezeichnung AS Sparte, v.name AS Verlagsname
FROM buecher b
INNER JOIN buecher_has_sparten bhs ON b.buecher_id = bhs.buecher_buecher_id
INNER JOIN sparten s ON bhs.sparten_sparten_id = s.sparten_id
INNER JOIN verlage v ON b.verlage_verlage_id = v.verlage_id
WHERE s.bezeichnung = 'Liebesroman'
ORDER BY b.titel ASC;

SELECT a.nachname, a.vorname, b.titel
FROM buecher b
INNER JOIN autoren_has_buecher bahb ON b.buecher_id = ahb.buecher_buecher_id
INNER JOIN autoren a ON ahb.autoren_autoren_id = a.autoren_id
WHERE a.vorname = 'Sabrina' AND a.nachname = 'Müller'
ORDER BY b.titel DESC;

SELECT CONCAT(a.vorname, ' ', a.nachname) AS Autorenname, b.titel, s.bezeichnung AS Sparte
FROM buecher b
INNER JOIN autoren_has_buecher ahb ON b.buecher_id = ahb.buecher_buecher_id
INNER JOIN autoren a ON ahb.autoren_autoren_id = a.autoren_id
INNER JOIN buecher_has_sparten bhs ON b.buecher_id = bhs.buecher_buecher_id
INNER JOIN sparten s ON bhs.sparten_sparten_id = s.sparten_id
WHERE a.vorname = 'Sabrina' AND a.nachname = 'Müller'
  AND s.bezeichnung = 'Thriller';