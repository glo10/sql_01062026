-- Exercice 0.5.1 : les fonctions dédiées aux chaînes et l’opérateur LIKE

-- 1. Affichez  les fournisseurs ayant « LTD » dans leur nom
SELECT societe
FROM fournisseurs
WHERE UPPER(societe) LIKE '%LTD%';
-- 2. Affichez les initiales des employés et les noms et prénoms en majuscules
SELECT CONCAT(LEFT(prenom,1), LEFT(nom,1)) AS Initiales,
       UPPER(prenom) AS prenom,
       UPPER(nom) AS prenom
FROM employes;
-- 3. Affichez les deux premiers chiffres du code postal des clients
SELECT societe, code_postal,
       SUBSTRING(code_postal, 1, 2) AS code_postal 
FROM clients;
-- OU
SELECT societe, code_postal, -- temoin
       LEFT(code_postal, 2) AS code_postal
FROM clients;
-- Pour ORACLE et PostgreSQL
SELECT societe, code_postal, -- temoin
       SUBSTR(code_postal, 1, 2) AS code_postal 
FROM clients;
-- 4. Affichez les clients français en remplaçant le 0 du numéro de téléphone par +33
SELECT  societe,
        telephone, -- temoin
        CONCAT('+33 ', SUBSTRING(telephone, 2)) AS Telephone
FROM    clients
WHERE   UPPER(pays) = 'FRANCE';
-- ORACLE et PostgreSQL
SELECT  societe,
        telephone, -- temoin
        CONCAT('+33 ', SUBSTR(telephone, 2)) AS Telephone
FROM    clients
WHERE   UPPER(pays) = 'FRANCE';