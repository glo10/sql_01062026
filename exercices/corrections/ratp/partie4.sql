-- 1. Créez une nouvelle table 2025 ayant les mêmes colonnes que les tables précédentes 2021, 2020, etc.
CREATE TABLE IF NOT EXISTS `2025` LIKE `2021`;
-- 2. Ajoutez toutes les stations à partir de la table 2021 dans la table 2025 en utilisation la clause  `INSERT INTO SELECT FROM...`
INSERT INTO `2025` (
    `network`,
    `station`,
    `trafic`, 
    `connection_1`,
    `connection_2`,
    `connection_3`,
    `connection_4`,
    `connection_5`, 
    `city`,
    `paris_district`
)
SELECT 
    `network`,
    `station`,
    `trafic`, 
    `connection_1`,
    `connection_2`,
    `connection_3`,
    `connection_4`,
    `connection_5`, 
    `city`,
    `paris_district`
FROM `2021`;
-- 3. Ajoutez toutes les nouvelles stations depuis 2021 dans la table 2025, pour simplifier nous n'allons pas prendre en compte le trafic et les correspondances (connections)
-- -  Nouvelles stations de la ligne 4
--     - Barbara
--     - Bagneux - Lucie Aubrac
-- - Nouvelles stations de ligne 12
--     - Aimé Césaire
--     - Mairie d''Aubervilliers
-- - Nouvelles stations de la ligne 11
--     - Serge Gainsbourg
--     - Romainville-Carnot
--     - Montreuil-Hôpital
--     - La Dhuys, Coteaux Beauclair
--     - Rosny-Bois-Perrier 
-- - Nouvelles station de la ligne 14
--     - Villejuif-Gustave Roussy
--     - L''Haÿ-les-Roses
--     - Chevilly-Larue
--     - Thiais-Orly
--     - Aéroport Orly
INSERT INTO `2025` (
    `network`,
    `station`,
    `trafic`, 
    `connection_1`,
    `connection_2`,
    `connection_3`,
    `connection_4`,
    `connection_5`, 
    `city`,
    `paris_district`
) VALUES 
-- Prolongement Ligne 4
('M', 'Barbara', 0, '', '', '', '', '', 'Montrouge', NULL),
('M', 'Bagneux-Lucie Aubrac', 0, '', '', '', '', '', 'Bagneux', NULL),
-- Prolongement Ligne 12
('M', 'Aimé Césaire', 0, '', '', '', '', '', 'Aubervilliers', NULL),
('M', 'Mairie d''Aubervilliers', 0, '', '', '', '', '', 'Aubervilliers', NULL),
-- Prolongement Ligne 11
('M', 'Serge Gainsbourg', 0, '', '', '', '', '', 'Les Lilas', NULL),
('M', 'Romainville-Carnot', 0, '', '', '', '', '', 'Romainville', NULL),
('M', 'Montreuil-Hôpital', 0, '', '', '', '', '', 'Montreuil', NULL),
('M', 'La Dhuys', 0, '', '', '', '', '', 'Rosny-sous-Bois', NULL),
('M', 'Coteaux Beauclair', 0, '', '', '', '', '', 'Rosny-sous-Bois', NULL),
('M', 'Rosny-Bois-Perrier', 0, '', '', '', '', '', 'Rosny-sous-Bois', NULL),
-- Prolongement Ligne 14
('M', 'Villejuif-Gustave Roussy', 0, '', '', '', '', '', 'Villejuif', NULL),
('M', 'L''Haÿ-les-Roses', 0, '', '', '', '', '', 'L''Haÿ-les-Roses', NULL),
('M', 'Chevilly-Larue', 0, '', '', '', '', '', 'Chevilly-Larue', NULL),
('M', 'Thiais-Orly', 0, '', '', '', '', '', 'Thiais', NULL),
('M', 'Aéroport Orly', 0, '', '', '', '', '', 'Paray-Vieille-Poste', NULL);