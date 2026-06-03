-- ATTENTION les fonctions associées à la transformation des dates peuvent retourner NULL si la date n'est pas au bon format
-- Résolution d'une date au mauvais format
-- Option 1 recommandé : Faire un ALTER TABLE pour modifier le type de colonne de VARCHAR en DATE mais attention si la base de données (BDD) est déjà peuplée (il y a des données)
--  La BDD refusera l'opération du coup il faudra opter pour l'option 2
-- Option 2 :
--  1. Créer une nouvelle colonne avec le type DATE
--  2. Faire un UPDATE pour donner à la nouvelle colonne la valeur de la colonne actuelle au bon format DATE YYYY-MM-DD
--  3. Supprimer l'ancienne colonne
--  4. Renommer la nouvelle colonne avec le nom de l'ancienne colonne

-- POSTGRESQL
-- AJOUT d'une date : avoir la date d'embauche + 6 mois
SELECT date_embauche, 
date_embauche + INTERVAL '6 month' "Bilan après 6 mois"
FROM employes;

-- Extraction du mois de la date : le mois de naissance des employés
SELECT date_naissance,
EXTRACT(MONTH FROM date_naissance) AS "Mois de naissance"
FROM employes;
-- Différence entre 2 dates : nombre de jour écoulé 
-- entre la date de commande et la date d'envoi
-- garder uniquement les commandes dont on dépasse 30 jours
SELECT date_envoi, date_commande, date_envoi - date_commande  AS "Nb jours écoulé avant livraison"
FROM commandes
WHERE (date_envoi - date_commande ) > 30;

-- MYSQL
-- AJOUT d'une date : avoir la date d'embauche + 6 mois
SELECT date_embauche, 
DATE_ADD(date_embauche,  INTERVAL 6 month) "Bilan après 6 mois"
FROM employes;

-- Extraction du mois de la date : le mois de naissance des employés
SELECT date_embauche, EXTRACT(MONTH FROM date_embauche) "Mois de naissance"
FROM employes;
-- Différence entre 2 dates : nombre de jour écoulé 
-- entre la date de commande et la date d'envoi
-- garder uniquement les commandes dont on dépasse 30 jours
SELECT DATEDIFF(date_envoi, date_commande)
FROM commandes
WHERE DATEDIFF(date_envoi, date_commande) > 30;

-- SQL SERVER
SELECT date_embauche, 
DATEADD(MONTH,  6, date_embauche) "Bilan après 6 mois"
FROM employes;
-- Extraction du mois de la date : le mois de naissance des employés
SELECT date_naissance,
DATEPART(MONTH, date_naissance) "Mois naissance avec DATEPART",
MONTH(date_naissance) "Mois de naissance avec MONTH"
FROM employes;
-- Différence entre 2 dates : nombre de jour écoulé 
-- entre la date de commande et la date d'envoi
-- garder uniquement les commandes dont on dépasse 30 jours
SELECT DATEDIFF(DAY, date_envoi, date_commande)
FROM commandes
WHERE DATEDIFF(DAY, date_envoi, date_commande) > 30;