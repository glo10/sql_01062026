# Utilisation du conteneur adminer pour UI avec vos SGBDR

## Connexion MySQL ou MariaDB

1. Système => ***MySQL/MariaDB***
2. Serveur => 
- Cas *Docker* :
  - Pour MySQL : le nom du service ici ***sql02022026-mysql***
  - Pour MariaDB : le nom du service ici ***sql02022026-mariadb***
- Cas logiciels : pour les deux, la valeur à indiquer est ***localhost*** ou ***127.0.0.1***
4. Mot de passe => 
  - Cas *Docker* : mot de passe présent dans le fichier [.env](../.env) normalement "***admin123456+***" ou le mot de passe modifié depuis ce fichier
  - Cas logiciels : mot de passe que vous avez saisi lors de l'installation
5. Base de données => laisser ***vide*** pour voir toutes les bases de données sinon saisissez le nom d'une base de données spécifiques

## Connexion avec Postgres

1. Système => ***PostgreSql***
2. Serveur => 
- Cas *Docker* : c'est le nom du service défini dans le *compose.dev.yaml* par exemple ***postgres***
- Cas logiciels : la valeur à indiquer est *localhost* ou *127.0.0.1*
3. Nom d'utilisateur => valeur de la variable d'environnement *POSTGRES_USER* dans le fichier [.env](../.env) ici ***postgres***
4. Mot de passe => 
- Cas *Docker* : mot de passe présent dans le fichier .env normalement "admin123456+" ou le mot de passe modifié depuis ce fichier
- Cas logiciels : mot de passe que vous avez saisi lors de l'installation
5. Base de données => laisser ***vide*** pour voir toutes les bases de données sinon saisissez le nom d'une base de données spécifiques

## Connexion avec Oracle

1. Système => ***MS SQL***
2. Serveur =>  
- Cas *Docker* : nom du service ici normalement ***sql02022026-sqlserver***
- Cas logiciels : la valeur à indiquer est ***localhost*** ou ***127.0.0.1***
3. Nom d'utilisateur => ***sa***
4. Mot de passe => 
- Cas *Docker* : mot de passe présent dans le fichier [.env](../.env) normalement "***admin123456+***" ou le mot de passe modifié depuis ce fichier
- Cas logiciels : mot de passe que vous avez saisi lors de l'installation
5. Base de données => laisser ***vide*** pour voir toutes les bases de données sinon saisissez le nom d'une base de données spécifiques

## Connexion avec SQLServer

1. Système => ***MS SQL***
2. Serveur =>  
- Cas *Docker* : nom du service ici normalement ***sql02022026-sqlserver***
- Cas logiciels : la valeur à indiquer est ***localhost*** ou ***127.0.0.1***
3. Nom d'utilisateur => ***sa***
4. Mot de passe => 
- Cas *Docker* : mot de passe présent dans le fichier [.env](../.env) normalement "***admin123456+***" ou le mot de passe modifié depuis ce fichier
- Cas logiciels : mot de passe que vous avez saisi lors de l'installation
5. Base de données => laisser ***vide*** pour voir toutes les bases de données sinon saisissez le nom d'une base de données spécifiques