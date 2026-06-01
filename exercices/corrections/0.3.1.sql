-- Au préalable, se connecter et se placer dans la base table
-- Utilisez USE nomDeVotreBaseDeDonnees ou ouvrir un éditeur de code directement sur la bonne base

CREATE TABLE REGION (
    id_region INT NOT NULL,
    nom_region VARCHAR(255)
);

CREATE TABLE PAYS(
    id_pays CHAR(2) NOT NULL,
    nom_pays VARCHAR(60) NOT NULL,
    region INT NOT NULL
);

CREATE TABLE LOCALISATION(
    id_localisation INT(4) NOT NULL,
    rue VARCHAR(150),
    code_postal CHAR(5),
    ville VARCHAR(100),
    province VARCHAR(100),
    pays CHAR(2) NOT NULL
);