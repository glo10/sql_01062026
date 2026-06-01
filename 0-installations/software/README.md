# Installations des logiciels

Pour intéragir avec une base de données il faut 2 outils :
1. Un serveur de base de données (Oracle, SQL Server, PostgreSQL, MySQL, MariaDB, etc)
2. Un client pour communiquer avec le serveur

## Installation des serveurs de base de données

Parmi les SGBDR ci-après, téléchargez un ou plusieurs logiciels selon vos préférences.
- [Téléchargez le SGBDR SQLite](https://www.sqlite.org/download.html)
- [Et/ou le SGBDR MySQL](https://dev.mysql.com/downloads/mysql/)
- [Et/ou le SGBDR MariaDB](https://mariadb.org/download/)
- [Et/ou le SGBDR Oracle Database Express Edition (XE)](https://www.oracle.com/database/technologies/xe-downloads.html)
- [Et/ou le SGBDR Microsoft SQL Server 2022 Express](https://www.microsoft.com/en-us/sql-server/sql-server-downloads)
- [Et/ou le SGBDR PostgreSQL](https://www.enterprisedb.com/downloads/postgres-postgresql-downloads)
  - [Guide d'installation Windows](https://www.enterprisedb.com/docs/supported-open-source/postgresql/installing/windows/)
  - [Guide d'installation MacOs](https://www.enterprisedb.com/docs/supported-open-source/postgresql/installing/macos/)
  - [Guide d'installation Linux x86 AMD64](https://www.enterprisedb.com/docs/supported-open-source/postgresql/installing/linux_x86_64/)
<!-- 2. Téléchargez [*PHP 8.4.13*](https://windows.php.net/download/) pour pouvoir utiliser *adminer* (client) pour interagir avec vos bases de données depuis une interface graphique
- Choisissez dans le select la version ***Thread Safe***
- Récupérez et décompressé le zip
3. Ajoutez le dossier décompressé dans vos variables d'environnement
- [Guide pour ajouter une variable d'environnement selon votre OS](https://www.autodesk.com/fr/support/technical/article/caas/sfdcarticles/sfdcarticles/FRA/How-to-set-an-environment-variable.html)
4. Téléchargez le client [*adminer 5.4.1*](https://www.adminer.org/en/#download)
- Placez-le dans le dossier de votre choix
5. Ouvrez un terminal et déplacez-vous jusqu'au dossier parent du fichier *adminer.php* et exécuté la commande suivante :
```bash
php -S localhost:8080
```
6. Visitez la page suivante depuis votre navigateur pour accéder à adminer [http://localhost:8080/adminer.php](http://localhost:8080/adminer.php)
7. [Suivez ce guide pour vous connecter au SGBDR de base de données de votre choix](../adminer.md) -->

## Installations des clients

Selon votre SGBDR, installez l'un des clients suivant :

- [PgAdmin4 pour PostgreSQL](https://www.pgadmin.org/download/)
- [SSMS pour SQL Server](https://learn.microsoft.com/fr-fr/ssms/install/install) 
- [SQL Developer pour Oracle](https://www.oracle.com/database/sqldeveloper/) 
- [Heidi pour MySQL/MariaDB](https://www.heidisql.com/) 

## Une fois l'environnement installée

1. Lancer le client
2. S'y connecter avec les identifiants par défaut ou définis lors de l'installation
3. Importer une ou plusieurs base de données
4. Intérroger la base de données via un éditeur SQL fournit pour le logiciel client installé