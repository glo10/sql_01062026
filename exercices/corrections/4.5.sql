-- 1. Affichez le nom, le prénom, la fonction et le salaire des employés qui ont un salaire compris entre 2500 et 3500.
SELECT nom, prenom, fonction, salaire
FROM employes
WHERE salaire BETWEEN 2500 AND 3500;
-- 2. Affichez le nom du produit, le nom du fournisseur, le nom de la catégorie et les quantités de produits qui ne sont pas d'une des catégories 1,3,5 et 7.
SELECT p.nom_produit,
       f.societe,
       c.nom_categorie,
       p.quantite
FROM produits p, fournisseurs f, categories c
WHERE p.no_fournisseur = f.no_fournisseur 
AND p.code_categorie = c.code_categorie
AND p.code_categorie NOT IN (1, 3, 5, 7);
-- 3. Affichez le nom des employés qui ont effectué au moins une vente pour un client parisien.
SELECT e.nom,
  cl.societe,
  cl.ville
FROM employes e,
  commandes cmd,
  clients cl
WHERE e.no_employe = cmd.no_employe
  AND cmd.code_client = cl.code_client
  AND ville = 'Paris';
-- 4. Affichez le nom des produits et le nom des fournisseurs pour les produits des catégories 1,4 et 7.
SELECT nom_produit,
  societe
FROM produits p,
  fournisseurs f
WHERE p.no_fournisseur = f.no_fournisseur
  AND code_categorie IN (1, 4, 7);
-- 5. Affichez le nom des employés ainsi que le nom de leur supérieur hiérarchique.
SELECT s.nom AS nom_salarie,
  s.prenom AS salarie_prenom,
  s.rend_compte numero_du_chef,
  s.no_employe AS numero_salarie,
  chef.nom nom_du_chef,
  chef.prenom prenom_du_chef
FROM employes s,
  employes chef
WHERE chef.no_employe = s.rend_compte;
-- 6. Affichez le nom du produit, le nom du fournisseur, le nom de la catégorie et les quantités des produits qui ont un numéro de fournisseur entre 1 et 3 ou un code catégorie entre 1 et 3 et pour lesquelles les quantités sont données en boîte(s) ou en carton(s).
SELECT x.nom_produit,
  y.societe,
  z.nom_categorie,
  x.quantite,
  y.no_fournisseur,
  z.code_categorie
FROM produits x,
  fournisseurs y,
  categories z
WHERE z.code_categorie = x.code_categorie
  AND y.no_fournisseur = x.no_fournisseur
  AND (
    y.no_fournisseur BETWEEN 1 AND 3
    OR z.code_categorie BETWEEN 1 AND 3
  )
  AND (
    x.quantite LIKE '%bo_te%'
    OR x.quantite LIKE '%carton%'
  )
  AND x.quantite NOT LIKE '%bou%'; -- exclusion de bouteille qui satisfait également le motif %bo_te% 
-- ou
SELECT x.nom_produit,
  y.societe,
  z.nom_categorie,
  x.quantite,
  y.no_fournisseur,
  z.code_categorie
FROM produits x,
  fournisseurs y,
  categories z
WHERE z.code_categorie = x.code_categorie
  AND y.no_fournisseur = x.no_fournisseur
  AND (
    y.no_fournisseur BETWEEN 1 AND 3
    OR z.code_categorie BETWEEN 1 AND 3
  )
  AND (
    x.quantite LIKE '%bo_tes%' -- exclusion d'office de bouteille
    OR x.quantite LIKE '%carton%'
  );
