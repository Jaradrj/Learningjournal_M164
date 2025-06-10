SELECT * FROM kunden AS kundenliste 
WHERE kundenliste.ort_postleitzahl > 80000;

SELECT o.name, k.name FROM kunden AS k
INNER JOIN orte o ON k.ort_postleitzahl = o.postleitzahl
WHERE o.name LIKE '%n' AND o.postleitzahl = k.ort_postleitzahl;

SELECT hrgs.kunde_id, hrgs.name, prfz.name FROM kunden AS hrgs 
INNER JOIN orte AS prfz 
ON prfz.postleitzahl = hrgs.ort_postleitzahl 
ORDER BY hrgs.kunde_id;

SELECT k.name, o.postleitzahl, o.name FROM kunden AS k, orte AS o
WHERE k.name LIKE '%a%' AND o.name LIKE '%u%' AND k.ort_postleitzahl = o.postleitzahl;

