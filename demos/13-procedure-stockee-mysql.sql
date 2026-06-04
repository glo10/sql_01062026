-- Suppression de la procédure stockée
DROP PROCEDURE calculerLaMoyenneSalaire;
-- Création d'une procédure stockée (idéale pour des tâches recurrentes et la
-- maintenace)
-- 1. Définir les frontières de la porécédure stockée avec DELIMITER
-- Permet d'indiquer que l'ensemble de ce qui est à l'intérieur est un bloc d'instuctions
DELIMITER //
CREATE PROCEDURE calculerLaMoyenneSalaire()
-- Débit de la procédure
BEGIN
  SELECT AVG(salaire)
  FROM employes;
  SELECT AVG(commission)
  FROM employes;
END //
DELIMITER ;

-- Appel de la procédure

CALL calculerLaMoyenneSalaire();
CALL calculerLaMoyenneSalaire();
CALL calculerLaMoyenneSalaire();

--- Procédure avec les paramètres

-- Suppression de la procédure stockée
DROP PROCEDURE calculerLaMoyenneSalaire;
-- Création d'une procédure stockée (idéale pour des tâches recurrentes et la
-- maintenace)
-- 1. Définir les frontières de la porécédure stockée avec DELIMITER
-- Permet d'indiquer que l'ensemble de ce qui est à l'intérieur est un bloc d'instuctions
DELIMITER //
CREATE PROCEDURE calculerLaMoyenneSalaireParTitre(IN titreRecherche VARCHAR(255))
-- Débit de la procédure
BEGIN
  SELECT AVG(salaire)
  FROM employes
  WHERE titre = titreRecherche;
  SELECT AVG(commission)
  FROM employes
  WHERE titre = titreRecherche;
  SELECT * FROM employes WHERE titre = titreRecherche;
END //
DELIMITER ;

-- Appel de la procédure

CALL calculerLaMoyenneSalaireParTitre("Mme");
CALL calculerLaMoyenneSalaireParTitre("Mlle");
CALL calculerLaMoyenneSalaireParTitre("M.");