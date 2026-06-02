-- MODIFICATION d'une ou plusieurs lignes avec WHERE
-- Le nom ici n'est pas clé primaire donc risque d'homonyme donc risque d'impacter
-- toutes les personnes qui portent ce mot
UPDATE TABLE employes SET nom="Dia Cohen" WHERE nom='Dia';
-- Bonne manière d'écrire la requête est de cibler la clé primaire dans le WHERE
UPDATE TABLE employes SET nom="Dia Cohen" WHERE no_employe=10;

-- Modification de plusieurs informations pour la même ligne
-- JUDITH MARTIN changement du titre en Mme et le salaire augmentation de 30%
UPDATE TABLE employes SET titre="Mme", salaire=salaire*1.3 WHERE no_employe=11;

-- Modification qui impacte toutes les lignes
-- Pas de clause WHERE attention ça doit être voulu ou volontaire
UPDATE TABLE employes SET salaire=salaire*1.1;