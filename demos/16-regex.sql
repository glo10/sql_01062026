-- Supprimer les voyelles
SELECT REGEXP_REPLACE('Bonjour, c''est Glodie, on est vendredi',
'[aeiuoy]',
'');
-- PostgreSQL

-- Remplacer Glodie par Nathalie
SELECT REGEXP_REPLACE('Bonjour, c''est Glodie, on est vendredi',
'Glodie',
'Nathalie');
-- Récupérer les produits en boîte ou boîtes ou boite ou boites
SELECT nom_produit, quantite
FROM produits
WHERE REGEXP_LIKE(quantite, 'bo[iî]tes?');
-- PostgreSQL
SELECT nom_produit, quantite
FROM produits
WHERE quantite ~ 'bo[iî]tes?';
-- Récupérer la position de la première voyelle dans le nom du client
SELECT societe, REGEXP_INSTR(societe, '[aeiouy]')
FROM fournisseurs;
-- Compter le nombre caractère dans le nom de la societe
-- qui ne soit une voyelle
SELECT societe, REGEXP_COUNT(societe, '[^aeiuoy]')
FROM fournisseurs;