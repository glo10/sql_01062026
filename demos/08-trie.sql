
-- Trie d'abord le prénom de A à Z puis le nom de A à Z
SELECT *
FROM employes
WHERE rend_compte=2
ORDER BY prenom, nom;

-- Trie les titres de Z à A
SELECT *
FROM employes
WHERE fonction NOT LIKE 'Repr_sentant%'
ORDER BY titre DESC;

-- Trie d'abord les fonctions de A à Z puis les noms de A à Z
SELECT nom, prenom, fonction
FROM employes
WHERE salaire<3500
ORDER BY 3, 1;
