# Maîtriser le SQL

## Import base de données RATP

1YopTNcUU7o2B9m5mKyeCh13yTmmUlypN
1. Téléchargez la base de données depuis ce lien [RATP](https://docs.google.com/uc?export=download&id=1YopTNcUU7o2B9m5mKyeCh13yTmmUlypN)
2. Ouvrez powershell
3. Tapez la commande suivante
```bash
mysql -u root -p
```
4. Saisissez le mot de passe ***root***
5. Tapez les commandes SQL suivantes :
```sql
CREATE DATABASE ratp;
use ratp;
source C:/Users/PLB/Downloads/ratp.sql;
```

## Google Forms

1. Le rythme de la formation vous convient il ?
- C'est un peu lent, j'aimerais qu'on accélère
- C'est un peu rapide, j'aimerais qu'on ralentisse
- Le rythme me convient

2. L'équilibre théorie/pratique vous convient il ?
- J'aimerais plus de théorie
- J'aimerais plus de pratique
- L'équilibre théorie/pratique me convient

3. Avez vous besoin que le formateur revienne sur une ou plusieurs 
notions avant de poursuivre son cours la demi-journée suivante ? si oui, listez ces notions.

4. Les notions abordées sur cette demi-journée sont-elles acquises ?
Auto-éval avec une note entre 1 et 5

5. Commentaires (champ libre) ?

---

## Numération des exercices

Les exercices sont numérotés en fonction du chapitre abordée selon 2 formats :
1. Format 3 chiffres commençant par 0 tels que **0**.x.y
- Exercices généralistes traitant des thématiques de plusieurs sous-chapitre du chapitre en cours.
- Exemples :
  - ***0.5.1*** : 1er exercice généraliste sur le chapitre 5
  - ***0.5.2*** : 2e exercice généraliste sur le chapitre 5
2. Format 2 chiffres x.y  avec **x différent de 0**
- Exercices spécifiques au sous-chapitre
- Exemples :
  - **2.1** : exercice spécifique au sous-chapitre 2.1 du cours
  - **8.4** : exercice spécifique au sous-chapitre 8.4 du cours

---

## Ressources

- [Schema PDF détaillé de la base de données pour les exercices](./exercices/northwind/schema.pdfschema.pdf)
- [Schema SVG graphique](./exercices/northwind/schema.svg)
- [Toutes les corrections des exercices](./exercices/corrections/)
- [Exercices supplémentaires RATP](./exercices/ratp/)
- [Corrections RATP](./exercices/corrections/ratp/)
- [Toutes les demos](./demos/)
- [Guide installation en local (sur votre ordinateurs)](#cadre-2--travail-en-local-sur-sa-machine-en-téléchargement-les-différents-logiciels)

---

## Documentations sur le SQL

### Généralistes et compréhensibles

- [SQL avec W3SCHOOLS](https://www.w3schools.com/sql/)
- [SQL avec SQL.sh](https://sql.sh/)

### Spécifique à chaque SGBDR et plus technique

- [SQL Server](https://learn.microsoft.com/en-us/sql/sql-server/?view=sql-server-ver17)
- [Oracle](https://docs.oracle.com/en/database/oracle/oracle-database/23/index.html?utm_source=chatgpt.com)
- [MySQL](https://www.w3schools.com/mysql/)
- [PostGreSQL avec W3SCHOOLS](https://www.w3schools.com/postgresql/index.php)
- [PostGreSQL officielle](https://www.postgresql.org/docs/current/intro-whatis.html)
- [MariaDB](https://mariadb.com/docs)
- [SQLite](https://www.sqlite.org/docs.html)

### Gestion des dates

- [Références de toutes les fonctions associées aux dates et heures pour chaque SGBDR](https://sql.sh/fonctions/date-heure)
- [Exemples utilisation des fonctions dédiées aux dates avec des comparaisons des dates dans le WHERE](https://www.datacamp.com/fr/tutorial/sql-date-greater-than)
- [Exemples manipulation des dates par SGBDR](https://learnsql.fr/blog/fonctions-sql-de-date-et-d-heure-dans-5-dialectes-sql-populaires/)

### Importation des données dans la base de données

- [Avec MySQL depuis un export .sql](./demos/4-import-via-sql.md)
- [Avec MySQL depuis un fichier CSV](https://www.mysqltutorial.org/mysql-basics/import-csv-file-mysql-table/)
- [Avec SQL Server depuis un fichier CSV et un logiciel graphique](https://learn.microsoft.com/fr-fr/sql/relational-databases/import-export/import-flat-file-wizard?view=sql-server-ver17)
- [Vidéo import CSV depuis Kaggle avec SQL Server](https://www.youtube.com/watch?v=8HWXjh6eBjc)
- [Vidéo import CSV Oracle depuis le logiciel SQL Developer](https://www.youtube.com/watch?v=GcB4_0Iz2Zw)
- [Vidéo Excel connecté à une base de données à lire à partir de 3min45 avec SQL Server jusqu'à 9min48](https://www.youtube.com/watch?v=UzfYbWZr6ro), pour les autres SGBDR le processus est similaire.
- [Autre vidéo EXCEL SQL Server droit au but](https://www.youtube.com/watch?v=eMDpuiiHm8U)

###  Expressions regulières

- [REGEX 101 pour apprendre, écrire et tester ses REGEX en direct](https://regex101.com/)
- [REGEX LEARN pour apprendre](https://regexlearn.com/fr/learn/regex101)

---

## Installations selon le cadre de travail

[Cf. installations](./0-installations/)

---

## Continuer d'apprendre le SQL

### Avec les bases de données en ligne

- [A partir des bases de données ORACLE en ligne et accessible depuis un navigateur Web](https://freesql.com/)

### En jouant

- [Jeux d'enquête avec des requêtes SQL](https://www.sqlnoir.com/cases)

### Avec les bases de données public

PS : nécessite l'installation d'un environnement SQL sur sa machine cf. [Installations](./0-installations/software/README.md)

- [Gouvernement français](https://www.data.gouv.fr/)
- [International](https://www.kaggle.com/datasets)
