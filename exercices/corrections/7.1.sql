-- 1. Affichez tous les produits pour lesquels la quantité en stock est inférieure à la moyenne des quantités en stock.
SELECT nom_produit
FROM produits
WHERE unites_stock < (
	SELECT AVG(unites_stock)
	FROM produits
);
-- 2. Affichez les produits pour lesquels la quantité en stock est supérieure à la quantité en stock de tous les produits de catégorie 3.
SELECT ref_produit
FROM produits
WHERE unites_stock > (
	SELECT MAX(unites_stock) 
	FROM produits
	WHERE code_categorie = 3
);
-- Ou bien
SELECT ref_produit
FROM produits
WHERE unites_stock > ALL (
	SELECT unites_stock
	FROM produits
	WHERE code_categorie = 3
);
-- 3. Affichez la liste des produits que les clients parisiens ne commandent pas.
-- Toutes bases de données
SELECT ref_produit
FROM produits
WHERE ref_produit NOT IN (
	SELECT ref_produit
	FROM details_commandes dc, commandes cmd, clients cl
	WHERE dc.no_commande = cmd.no_commande
	AND cmd.code_client = cl.code_client
	AND LOWER(ville) = "paris"
);
-- ORACLE
SELECT ref_produit
FROM produits
MINUS
SELECT ref_produit
FROM details_commandes dc, commandes cmd, clients cl
WHERE dc.no_commande = cmd.no_commande
AND cmd.code_client = cl.code_client
AND UPPER(ville) = 'PARIS';
-- SQL SERVER et POSTGRESQL
SELECT ref_produit
FROM produits
EXCEPT
SELECT ref_produit
FROM details_commandes dc, commandes cmd, clients cl
WHERE dc.no_commande = cmd.no_commande
AND cmd.code_client = cl.code_client
AND LOWER(ville) = 'paris';
-- 4. Affichez toutes les commandes pour lesquelles les frais de ports dépassent la moyenne des frais de ports pour ce client.
SELECT code_client, no_commande, PORT
FROM commandes c 
WHERE PORT > (
	SELECT AVG(PORT) AS moyenne
	FROM commandes b
	WHERE c.code_client = b.code_client
)
ORDER BY PORT DESC;