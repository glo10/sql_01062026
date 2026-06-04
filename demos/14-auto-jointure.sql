-- nom, prénom de l'employe et nom prénom de son supérieur
SELECT emp.NOM nomEmploye,
emp.prenom prenomEmp,
manager.NOM nomSuperieur,
manager.PRENOM prenomSuperieur
FROM employes emp, employes manager
WHERE emp.REND_COMPTE = manager.NO_EMPLOYE;