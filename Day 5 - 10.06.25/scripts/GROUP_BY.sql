SELECT COUNT(s.id) AS "Anzahl", s.nationalitaet AS "Nationalität"
FROM schueler s
GROUP BY s.nationalitaet;

SELECT o.name AS "Ort", COUNT(s.id) AS "Anzahl der Schüler"
FROM schueler s 
INNER JOIN orte o ON s.idOrte = o.id
GROUP BY o.name
ORDER BY `Anzahl der Schüler` DESC;

SELECT f.fachbezeichnung AS "Fachbezeichnung", COUNT(l.id) AS "Anzahl"
FROM lehrer l 
INNER JOIN lehrer_hat_faecher lhf ON l.id = lhf.idLehrer
INNER JOIN faecher f ON lhf.idFaecher = f.id
GROUP BY f.fachbezeichnung
ORDER BY `Anzahl` DESC;

SELECT f.fachbezeichnung AS "Fachbezeichnung", l.name AS "Lehrerliste"
FROM lehrer l
INNER JOIN lehrer_hat_faecher lhf ON l.id = lhf.idLehrer
INNER JOIN faecher f ON lhf.idFaecher = f.id
GROUP BY f.fachbezeichnung, l.name
ORDER BY COUNT(l.id) DESC;

SELECT f.fachbezeichnung AS "Fachbezeichnung", GROUP_CONCAT(l.name SEPARATOR ', ') AS "Lehrerliste"
FROM lehrer l
INNER JOIN lehrer_hat_faecher lhf ON l.id = lhf.idLehrer
INNER JOIN faecher f ON lhf.idFaecher = f.id
GROUP BY f.fachbezeichnung
ORDER BY COUNT(DISTINCT l.id) DESC;
