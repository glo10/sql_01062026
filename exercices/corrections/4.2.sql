-- 1. Affichez le nom des clients habitant Marseille
SELECT societe
FROM clients
WHERE ville='Marseille';

-- 2. Affichez tous les employés dirigés par l'employé ayant l'identifiant numéro 2
SELECT *
FROM employes
WHERE rend_compte=2;

-- 3. Affichez tous les employés qui ne sont pas des représentants
SELECT *
FROM employes
WHERE fonction NOT LIKE 'Repr_sentant%';

-- 4. Affichez tous les employés dont le salaire est en dessous de 3500 €
SELECT *
FROM employes
WHERE salaire<3500;

-- 5. Affichez toutes les fonctions qui n'ont pas de supérieur hiérarchique
SELECT DISTINCT fonction
FROM employes
WHERE rend_compte IS NULL;