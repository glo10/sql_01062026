-- Avec les relations entre clés primaires et clés étrangères (FK)
--  Le SGBDR empêche de supprimer une table si celle-ci viole la contrainte d'intégrité sur les FK
--  Option 1 : Il faut donc supprimer les contraintes de FKs avant de supprimer les tables
--  L'avantage de les avoir nommées est de pouvoir les supprimer à partir de leur nom
--  Option 2 : Ou supprimer les tables dans le bon ordre lorsque c'est possible
--  Option 3 : Ou désactiver les contraintes FK avant de supprimer les tables
--      Avec MYSQL on peut désactivez les clés étrangères avec SET FOREIGN_KEY_CHECKS = 0; juste avant de faire les DROP TABLE
--      Avec SQL SERVER ALTER TABLE SCHEMA.PAYS  NOCHECK CONSTRAINT FK_PAYS_REEGION; GO
-- 1. Supprimez la table stockant les régions.
ALTER TABLE PAYS
DROP CONSTRAINT FK_PAYS_REGION;
DROP TABLE REGION;
-- 2. Supprimez la table stockant les pays.
ALTER TABLE LOCALISATION
DROP CONSTRAINT FK_LOCALISATION_PAYS;
DROP TABLE PAYS;
-- 3. Supprimez la table stockant les localisations.
DROP TABLE LOCALISATION;
