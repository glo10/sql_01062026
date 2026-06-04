-- Suppression de la procédure stockée
DROP PROCEDURE calculerLaMoyenneSalaire;

-- Création d'une procédure stockée (idéale pour des tâches récurrentes et la maintenance
-- 1. Définir les frontières de la procédure stockée avec LANGUAGE plpgsql AS $$ 
-- Permet d'indiquer que l'ensemble de ce qui est à l'intérieur est un bloc d'instuctions à exécuter
-- 2. Exécuter vos instructions SQL (SELECT, INSERT, UPDATE, etc.)
CREATE PROCEDURE calculerLaMoyenneSalaire()
  LANGUAGE plpgsql AS $$ -- ici $$ délimiteur
  -- Début de la procédure
  BEGIN
    SELECT AVG(salaire)
    FROM employes;
    SELECT AVG(commission)
    FROM employes;
  END;
$$;

-- Appels de la procédure
CALL calculerLaMoyenneSalaire();
CALL calculerLaMoyenneSalaire();
CALL calculerLaMoyenneSalaire();

--- Procédure avec les paramètres
CREATE calculerLaMoyenneSalaireParTitre(titreRecherche VARCHAR(255))
  LANGUAGE plpgsql AS $$
  BEGIN
    SELECT AVG(salaire)
    FROM employes
    WHERE titre = titreRecherche;
    SELECT AVG(commission)
    FROM employes
    WHERE titre = titreRecherche;
    SELECT * FROM employes WHERE titre = titreRecherche;
  END;
$$;

CALL calculerLaMoyenneSalaireParTitre("Mme");
CALL calculerLaMoyenneSalaireParTitre("Mlle");
CALL calculerLaMoyenneSalaireParTitre("M.");