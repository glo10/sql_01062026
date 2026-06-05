SELECT titre, SUM(salaire)
FROM employes
GROUP BY titre;

-- Ici M. est exclu car il n'est pas présent dans le FOR IN
SELECT * 
FROM (
    SELECT titre, salaire
    FROM employes
) AS source
PIVOT (
    SUM(salaire) FOR titre IN ([DR.], [Mlle], [Mme.])
) AS pivotTable;