-- Exercice 14.1 : Insertion multitables
-- 1. Créez des nouvelles tables et insérez les ventes de 2019 et 2020 pour constituer des archives
-- Création table archive 2019
/* =========================================================
CREATION TABLE ARCHIVES
========================================================= */
CREATE TABLE archives_ventes_2019 AS
SELECT *
FROM ventes
WHERE YEAR(date_vente) = 2019;
-- Création table archive 2020
CREATE TABLE archives_ventes_2020 AS
SELECT *
FROM ventes
WHERE YEAR(date_vente) = 2020;

-- 2. Créez des nouvelles tables et insérez le numéro de commande, la référence produit, le prix_unitaire et la remise de toutes les commandes qui ont fait l’objet d’une remise en les séparant selon les conditions suivantes:
-- Dans une table dédiée pour les remises >= 0,25 (25%)
-- Dans une autre table pour les remises < 25% et >= 15%
-- Enfin dans une dernière table pour toutes les remises < 15%
/* =========================================================
CREATION TABLE REMISES
========================================================= */
-- Création table remises >= 25%
CREATE TABLE remises_25_plus (
    no_commande INT,
    ref_produit VARCHAR(50),
    prix_unitaire DECIMAL(10,2),
    remise DECIMAL(5,2)
);
-- Création table remises >= 15% et < 25%
CREATE TABLE remises_15_25 (
    no_commande INT,
    ref_produit VARCHAR(50),
    prix_unitaire DECIMAL(10,2),
    remise DECIMAL(5,2)
);
-- Création table Remises < 15%
CREATE TABLE remises_moins_15 (
    no_commande INT,
    ref_produit VARCHAR(50),
    prix_unitaire DECIMAL(10,2),
    remise DECIMAL(5,2)
);

/* =========================================================
INSERTIONS MULTITABLES
========================================================= */

INSERT ALL
    WHEN remise >= 0.25 THEN
        INTO remises_25_plus
        VALUES(no_commande, ref_produit, prix_unitaire, remise)

    WHEN remise >= 0.15 AND remise < 0.25 THEN
        INTO remises_15_25
        VALUES(no_commande, ref_produit, prix_unitaire, remise)

    WHEN remise < 0.15 THEN
        INTO remises_moins_15
        VALUES(no_commande, ref_produit, prix_unitaire, remise)
SELECT
    no_commande,
    ref_produit,
    prix_unitaire,
    remise
FROM details_commandes;

/* =========================================================
TABLE BILANS TRIMESTRIELS
========================================================= */
CREATE TABLE bilans (
    fin_trimestre DATE,
    chiffre_affaires DECIMAL(15,2)
);

/* =========================================================
INSERTION DES BILANS PAR TRIMESTRE
========================================================= */
INSERT INTO bilans (fin_trimestre, chiffre_affaires)
SELECT
    LAST_DAY(
        ADD_MONTHS(TRUNC(date_vente, 'Q'), 2)
    ) AS fin_trimestre,

    SUM(montant_total) AS chiffre_affaires
FROM ventes
GROUP BY TRUNC(date_vente, 'Q')
ORDER BY fin_trimestre;