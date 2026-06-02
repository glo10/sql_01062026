-- Insertion des données
-- Exemple prenom, nom et email sont de type VARCHAR
-- Attention ici la BDD insert les données car les types sont les bonnes
-- Donc attention à l'ordre
INSERT INTO employes(prenom, nom, email) 
VALUES ('contact@tshimini.fr', 'Glodie', 'Tshimini');
-- Bonne manière en respectant l'ordre
INSERT INTO employes(prenom, nom, email) 
VALUES ('Glodie', 'Tshimini', 'contact@tshimini.fr');

-- Insertion sur plusieurs lignes
    -- Un booléen (vrai ou faux) souvent stocké comme un nombre avec 0 = faux et 1 = vrai
    -- On peut stocker un code postal FR comme un entier mais souvent on préfère le VARCHAR
INSERT INTO clients(id_client, ville, code_postal, abonnee)
VALUES 
(1, 'Paris', 75014, 0),
(2, 'Paris', 75013, 1),
(3, 'Paris', 75013, 1),
(4, 'Paris', 75003, 0)
;