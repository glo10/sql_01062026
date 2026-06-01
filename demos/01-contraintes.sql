USE demo;
CREATE TABLE DEPARTEMENT(
 id_dept INT(2) NOT NULL,
 nom_dept VARCHAR(255) NOT NULL
);
-- Ajout d'une contrainte de clé primaire PK directement dans la création de table
CREATE TABLE EMPLOYES(
  no_employe int(6) NOT NULL PRIMARY KEY,
  nom varchar(50) NOT NULL,
  prenom varchar(50) NOT NULL,
  email varchar(50),
  date_naissance date
);
-- Autre option le faire en déhors avec un ALTER TABLE
CREATE TABLE EMPLOYES(
  no_employe int(6) NOT NULL,
  nom varchar(50) NOT NULL,
  prenom varchar(50) NOT NULL,
  email varchar(50),
  date_naissance date,
  dept INT(2) NOT NULL
);
-- Création de la contrainte PK que l'on nomme PK_employes
ALTER TABLE employes ADD CONSTRAINT PK_employes PRIMARY KEY (no_employe);


-- Création de la contrainte de clé étrangère entre la colonne dept d'EMPLOYES qui fait référence à la clé primaire de DEPARTEMENT
ALTER TABLE EMPLOYES ADD CONSTRAINT FK_employes_departement
FOREIGN KEY (dept) REFERENCES DEPARTEMENT(id_dept);

-- Crétion contrainte d'unicité soit dans la table ou en dehors avec ALTER TABLE
-- Contrainte d'unicité = la colonne a une valeur unique, 2 region ne peuvent pas porter le même nom
-- Contrainte d'unicité similaire à une PK sans en être une
-- Contrainte d'unicité est une clé candidate à la PK (pourrait être une clé primaire à la place de la PK actuelle)
CREATE TABLE REGION(
 id_region INT(2) NOT NULL,
 nom_region VARCHAR(255) NOT NULL,
 UNIQUE(nom_region)
 -- ou CONSTRAINT UK_nom_region UNIQUE(nom_region)
);
-- Avec CREATE + ALTER TABLE
CREATE TABLE REGION(
 id_region INT(2) NOT NULL,
 nom_region VARCHAR(255) NOT NULL
);
ALTER TABLE REGION ADD CONSTRAINT UK_nom_region UNIQUE (nom_region);
-- OU plus court
ALTER TABLE REGION ADD UNIQUE (nom_region);