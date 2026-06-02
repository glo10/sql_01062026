# Exercice 3.7 : insertion

## Enoncé 

-- Votre talent pour le SQL a été remarqué, vous êtes sollicité pour insérer les informations suivantes à partir des schémas ci-dessous :

-- 1. EMPLOYES(nom, prenom, fonction, titre, date_naissance, date_embauche, salaire)
-- - EMPLOYES(Dia, Mary, Juriste, Mme, 01/01/1980, 15/03/2021, 3500)
-- - EMPLOYES(Martin, Judith, Secrétaire, Mlle, 10/02/2000, 05/05/2024, 2400)
-- - EMPLOYES(Chen, Amandine, RSSI, Mme, 18/09/1996, 25/08/2022, 5000)
INSERT INTO employes (no_employe, nom, prenom, fonction, titre, date_naissance, date_embauche, salaire)
VALUES
(10,'Dia', 'Mary', 'Juriste', 'Mme', '1980-01-01', '2021-03-15', 3500),

(11, 'Martin', 'Judith', 'Secrétaire', 'Mlle', '2000-02-10', '2024-05-05', 2400),

(12, 'Chen', 'Amandine', 'RSSI', 'Mme', '1996-09-18', '2022-08-25', 5000);


-- 2. CATEGORIES(nom_categorie, description)
-- - CATEGORIES(assistant IA, logiciel d'assistance dans les tâches quotidienne pour piloter l'activité)
-- - CATEGORIES(agent IA, logiciel capable de prendre des décisions business)

INSERT INTO categories (nom_categorie, `description`, code_categorie)
VALUES
('assistant IA', 'logiciel d''assistance dans les tâches quotidienne pour piloter l''activité', 9),
('agent IA', 'logiciel capable de prendre des décisions business', 10);

-- 3. FOURNISSEURS(societe, ville, code_postal, pays, telephone)
-- - FOURNISSEURS(GTBank, Courbevoie, 92400, France, 01 89 88 87 86)

INSERT INTO fournisseurs(societe, no_fournisseur, ville, code_postal, pays, telephone, adresse)
VALUES
('GTBank', 30,  'Courbevoie', '92400', 'France', '01 89 88 87 86', '1 rue de la défense');