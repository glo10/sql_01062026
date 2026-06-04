-- AVEC MYSQL

-- 1. En utilisant une procédure stockée, affichez le nom, prénom d'un employé ainsi que le nom et prénom de son supérieur
DROP PROCEDURE EmployeEtNPlus1;
DELIMITER //
CREATE PROCEDURE EmployeEtNPlus1()
BEGIN
    SELECT 
        e.nom AS Nom_Employe,
        e.prenom AS Prenom_Employe,
        s.nom AS Nom_Superieur,
        s.prenom AS Prenom_Superieur
    FROM employes e, employes s
    WHERE e.rend_compte = s.no_employe;
END //
DELIMITER ;
-- Exécution
CALL EmployeEtNPlus1();

-- 2. En utilisant une procédure stockée, retournez et affichez le total des salaires des employés.
DROP PROCEDURE TotalSalaires;
DELIMITER //
CREATE PROCEDURE TotalSalaires()
BEGIN
    SELECT SUM(salaire) AS total_salaires
    FROM employes;
END //
DELIMITER ;
-- Exécution
CALL TotalSalaires();

-- 3. En utilisant une procédure stockée, affichez la valeur de stock (prix * stock) de chaque produit.
DROP PROCEDURE ValeurStockProduits;
DELIMITER //
CREATE PROCEDURE ValeurStockProduits()
BEGIN
    SELECT 
        ref_produit,
        nom_produit,
        prix_unitaire,
        unites_stock,
        (prix_unitaire * unites_stock) AS Valeur_Stock
    FROM produits;
END //
DELIMITER ;
-- Exécution
CALL ValeurStockProduits();

-- 4. En utilisant une procédure stockée et un paramètre d’entrée, affichez la phrase  "[nom] [prénom] a une commission" ou " [nom] [prénom] n’a  pas de commission" selon la valeur de l’attribut commission.
DROP PROCEDURE VerifierCommission;
DELIMITER //
CREATE PROCEDURE VerifierCommission(IN p_no_employe INT)
BEGIN
    SELECT 
        CASE
            WHEN commission IS NOT NULL AND commission > 0 THEN CONCAT(nom, ' ', prenom, ' a une commission')
            ELSE CONCAT(nom, ' ', prenom, ' n''a pas de commission')
        END AS commission
    FROM employes
    WHERE no_employe = p_no_employe;
END //
DELIMITER ;
-- Exécutions
CALL VerifierCommission(1);
CALL VerifierCommission(3);
CALL VerifierCommission(6);
CALL VerifierCommission(2);
CALL VerifierCommission(5);