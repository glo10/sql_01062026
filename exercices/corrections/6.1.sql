-- 1. Affichez les fonctions où il y a qu'un seul employé.
SELECT fonction, COUNT(fonction)
FROM employes
GROUP BY fonction
HAVING COUNT(fonction)=1;
-- 2. Affichez les commandes dont le montant de la commande dépasse 5000 €.
SELECT no_commande,
       ROUND(SUM(prix_unitaire * quantite * (1 - remise))) AS totalCommande
FROM details_commandes
GROUP BY no_commande
HAVING SUM(prix_unitaire * quantite * (1 - remise)) > 5000
ORDER BY totalCommande DESC;
-- 3. Affichez les pays où il y a au moins 3 fournisseurs.
SELECT pays,
       COUNT(no_fournisseur) AS NombreFournisseurs
FROM fournisseurs
GROUP BY pays
HAVING COUNT(no_fournisseur) >= 3;
-- 4. Affichez la somme de chaque unités d'emballage (quantité) regroupé par quantité. 
SELECT quantite as emballage,
       COUNT(quantite) AS "Nb produit par emballage",
       SUM(unites_stock) AS totalStock
FROM produits
GROUP BY quantite;
-- 5. Affichez la valeur des produits en stock et la valeur des produits commandés par fournisseur, pour les fournisseurs qui ont un numéro compris entre 3 et 6.
SELECT no_fournisseur,
	SUM(prix_unitaire * COALESCE(unites_stock, 0)) AS "EN STOCK",
	SUM(prix_unitaire * COALESCE(unites_commandees, 0)) AS "VENDU"
FROM produits
WHERE no_fournisseur BETWEEN 3 and 6
GROUP BY no_fournisseur;
-- 6. Affichez le montant de chaque commande, en ne conservant que les commandes qui comportent plus de 5 références de produit regroupé par le numéro de commande.
SELECT no_commande,
       SUM(prix_unitaire * quantite * (1 - remise)) AS MontantCommande,
       COUNT(ref_produit) AS NbProduits
FROM details_commandes
GROUP BY no_commande
HAVING COUNT(ref_produit) > 5;