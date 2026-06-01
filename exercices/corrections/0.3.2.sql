-- A partir de votre base de données de l'exercice 0.3.1, apportez des modifications à la structure de vos tables pour intégrer les règles de gestion suivantes
-- 1. L'identifiant d'une région est une clé primaire.
ALTER TABLE REGION
ADD CONSTRAINT PK_REGION
PRIMARY KEY (id_region);
-- 2. L'identifiant d'un pays est une clé primaire.
ALTER TABLE PAYS
ADD CONSTRAINT PK_PAYS
PRIMARY KEY (id_pays);
-- 3. L'identifiant d'une localisation est une clé primaire.
ALTER TABLE LOCALISATION
ADD CONSTRAINT PK_LOCALISATION
PRIMARY KEY (id_localisation);
-- 4. La colonne région dans pays est une clé étrangère qui fait référence à l'identifiant d'une région dans la table région.
ALTER TABLE PAYS
ADD CONSTRAINT FK_PAYS_REGION
FOREIGN KEY (id_region)
REFERENCES REGION(id_region);
-- 5. Le nom d'une région est unique.
ALTER TABLE REGION
ADD CONSTRAINT UK_NOM_REGION
UNIQUE (nom_region);
-- 6. Une ville ne peut pas être nulle.
ALTER TABLE LOCALISATION
MODIFY ville VARCHAR(100) NOT NULL;
-- 7. Le nom d'une région doit avoir obligatoirement l'une des valeurs suivantes : Europe, Amérique, Asie, Océanie et Afrique
ALTER TABLE REGION
ADD CONSTRAINT CHECK_REGION
CHECK (nom_region IN ('Europe', 'Amérique', 'Asie', 'Océanie', 'Afrique'));
-- 8. La taille du nom d'une région est désormais de 10 caractères au maximum
ALTER TABLE REGION
MODIFY nom_region VARCHAR(10);
-- 9. Le code postal d'une ville peut être NULL (absence de valeur)
ALTER TABLE LOCALISATION
MODIFY code_postal CHAR(5) NULL;
-- 10. Ajoutez des colonnes longitude et latitude dans la table localisation.
-- Ces colonnes sont des nombres flottants avec une partie entière à 2 chiffres.
ALTER TABLE LOCALISATION
ADD (
    longitude NUMBER(8,2) DEFAULT 42.5545844,
    latitude NUMBER(8,2) DEFAULT 2.14555448
);
-- 11. Supprimez la colonne province de la table localisation.
ALTER TABLE LOCALISATION
DROP COLUMN province;
-- 12. Deux villes peuvent avoir le même nom.
-- RIEN à faire sinon s'il y avait une contrainte existante il faudrait la supprimer de cette façon
ALTER TABLE LOCALISATION
DROP CONSTRAINT UNIQUE_VILLE;-- il n'a jamais existé mais on suppose qu'il existe
