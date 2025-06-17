-- Teil 1

SELECT * FROM buecher
WHERE verkaufspreis = (
  SELECT MAX(verkaufspreis) FROM buecher
);

SELECT * FROM buecher
WHERE verkaufspreis = (
  SELECT MIN(verkaufspreis) FROM buecher
);

SELECT * FROM buecher
WHERE einkaufspreis > (
  SELECT AVG(einkaufspreis) FROM buecher
);

SELECT * FROM buecher
WHERE einkaufspreis > (
  SELECT AVG(b.einkaufspreis)
  FROM buecher b
  JOIN buecher_has_sparten bs ON b.buecher_id = bs.buecher_buecher_id
  JOIN sparten s ON s.sparten_id = bs.sparten_sparten_id
  WHERE s.bezeichnung = 'Thriller'
);

SELECT b.* FROM buecher b
JOIN buecher_has_sparten bs ON b.buecher_id = bs.buecher_buecher_id
JOIN sparten s ON s.sparten_id = bs.sparten_sparten_id
WHERE s.bezeichnung = 'Thriller'
  AND b.einkaufspreis > (
    SELECT AVG(b2.einkaufspreis)
    FROM buecher b2
    JOIN buecher_has_sparten bs2 ON b2.buecher_id = bs2.buecher_buecher_id
    JOIN sparten s2 ON s2.sparten_id = bs2.sparten_sparten_id
    WHERE s2.bezeichnung = 'Thriller'
);

SELECT * FROM buecher
WHERE (verkaufspreis - einkaufspreis) > (
  SELECT AVG(verkaufspreis - einkaufspreis)
  FROM buecher
  WHERE buecher_id <> 22
);

-- Teil 2

SELECT SUM(avg_preis) AS summe_avg_einkaufspreis
FROM (
  SELECT s.bezeichnung, AVG(b.einkaufspreis) AS avg_preis
  FROM buecher b
  JOIN buecher_has_sparten bs ON b.buecher_id = bs.buecher_buecher_id
  JOIN sparten s ON bs.sparten_sparten_id = s.sparten_id
  WHERE s.bezeichnung <> 'Humor'
  GROUP BY s.bezeichnung
  HAVING avg_preis > 10
) AS spartendurchschnitt;

SELECT COUNT(*) AS bekannte_autoren
FROM (
  SELECT a.autoren_id, a.vorname, a.nachname, COUNT(*) AS anzahl_buecher
  FROM autoren a
  JOIN autoren_has_buecher ab ON a.autoren_id = ab.autoren_autoren_id
  GROUP BY a.autoren_id
  HAVING COUNT(*) > 4
) AS bekannte;

SELECT *
FROM (
  SELECT v.name, AVG(b.verkaufspreis - b.einkaufspreis) AS avg_gewinn
  FROM buecher b
  JOIN verlage v ON b.verlage_verlage_id = v.verlage_id
  GROUP BY v.name
  HAVING AVG(b.verkaufspreis - b.einkaufspreis) < 10
) AS gewinnarme_verlage
WHERE avg_gewinn >= 7;
