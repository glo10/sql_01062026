-- Exercice 0.4.1 : les fonctions d'agrégations

-- 1. Affichez la moyenne des salaires et la moyenne des commissions.
SELECT  AVG(salaire) AS "moyenne salaire",
        AVG(commission) AS "moyenne commission"
FROM employes;
-- 2. Affichez le salaire maximum et le salaire minimale.
SELECT MAX(salaire) AS "le mieux payé",
	MIN(salaire) AS "le moins bien payé"
FROM employes;
-- 3. Affichez le nombre total des fonctions distinctes des employés.
SELECT COUNT(DISTINCT fonction)
FROM employes;
-- 4. Affichez la masse salariale des employés (total des salaires + total des commissions).
-- Attention pour les calculs les NULL faussent les résultats
--  1 employé avec un salaire et sans commission ne sera pas pris en compte dans le calcul
--  parce que la BDD ne sait pas addition une valeur avec un NULL donc il donnera NULL comme résultat
--  donc perte du salaire dans le calcul
--  Même raisonnement pour un employé avec un salaire et sans commission
-- Fonctionnement de COALESCE : 
--  Si la valeur n'est pas NULL, elle est prise
--  Sinon (valeur est NULL), ici arbitrement on met 0, mais vous pouvez mettre ce que vous voulez comme valeur pour la valeur par défaut
SELECT SUM(salaire) + SUM(commission) AS "Avec des sommes distinctes",
SUM(salaire+commission) AS "Avec somme du salaire+commission",
SUM(COALESCE(salaire, 0)) + SUM(COALESCE(commission, 0)) "Total charges avec COALESCE",
SUM(COALESCE(salaire,0) + COALESCE(commission,0)) "Total charges avec COALESCE"
FROM employes;