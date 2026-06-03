-- TEMOINS

SELECT quantite, nom_produit
FROM produits;

-- TOUS LES PRODUITS EN BOÎTE(S) => boîte au singulier ou boîtes au pluriel
-- Ici bouteille match avec le motif du LIKE
SELECT quantite, nom_produit
FROM produits
WHERE quantite LIKE '%bo_te%';
-- Pour exclure bouteille, il faut ajouter une nouvelle condition qui l'exclu
SELECT quantite, nom_produit
FROM produits
WHERE quantite LIKE '%bo_te%' AND quantite NOT LIKE '%bouteille%';