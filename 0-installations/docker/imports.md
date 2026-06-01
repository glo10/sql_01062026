# Import de la base de données Northwind selon le SGBDR depuis le conteneur dédié

Les bases de données dont *Northwind* à récupérer depuis [ce lien](https://drive.google.com/drive/folders/1oYML4pid7n58KYFHcT5M7v7oJCIBGyTX?usp=sharing)

## Avant de commencer

1. Connectez-vous au conteneur cf. [](./README.md#manipulations-des-conteneurs)
2. Connectez-vous au client SGBDR pour créer une base de données nommée *northwind*
- ***Pour MySQL***, la commande à exéctuer une fois connecté au conteneur est
```bash
mysql -u root -p
# Vous êtes invité à saisir un mot de passe, saisissez admin123456+
# Ensuite pour chaque ligne suivante après le ; appuyez sur la touche Entrée pour exécuter la commande
CREATE DATABASE northwind;
USE northwind;
source /chemin/vers/le/fichier/mysql.sql
```
- Pour ***MariaDB***
```bash
mariadb -u root -p
# Vous êtes invité à saisir un mot de passe, saisissez admin123456+
# Ensuite pour chaque ligne suivante après le ; appuyez sur la touche Entrée pour exécuter la commande
CREATE DATABASE northwind;
USE northwind;
source /chemin/vers/le/fichier/mariadb.sql
```
- Pour ***Oracle***
```bash
sqlplus
# Vous êtes invité à répondre à 2 questions user name et user password
# 1. Saisissez northwind pour le user name
# 2. Saisissez admin123456+ pour le mot de passe
# Enfin, indiquez le chemin vers le fichier oracle.sql puis entrez
@/chemin/vers/le/fichier/oracle.sql
```
- Pour ***SQL Server***
`/opt/mssql-tools18/bin/sqlcmd -S localhost -U sa -P "admin123456+" -i /chemin/vers/le/fichier/sqlserver.sql -C`

- Pour Sqlite
```bash
sqlite3 /chemin/vers/le/fichier_de_la_base_de_donnees.sqlite < /chemin/vers/le/fichier/sqlite.sql
```