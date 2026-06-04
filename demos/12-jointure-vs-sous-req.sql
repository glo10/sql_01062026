-- EXPLAIN montre le plan d'exécution pour obtenir le résultat final
-- Généralement pour un même résultat, une sous-requête sera plus rapide qu'une jointure
-- Trouvez les produits de la catégorie Boissons
EXPLAIN SELECT nom_produit
FROM produits p, categories c
WHERE p.code_categorie = c.code_categorie
AND UPPER(nom_categorie) = 'BOISSONS';

-- Trouvez exactement le même résultat en utilisant une sous-requête
EXPLAIN SELECT nom_produit
FROM produits
WHERE code_categorie = (
 SELECT code_categorie
 FROM categories
 WHERE LOWER(nom_categorie) = 'boissons'
);