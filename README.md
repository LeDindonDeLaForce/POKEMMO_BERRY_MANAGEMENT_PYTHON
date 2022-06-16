# POKEMMO_BERRY_MANAGEMENT_PYTHON
Programme Python et SQL pour gérer le farming de BAIES sur PokéMMO, inspiré à partir du programme en SHELL uploadé précédemment

# Prérequis
- Une machine type client supportant Python (tous systèmes confondus)
- Base de données MySQL ou MariaDB (si un autre SGBD est utilisé, une réécriture de deux des scripts sera nécessaire)

NOTE : la partie SMTP et mail automatique en Python sera bientôt disponible, en attendant, se référer sur la version SHELL si vous avez un serveur SQL sous Linux debian ou équivalent

## Installation

### Côté serveur SQL

Une fois votre SGBD installé et configuré, créez une base de données sur MySQL/MariaDB nommée POKEMMO_BAIES par exemple (si un autre nom est choisi, la modification doit être également faite sur les scripts), puis injectez les tables, colonnes et lignes à partir du dump fourni.

NB : Par défaut, un serveur Mariadb n'accepte que les connexions provenant de lui même (localhost), si votre client et votre serveur sont 2 machines différentes, pensez à modifier ce paramètre.


Si vous êtes sur une machine Linux, en tant que root, ou tout autre utilisateur ayant autorité de CRÉATION ET DES GESTION DE DROITS sur la SGBD

```
root# mysql

mysql> CREATE DATABASE POKEMMO_BAIES;

root# mysql POKEMMO_BAIES < ./POKEMMO_BAIES.sql

```


Ensuite, créez votre propre utilisateur sur le SGBD en lui donnant les seuls accès nécessaires sur la base de données.



```
### REMPLACEZ {USERNAME} et {PASSWORD} par un num d'utilisateur et un mot de passe que vous aurez choisi au préalable

DROP TABLE IF EXISTS `PLANTATION_{USERNAME}`;
CREATE TABLE `PLANTATION_{USERNAME}` (
  `EMPLACEMENT` varchar(8) NOT NULL,
  `BAIE` int(3) NOT NULL,
  `DATE_PLANTATION` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DERNIER_ARROSAGE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ETAT` char(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`EMPLACEMENT`),
  KEY `BAIE` (`BAIE`),
  KEY `EMPLACEMENT` (`EMPLACEMENT`) USING BTREE,
  KEY `ETAT` (`ETAT`) USING BTREE,
  KEY `ETAT_2` (`ETAT`),
  CONSTRAINT `PLANTATION_{USERNAME}_ibfk_1` FOREIGN KEY (`EMPLACEMENT`) REFERENCES `EMPLACEMENTS` (`No_EMPLACEMENT`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `PLANTATION_{USERNAME}_ibfk_2` FOREIGN KEY (`BAIE`) REFERENCES `CROISSANCE` (`BAIE`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `PLANTATION_{USERNAME}_ibfk_3` FOREIGN KEY (`ETAT`) REFERENCES `ETAT_PLANTE` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


DROP TABLE IF EXISTS `ARCHIVES_PLANTATION_{USERNAME}`;
CREATE TABLE `ARCHIVES_PLANTATION_{USERNAME}` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `EMPLACEMENT` varchar(8) NOT NULL,
  `BAIE` int(3) NOT NULL,
  `DATE_RECOLTE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ETAT` char(1) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID` (`ID`,`ETAT`),
  KEY `BAIE` (`BAIE`),
  KEY `EMPLACEMENT` (`EMPLACEMENT`) USING BTREE,
  KEY `ETAT` (`ETAT`) USING BTREE,
  CONSTRAINT `ARCHIVES_PLANTATION_{USERNAME}_ibfk_1` FOREIGN KEY (`EMPLACEMENT`) REFERENCES `EMPLACEMENTS` (`No_EMPLACEMENT`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ARCHIVES_PLANTATION_{USERNAME}_ibfk_2` FOREIGN KEY (`BAIE`) REFERENCES `BAIES` (`Numero`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ARCHIVES_PLANTATION_{USERNAME}_ibfk_3` FOREIGN KEY (`ETAT`) REFERENCES `ETAT_PLANTE` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10780 DEFAULT CHARSET=utf8mb4;




CREATE USER '{USERNAME}'@'%' IDENTIFIED BY '{PASSWORD}';
GRANT SELECT ON POKEMMO_BAIES.BAIES TO '{USERNAME}'@'%';
GRANT SELECT ON POKEMMO_BAIES.ROUTES TO '{USERNAME}'@'%';
GRANT SELECT ON POKEMMO_BAIES.CROISSANCE TO '{USERNAME}'@'%';
GRANT SELECT ON POKEMMO_BAIES.EMPLACEMENTS TO '{USERNAME}'@'%';
GRANT SELECT ON POKEMMO_BAIES.ETAT_PLANTE TO '{USERNAME}'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON POKEMMO_BAIES.PLANTATION_{USERNAME} TO '{USERNAME}'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON POKEMMO_BAIES.ARCHIVES_PLANTATION_{USERNAME} TO '{USERNAME}'@'%';

```


### Côté client python

Éditer le script pokemmodb.py et renseignez vos paramètres de connexion à la base de données avec le user créé côté serveur


```
params = {
    'user':'{USERNAME}', #Votre username
    'password':'{PASSWORD}', #Votre password
    'host':'0.0.0.0', #L'ip ou le FQDN de votre serveur SQL
    'port':3306, #Port 3306 par défaut, si modifié côté serveur, faites de même ici
    'database':'POKEMMO_BAIES' #Si le nom de la base de données est modifié, modifiez-le ici également
}


```


Éditer ensuite le fichier pokemmo_berry_management.py et modifiez le champ '{USERNAME}' qui identifiera la table de référencement "PLANTATION".

```
TABLE="PLANTATION_{USERNAME}"
```


Pour finir, installer les librairies nécessaire à la bonne exécution des scripts, à savoir mariadb (ou psycopg2-binary si vous utilisez PostgreSQL par exemple) ainsi que pick


```
C:\Users\#######\Desktop\POKEMMO_BERRY_MANAGEMENT_PYTHON>pip install mariadb pick
Collecting mariadb
  Downloading mariadb-1.0.11-cp310-cp310-win_amd64.whl (177 kB)
     ---------------------------------------- 177.3/177.3 KB 2.1 MB/s eta 0:00:00
Collecting pick
  Downloading pick-1.2.0-py3-none-any.whl (5.3 kB)
Collecting windows-curses<3.0.0,>=2.2.0
  Downloading windows_curses-2.3.0-cp310-cp310-win_amd64.whl (88 kB)
     ---------------------------------------- 88.2/88.2 KB ? eta 0:00:00
Installing collected packages: windows-curses, pick, mariadb
Successfully installed mariadb-1.0.11 pick-1.2.0 windows-curses-2.3.0

```

Vous pouvez maintneant exécuter le script pokemmo_berry_management.py


```
C:\Users\#######\Desktop\POKEMMO_BERRY_MANAGEMENT_PYTHON>python .\pokemmo_berry_management.py
```
