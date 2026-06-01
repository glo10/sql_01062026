-- Création de la base de données
CREATE DATABASE IF NOT EXISTS demo;
-- Choisir la base de données avec laquelle on veut communiquer
USE demo;
-- Création de la table demo
CREATE TABLE employes (
-- Liste des colonnes avec les types et les contraintes
  no_employe int(6) NOT NULL,
  nom varchar(50) NOT NULL,
  prenom varchar(50) NOT NULL,
  email varchar(50),
  date_naissance date
);