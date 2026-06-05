-- Nombre de clients par ville et pays
SELECT COUNT(*) AS clients, pays, ville
FROM clients
GROUP BY pays, ville
ORDER BY clients DESC, ville;
-- Nombre de clients par pays et ville, puis par pays
SELECT COUNT(*) AS clients, pays, ville
FROM clients
GROUP BY ROLLUP(pays, ville)
ORDER BY 1 DESC, 2, 3;
-- Nombre de clients pays et ville, puis par pays, puis uniquement ville
SELECT COUNT(*) AS clients,
pays,
ville,
CASE WHEN GROUPING(pays) = 1 THEN 'Colonne genérée par CUBE()'
ELSE pays,
CASE WHEN GROUPING(ville) = 1 THEN 'Colonne genérée par CUBE()'
FROM clients
GROUP BY CUBE(pays, ville)
ORDER BY 1 DESC, 3, 2;