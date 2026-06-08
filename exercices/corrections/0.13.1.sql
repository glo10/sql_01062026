-- 1. Affichez le total des fournisseurs par pays avec un affichage pivoté (pays en ligne).
SELECT *
FROM (
    SELECT pays, id_fournisseur
    FROM fournisseurs
)
PIVOT (
    COUNT(id_fournisseur)
    FOR pays IN (
        'France' AS France,
        'Allemagne' AS Allemagne
    )
);
-- Réponse alternative sans PIVOT
SELECT
    COUNT(CASE WHEN LOWER(pays) = 'france' THEN 1 END) AS France,
    COUNT(CASE WHEN LOWER(pays) = 'allemagne' THEN 1 END) AS Allemagne
FROM fournisseurs;

-- 2. Affichez le total des ventes des années 2021, 2020 et 2019 avec un affichage pivoté (années en ligne).
SELECT *
FROM (
    SELECT annee, montant
    FROM ventes
)
PIVOT (
    SUM(montant)
    FOR annee IN (
        2021 AS "2021",
        2020 AS "2020",
        2019 AS "2019"
    )
);
-- Créez une vue à partir de votre réponse à la question précédente.
-- A partir de cette vue, affichez toutes les ventes des années 2021, 2020 et 2019 avec un affichage aplatit.
CREATE VIEW vue_ventes_pivot AS
SELECT *
FROM (
    SELECT annee, montant
    FROM ventes
)
PIVOT (
    SUM(montant)
    FOR annee IN (
        2021 AS "2021",
        2020 AS "2020",
        2019 AS "2019"
    )
);
-- UNPIVOT
SELECT annee, total_ventes
FROM vue_ventes_pivot
UNPIVOT (
    total_ventes
    FOR annee IN (
        "2021",
        "2020",
        "2019"
    )
);