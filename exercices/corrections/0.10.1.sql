-- 1. Affichez la liste des produits avec le nom de leur catégorie respective.
SELECT p.nom_produit, c.nom_categorie
FROM produits p
INNER JOIN categories c
ON p.code_categorie = c.code_categorie;
-- 2. Affichez la liste de tous les clients, avec l'ID des commandes qu'ils ont passées, avec les clients qui n’ont jamais passé de commande au début des résultats.
SELECT c.societe, o.no_commande
FROM clients c
LEFT JOIN commandes o
ON c.code_client = o.code_client;
-- 3. Affichez le nom de tous les employés et l'ID des commandes qu'ils ont gérées. On veut s'assurer d'afficher toutes les commandes, même si (théoriquement) une commande est forcement rattaché à un employé.
SELECT e.prenom, e.nom, o.no_commande
FROM employes e
RIGHT JOIN commandes o
ON e.no_employe = o.no_employe;
-- 4. Affichez le croisement de tous les noms et pays des clients avec les noms et pays des fournisseurs.
SELECT c.societe AS nom_client,
c.pays AS pays_client, 
s.societe AS societe_fournisseur,
s.pays AS pays_fournisseur
FROM clients c
FULL OUTER JOIN fournisseurs s 
ON c.pays = s.pays;
-- 5. Affichez toutes les combinaisons possibles entre les produits et les catégories.
SELECT c.nom_categorie, p.nom_produit
FROM produits p
CROSS JOIN categories c;
-- 6. Affichez l'ID de la commande, le nom du client qui a acheté, le nom de l'employé qui a fait la vente, et le nom du produit acheté.
SELECT o.no_commande, c.societe, e.prenom, p.nom_produit
FROM commandes o
INNER JOIN clients c ON o.code_client = c.code_client
INNER JOIN employes e ON o.no_employe = e.no_employe
INNER JOIN details_commandes dc ON o.no_commande = dc.no_commande
INNER JOIN produits p ON dc.ref_produit = p.ref_produit;
