-- 1. Affichez la masse salariale (uniquement les salaires) avec le total général et les sous-totaux par fonction.
SELECT fonction,
       SUM(salaire) AS masse_salariale
FROM employes
GROUP BY ROLLUP(fonction);
-- 2. Affichez la masse salariale (uniquement les salaires) avec le total générale, les sous-totaux par fonction et sous-totaux par titre en calculant toutes les combinaisons possibles.
SELECT fonction,
       titre,
       SUM(salaire) AS masse_salariale
FROM employes
GROUP BY CUBE(fonction, titre);
-- 3. Affichez la masse salariale (uniquement les salaires) avec les sous-totaux par fonction et le nombre de personne par fonction.
SELECT fonction,
       SUM(salaire) AS masse_salariale,
       COUNT(*) AS totalFonction
FROM employes
GROUP BY fonction;