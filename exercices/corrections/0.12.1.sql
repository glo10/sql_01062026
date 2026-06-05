-- 1. Affichez tous vos partenaires (clients et fournisseurs) avec le nom de la société, la ville 
--  et la catégorie (valeur client ou fournisseur) le tout trié par catégorie et nom de la société
SELECT societe, ville, pays, 'fournisseur' AS categorie
FROM fournisseurs 
UNION
SELECT societe, ville, pays, 'client' AS categorie
FROM clients
ORDER BY societe, pays;