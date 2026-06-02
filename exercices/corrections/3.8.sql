
-- 1. L'employé MARY DIA a une commission de 10 000 € lorsqu'elle atteint ses objectifs fixés par sa direction.
UPDATE employes
SET commission = 10000
WHERE no_employe = 10; -- remplacez ici par le numéro employé que vous avez donné à cet employé lors de l'insertion

-- 2. La direction valorise de 10% tous les salaires des femmes.
UPDATE employes
SET salaire = salaire * 1.10
WHERE titre IN ('Mlle', 'Mme');

-- 3. La direction valorise de 2% tous les salaires pour tenir compte de l'inflation.
UPDATE employes
SET salaire = salaire * 1.02;

-- 4. JUDITH MARTIN vient de se marier, elle porte désormais le titre de Mme et son nouveau nom est JUDITH MARTIN Modric.
UPDATE employes
SET titre = 'Mme',
    nom = 'MARTIN Modric'
WHERE no_employe = 11; -- remplacez ici par le numéro employé que vous avez donné à cet employé lors de l'insertion

-- 5. Mme AMANDINE CHEN souhaite intégrer son nom de jeune fille dans le système, elle s'appelle AMANDINE SMITH CHEN.
UPDATE employes
SET nom = 'SMITH CHEN'
WHERE no_employe = 12; -- remplacez ici par le numéro employé que vous avez donné à cet employé lors de l'insertion

-- 6. Ajoutez le FAX 01 86 87 88 89 à l'entreprise GTBank.
UPDATE fournisseurs
SET fax = '01 86 87 88 89'
WHERE no_fournisseur = 30; -- remplacez ici par le numéro fournisseur que vous avez donné à ce fournisseur lors de l'insertion
