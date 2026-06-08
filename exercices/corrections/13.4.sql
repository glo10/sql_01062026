-- Exercice 13.4 : ROLLUP() et CUBE()
-- 1. Affichez le total des commissions par fonction, lorsqu'une fonction n'a pas de commission, affichez la phrase "Pas de commission"
SELECT 
    CASE 
        WHEN GROUPING(fonction) = 1 THEN 'TOTAL GENERAL'
        ELSE fonction
    END AS fonction,
    CASE 
        WHEN commission IS NULL THEN 'Pas de commission'
        ELSE SUM(commission)
    END AS totalCommission
FROM employes
GROUP BY ROLLUP(fonction);