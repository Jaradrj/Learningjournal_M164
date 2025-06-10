SELECT MIN(l.gehalt), MAX(l.gehalt)
FROM lehrer l;

SELECT l.gehalt
FROM lehrer l
INNER JOIN lehrer_hat_faecher lhf ON l.id = lhf.idLehrer
INNER JOIN faecher f ON lhf.idFaecher = f.id
WHERE f.fachbezeichnung = "Mathematik"
ORDER BY gehalt 
LIMIT 1;

SELECT (s.noteMathe + s.noteDeutsch) / 2 AS avgNote
FROM schueler s
ORDER BY avgNote DESC
LIMIT 1;


SELECT MIN(o.einwohnerzahl) AS "Niedringste Einwohnerzahl", MAX(o.einwohnerzahl) AS "Höchste Einwohnerzahl"
FROM orte o;

SELECT (MAX(o.einwohnerzahl) - MIN(o.einwohnerzahl)) AS "Differenz"
FROM orte o;

SELECT COUNT(s.id)
FROM schueler s;

SELECT COUNT(s.id)
FROM schueler s
WHERE s.idSmartphones IS NOT NULL;

SELECT COUNT(s.id)
FROM schueler s
INNER JOIN smartphones sp ON s.idSmartphones = sp.id
WHERE s.idSmartphones IS NOT NULL
AND (sp.marke = "Samsung" OR sp.marke = "HTC");

SELECT COUNT(s.id)
FROM schueler s
INNER JOIN orte o ON s.idOrte = o.id
WHERE o.name = "Waldkirch";

SELECT COUNT(s.id)
FROM schueler s
INNER JOIN orte o ON s.idOrte = o.id
INNER JOIN lehrer_hat_schueler lhs ON s.id = lhs.idSchueler
INNER JOIN lehrer l ON lhs.idLehrer = l.id
WHERE o.name = "Emmendingen"
AND l.name = "Bohnert";

SELECT COUNT(s.id)
FROM schueler s
INNER JOIN lehrer_hat_schueler lhs ON s.id = lhs.idSchueler
INNER JOIN lehrer l ON lhs.idLehrer = l.id
WHERE l.name = "Zelawat";

SELECT COUNT(s.id)
FROM schueler s
INNER JOIN lehrer_hat_schueler lhs ON s.id = lhs.idSchueler
INNER JOIN lehrer l ON lhs.idLehrer = l.id
WHERE l.name = "Zelawat"
AND s.nationalitaet = "Russland";

SELECT l.name
FROM lehrer l
ORDER BY gehalt DESC
LIMIT 1;