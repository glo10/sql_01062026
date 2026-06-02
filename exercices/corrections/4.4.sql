-- # Exercice 4.4 : lecture des données avec la suppression des doublons

-- 1. Affichez toutes les fonctions dans l'organisation (entreprise).
SELECT DISTINCT fonction
FROM employes
ORDER BY fonction;
-- 2. Affichez tous les pays de la clientèle.
SELECT DISTINCT pays
FROM clients
ORDER BY pays;
-- 3. Affichez toutes les villes de fournisseurs.
SELECT DISTINCT ville
FROM fournisseurs
ORDER BY ville;
-- 4. Affichez tous les titres des employés.
SELECT DISTINCT titre
FROM employes
ORDER BY titre;