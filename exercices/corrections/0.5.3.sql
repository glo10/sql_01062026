-- Exercice 0.5.3 : manipulations des dates

-- 1. Affichez les années d’embauche des employés en ne gardant uniquement les 2 derniers chiffres de l’année (par exemple 1993-12-08 donnera le résultat 93)
SELECT 
    nom,
    prenom,
    date_embauche,
    RIGHT(YEAR(date_embauche), 2) AS AnneeEmbauche
FROM employes;
-- 2. Affichez la date de naissance des employés au format français
SELECT 
    nom,
    prenom,
    TO_CHAR(date_naissance, 'DD/MM/YYYY')
FROM employes;
-- 3. Affichez l'âge à laquelle chaque employé a été embauché en vous basant sur le calcul de l’ancienneté.
SELECT 
    prenom,
    nom,
    date_embauche,
    DATEDIFF(YEAR, date_naissance, date_embauche) AS AgeEmbauche
FROM Employees;