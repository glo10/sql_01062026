-- Suppression de la procédure stockée
DROP PROCEDURE calculerLaMoyenneSalaire;
-- Création d'une procédure stockée (idéale pour des tâches récurrentes et la maintenance)
-- 1. Définir les frontières de la porécédure stockée avec DELIMITER
-- Permet d'indiquer que l'ensemble de ce qui est à l'intérieur est un bloc d'instuctions
-- 2. Exécuter vos instructions SQL (SELECT, INSERT, UPDATE, etc.)
DELIMITER //
CREATE PROCEDURE calculerLaMoyenneSalaire()
-- Début de la procédure
BEGIN
  SELECT AVG(salaire)
  FROM employes;
  SELECT AVG(commission)
  FROM employes;
END //
DELIMITER ;

-- Appels de la procédure
CALL calculerLaMoyenneSalaire();
CALL calculerLaMoyenneSalaire();
CALL calculerLaMoyenneSalaire();

-- Suppression de la procédure stockée
DROP PROCEDURE calculerLaMoyenneSalaireParTitre;
--- Procédure avec les paramètres
DELIMITER //
CREATE PROCEDURE calculerLaMoyenneSalaireParTitre(IN titreRecherche VARCHAR(255))
-- Début de la procédure
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

CALL calculerLaMoyenneSalaireParTitre("Mme");
CALL calculerLaMoyenneSalaireParTitre("Mlle");
CALL calculerLaMoyenneSalaireParTitre("M.");