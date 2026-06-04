-- 1. Affichez les sociétés, adresse et villes de résidence pour tous les tiers de l’entreprise (clients et fournisseurs).
SELECT  societe,
        adresse,
        ville
FROM clients
UNION
SELECT  societe,
        adresse,
        ville
FROM fournisseurs
ORDER BY societe;
-- 2. Affichez toutes les commandes qui comportent en même temps des produits de catégorie 1 du fournisseur 1 et des produits de catégorie 2 du fournisseur 2.
-- Toutes les BDD
SELECT no_commande
FROM details_commandes dc, produits p
WHERE dc.ref_produit = p.ref_produit
AND code_categorie = 1
AND no_fournisseur = 1
AND no_commande IN (
    SELECT no_commande
    FROM details_commandes dc, produits p
    WHERE dc.ref_produit = p.ref_produit
    AND code_categorie = 2
    AND no_fournisseur = 2
);
-- ORACLE, SQL SERVER et POSTGRESQL
SELECT no_commande
FROM details_commandes dc, produits p 
WHERE dc.ref_produit = p.ref_produit
AND code_categorie = 1
AND no_fournisseur = 1
INTERSECT
SELECT no_commande
FROM details_commandes dc, produits p 
WHERE dc.ref_produit = p.ref_produit
AND code_categorie = 2
AND no_fournisseur = 2;