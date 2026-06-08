-- Mettez en place une vue, une séquence, un index ou un synonyme.
-- 1. Le service Achat effectueront beaucoup de requête à partir du nom de la société des fournisseurs
CREATE INDEX IDX_FOURNISSEUR_SOCIETE
ON fournisseurs (societe);
-- 2. L'équipe Marketing eux vont principalement avoir besoin d'obtenir les informations suivantes sur les clients :
-- code_client
-- ville
-- code_postal
-- pays
CREATE VIEW  vue_marketing
AS
SELECT  code_client,
        ville,
        code_postal,
        pays
FROM clients;
-- 3. L'équipe produit eux ont besoin uniquement d'interroger les informations suivantes en faisant leur recherche à partir du nom du produit.
-- nom_produit
-- no_fournisseur
-- prix_unitaire
-- indisponible
CREATE VIEW V_CATALOGUE
AS
SELECT  nom_produit,
        no_fournisseur,
        prix_unitaire,
        indisponible
FROM produits;
CREATE INDEX IDX_PRODUIT_NOM_PRODUIT
ON produits (nom_produit);
-- 4. Les commerciaux veulent voir pour chaque client uniquement l'employé qui a effectué la commande et la date de la commande.
CREATE VIEW V_VENTE
AS
SELECT  code_client,
        no_employe,
        date_commande
FROM clients;

-- 5. Le nom de la catégorie sera autant utilisé que son code.
CREATE INDEX IDX_CATEGORIE_NOM_CATEGORIE
ON categories(nom_categorie);

-- 6. Tous les services dans leurs activités au quotidien veulent retrouver facilement les autres employés à partir de leur nom, prénom et fonction.
--      Ici création d'un index composite = index sur plusieurs colonnes
--      On pourrait créer 3 index distincts mais ça prendra plus d'espace et moins performante (ralentissement des INSERT et UPDATE car il faut réorganiser les 3 index)
CREATE INDEX IDX_EMPLOYES_NOM_PRENOM_FONCTION
ON employes (nom, prenom, fonction);

-- 7. Tous les utilisateurs veulent accéder à des objets qui leurs parlent avec un vocabulaire proche de celui utilisé couramment dans leur activité.
    -- Les synonymes n'hésistent pas sur MySQL
CREATE SYNONYM ventes FOR commandes;
CREATE SYNONYM catalogue FOR produit;

-- 8. Les employés et les fournisseurs doivent avoir des identifiants (clé primaire) bien distincts.
--      Par exemple, il n'est pas possible d'avoir un identifiant 10 dans la table CLIENT et un identifiant 10 dans la table fournisseurs.
CREATE SEQUENCE SEQ_PARTENAIRE
START WITH 1
INCREMENT BY 1;
-- Les modifications de la structure selon les SGBDR
--  SQL SERVER
ALTER TABLE fournisseurs
ADD CONSTRAINT DF_no_fournisseur
DEFAULT NEXT VALUE FOR SEQ_PARTENAIRE
FOR no_fournisseur;
ALTER TABLE clients
ADD CONSTRAINT DF_CODE_CLIENT
DEFAULT NEXT VALUE FOR SEQ_PARTENAIRE
FOR code_client;
-- ORACLE
ALTER TABLE fournisseurs
MODIFY no_fournisseur
DEFAULT SEQ_PARTENAIRE.NEXTVAL;
ALTER TABLE clients
MODIFY code_client
DEFAULT SEQ_PARTENAIRE.NEXTVAL;
-- PostgreSQL
ALTER TABLE fournisseurs
ALTER COLUMN no_fournisseur
SET DEFAULT nextval('SEQ_PARTENAIRE');
-- MariaDB
ALTER TABLE fournisseurs
MODIFY no_fournisseur INT
DEFAULT NEXT VALUE FOR SEQ_PARTENAIRE;

