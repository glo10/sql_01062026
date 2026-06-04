-- Les jointures jusqu'à présent
SELECT nom_produit, nom_categorie
FROM produits p, categories c
WHERE p.code_categorie = c.code_categorie
AND c.code_categorie IN (1,2,3,4);

-- Autre syntaxe avec INNER JOIN (intersection = égalité PK et FK)
SELECT nom_produit, nom_categorie
FROM produits p
JOIN categories  c
ON p.code_categorie = c.code_categorie
WHERE c.code_categorie IN (1,2,3,4);

-- Jointure sur 3 Tables
SELECT nom_produit, nom_categorie
FROM produits p
INNER JOIN categories  c
ON p.code_categorie = c.code_categorie
JOIN fournisseurs f
ON f.no_fournisseur = p.no_fournisseur
WHERE c.code_categorie IN (1,2,3,4);

-- Jointure de gauche (LEFT JOIN) : garde toute la table de gauche ici tous les employés et pour les lignes où
-- la condition n'est pas vérifiée, il y aura NULL
SELECT emp.nom, emp.prenom, man.nom, man.prenom
FROM employes emp
LEFT JOIN employes man
ON emp.rend_compte = man.no_employe;

-- FULL JOIN : toutes les lignes de la table et gauche et toutes les lignes de la table de droite
-- NULL pour les colonnes à gauche et à droite ou il n'y a pas de correspondance
SELECT nom_categorie, nom_produit
FROM categories  c
FULL JOIN produits p
ON p.code_categorie = c.code_categorie;

-- NATURAL JOIN : Jointure sans indiquer la condition de jointure, la jointure s'effectue sur
-- la première colonne qui porte le même nom dans le deux tables
-- Ici code_categorie dans PRODUITS et code_categorie dans CATEGORIES
SELECT nom_categorie, nom_produit
FROM categories  c
NATURAL JOIN produits p;

-- CROSS JOIN : Produit cartésien = toutes les combinaisons possibles 
-- = Nb lignes d'une table * Nb lignes d'une autre table
SELECT nom_categorie, nom_produit
FROM categories  c
CROSS JOIN produits p;