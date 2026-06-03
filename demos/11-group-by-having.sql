-- La moyenne des salaires par titre
SELECT AVG(salaire), titre
FROM employes
GROUP BY titre, fonction;

-- La moyenne des salaires par titre et fonction en excluant les représentants
--  et en gardant uniquement les sous-groupes (titre, fonction) dont la moyenne des salaires dépassent (>=) 8k
SELECT AVG(salaire), titre, fonction, COUNT(titre), COUNT(fonction)
FROM employes
WHERE fonction NOT LIKE '%repr%'
GROUP BY titre, fonction
-- Having = condition sur les agrégats (sous-groupes, partions)
HAVING AVG(salaire) >= 8000;