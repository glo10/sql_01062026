-- # Exercice 0.5.2 : transformation des dates

-- 1. Affichez le nom, prénom, âge et l’ancienneté des employés en année triés par du plus ancien au plus récent.
-- Majorité des SGBDR avec quelques adaptations à faire au niveau des noms des fonctions ou l'ordre des paramètres
SELECT nom,
  prenom,
  DATE_PART('YEAR', AGE(CURRENT_DATE, date_naissance)) AS age,
  EXTRACT(
    'YEAR'
    FROM AGE(CURRENT_DATE, date_embauche)
  ) AS anciennete
FROM employee
ORDER BY anciennete DESC;
-- MYSQL
SELECT 
   nom,
   prenom,
   TIMESTAMPDIFF(YEAR, date_naissance, CURDATE()) AS age,
   TIMESTAMPDIFF(YEAR, date_embauche, CURDATE()) AS anciennete
FROM employes
ORDER BY anciennete DESC;
-- MYSQL autre manière
SELECT nom,
   prenom,
   DATEDIFF(current_date, date_naissance) / 365.25 AS age,
   DATEDIFF(current_date, date_embauche) / 365.25 AS anciennete
FROM employes
ORDER BY anciennete DESC;
-- ORACLE :
SELECT nom,
   prenom,
   FLOOR((sysdate - date_naissance) / 365.25) AS age,
   FLOOR((sysdate - date_embauche) / 365.25) AS anciennete
FROM employes
ORDER BY anciennete DESC;
-- POSTGRES :
SELECT nom,
   prenom,
   FLOOR((current_date - date_naissance) / 365.25) AS age,
   FLOOR((current_date - date_embauche) / 365.25) AS anciennete
FROM employes
ORDER BY anciennete DESC;
-- SQL Server :	
SELECT nom,
   prenom,
   DATEDIFF(
      day,
      date_naissance,
      getdate()
   ) / 365.25 AS age,
   DATEDIFF(
      day,
      date_embauche,
      getdate()
   ) / 365.25 AS anciennete
FROM employes
ORDER BY anciennete DESC;
-- 2. Affichez les délais de traitement d’une commande en jours (différence entre la date d’envoi et la date de la commande) triées par les délais du moins long au plus long.
SELECT 
      no_commande,
      date_commande,
      date_envoi,
      DATEDIFF(date_envoi, date_commande) AS delai_traitement_jours
FROM commandes
ORDER BY delai_traitement_jours;