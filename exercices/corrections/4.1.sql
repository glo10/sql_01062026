-- 1. Affichez tous les employés.
SELECT *
FROM employes;

-- 2. Affichez toutes les catégories
SELECT *
FROM categories;

-- 3. Affichez toutes les fonctions des employés.
SELECT fonction
FROM employes;

-- 4. Affichez chaque produit et sa valeur de stock. La valeur de stock étant le produit du prix unitaire avec l'unité de stock.
SELECT nom_produit,
       prix_unitaire,
       unites_stock,
       (prix_unitaire * unites_stock) AS valeur_stock
FROM produits;

-- 5. Affichez l'identité (en concaténant le titre, nom et prénom), la date d'embauche et la rémunération (somme du salaire et de la commission) de tous les employés.
SELECT CONCAT(titre, ' ', nom, ' ', prenom) AS identite,
       date_embauche,
       (salaire + commission) AS remuneration
FROM employes;