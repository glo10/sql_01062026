-- Nombre de clients par ville et pays
SELECT COUNT(*) AS clients, pays, ville
FROM clients
GROUP BY pays, ville
ORDER BY clients DESC, ville;
-- Nombre de clients par pays et ville, puis par pays
SELECT COUNT(*) AS clients, pays, ville
FROM clients
GROUP BY ROLLUP(pays, ville) -- Utilisation totale du ROLLUP cad rien dans le GROUP BY
ORDER BY 1 DESC, 2, 3;
-- Nombre de clients pays et ville, puis par pays, puis uniquement ville avec la gestion des NULLs
SELECT COUNT(*) AS clients,
-- GROUPING retourne 1 si NULL virtuel est crée par le calcul de la fonction CUBE 0 si c'est un NULL réel cad absence de valeur pour cette colonne
CASE WHEN GROUPING(pays) = 1 THEN 'NULL virtuel par CUBE()'
ELSE pays END,
CASE WHEN GROUPING(ville) = 1 THEN 'NULL virtuel par CUBE()'
ELSE ville END
FROM clients
GROUP BY CUBE(pays, ville)
ORDER BY 1 DESC, 3, 2;
-- Utilisation totale VS utilisation partielle
-- TOTAL GROUP BY ROLLUP(pays, ville)
-- Partielle GROUP BY pays ROLLUP(ville)