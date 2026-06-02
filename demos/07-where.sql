-- Opérateurs  logique IN = est dans la liste des valeurs que je spécifie
SELECT societe, ville
FROM clients
WHERE ville IN ('Paris', 'Bordeaux', 'Lille', 'Toulouse');
-- On aurait pu écrire cette requête avec un OR mais trop long
SELECT societe, ville
FROM clients
WHERE ville = 'Paris' OR ville='Bordeaux' OR ville='Lille' OR ville='Toulouse';
-- Opérateurs  logique NOT IN => n'est pas dans la liste
SELECT societe, ville
FROM clients
WHERE ville NOT IN ('Paris', 'Bordeaux', 'Lille', 'Toulouse');
-- Opérateur BETWEEN adapté pour les dates et les chiffres
SELECT nom, prenom, salaire
FROM employes
WHERE salaire BETWEEN 2000 AND 5000;
-- Alternative ici pour le BETWEEN
SELECT salaire
FROM employes
WHERE salaire >= 2000 AND salaire <= 5000;

-- Opérateur NOT BETWEEN n'est pas dans l'intervale
SELECT nom, prenom, salaire, date_embauche
FROM employes
WHERE date_embauche NOT BETWEEN '2019-01-01' AND '2019-12-31';