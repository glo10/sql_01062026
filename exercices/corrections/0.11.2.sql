-- 1. Affichez tous les produits en boîte[s]
SELECT *
FROM produits
WHERE REGEXP_LIKE(quantite, 'bo[iî]te[s]?');-- boite ou boîte et la lettre s est facultative
-- PostgreSQL
SELECT *
FROM produits
WHERE quantite ~ 'bo[iî]te[s]?';
-- MYSQL v8+
SELECT *
FROM produits
WHERE quantite REGEXP 'bo[iî]te[s]?';-- boite ou boîte et la lettre s est facultative
-- 2. A partir d'un e-mail en dur dans votre requête et au format conventionnel, affichez uniquement le domaine cet email (ce qui vient après le @).
SELECT REGEXP_SUBSTR('clara.dupont@monentreprise.com', '@(.+)$') AS domaine ;
SELECT REGEXP_REPLACE('clara.dupont@monentreprise.com', '^.*@', '') AS domaine; -- suppression(remplacer par du vide) pour tout ce qui est avant le @
-- PostgreSQL
SELECT REGEXP_MATCH('clara.dupont@monentreprise.com', '@(.+)$') AS domaine ;
-- ORACLE
SELECT REGEXP_SUBSTR('clara.dupont@monentreprise.com', '@([a-zA-Z0-9.-]+)', 1, 1, NULL, 1) AS domaine
FROM dual;
-- 3. Affichez les numéros de téléphone des clients en supprimant tous les caractères qui ne sont pas des chiffres (les tirets, espaces, parenthèses, etc.)
SELECT REGEXP_REPLACE(telephone, '[^0-9]', '') AS telephone_nettoye
FROM clients;
-- 4. Affichez le nombre d'espace, tirets ou parenthèses présents dans les numéros de téléphones des fournisseurs
SELECT telephone,
       -- \ pour échapper un caractère que la structure des regex utilise parce qu'on doit l'utiliser dans notre expression
       LENGTH(REGEXP_REPLACE(telephone, '[^\\-() ]', '')) AS totalAutresQueChiffres1,
       LENGTH(REGEXP_REPLACE(telephone, '[0-9]', '')) AS totalAutresQueChiffres2,
       REGEXP_COUNT(telephone, '[^\\-() ]', 1) AS totalAutresQueChiffres3
FROM fournisseurs;
