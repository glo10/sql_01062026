-- DEMO concaténation
SELECT CONCAT('cet employé se nomme ', nom, ' ', prenom, ' et occupe la fonction ', fonction) AS 'Liste des employés' FROM employes;
-- DEMO concaténation avec postgreSQL
-- Alias avec des guillemets et possible d'utiliser ||
SELECT CONCAT('cet employé se nomme ', nom, ' ', prenom, ' et occupe la fonction ', fonction) AS "Liste des employés" FROM employes;
SELECT 'cet employé se nomme ' || nom || ' ' || prenom || ' et occupe la fonction ' || fonction AS "Liste des employés" FROM employes;

