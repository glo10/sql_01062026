-- # Exercice 4.3 : lecture des données avec le tri

-- 1. Affichez le nom, prénom des employés triés par le nom de façon décroissante (Z vers A)
SELECT nom, prenom
FROM employes
ORDER BY nom DESC;
-- 2. Affichez toutes les sociétés et les villes des clients triées par le pays.
SELECT societe, ville, pays
FROM clients
ORDER BY pays;
-- 3. Affichez les sociétés, pays, villes des clients triés par pays et ville.
SELECT societe, pays, ville
FROM clients
ORDER BY 2, 3;
-- 4. Affichez le nom et commission des employés triés par commission.
-- SELON les SBGDR les NULL appraissent soit tout au début soit tout à la fin
SELECT nom, commission
FROM employes
ORDER BY commission DESC;