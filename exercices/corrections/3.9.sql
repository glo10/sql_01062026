-- 1. Supprimer le fournisseur GTBank avec lequel nous n'allons plus collaborer pour des questions de souveraineté de nos données.
DELETE FROM fournisseurs
WHERE no_fournisseur = 30; -- remplacez par l'id que vous avez pour ce fournisseur
-- 2. MARY DIA a quitté l'entreprise pour intégrer un poste de DPO dans une autre entreprise.
DELETE FROM employes
WHERE no_employe  = 10; -- remplacez par l'id que vous avez pour cet employé