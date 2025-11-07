-- tifosi_schema.sql
CREATE DATABASE IF NOT EXISTS tifosi CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

CREATE USER IF NOT EXISTS 'tifosi'@'localhost' IDENTIFIED BY 'tifosi123!';
GRANT ALL PRIVILEGES ON tifosi.* TO 'tifosi'@'localhost';
FLUSH PRIVILEGES;

USE tifosi;

CREATE TABLE marque (
  id_marque INT AUTO_INCREMENT PRIMARY KEY,
  nom_marque VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE boisson (
  id_boisson INT AUTO_INCREMENT PRIMARY KEY,
  nom_boisson VARCHAR(100) NOT NULL,
  prix DECIMAL(5,2) NOT NULL,
  id_marque INT,
  FOREIGN KEY (id_marque) REFERENCES marque(id_marque)
);

CREATE TABLE ingredient (
  id_ingredient INT AUTO_INCREMENT PRIMARY KEY,
  nom_ingredient VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE focaccia (
  id_focaccia INT AUTO_INCREMENT PRIMARY KEY,
  nom_focaccia VARCHAR(100) NOT NULL UNIQUE,
  prix DECIMAL(5,2) NOT NULL
);

CREATE TABLE focaccia_ingredient (
  id_focaccia INT,
  id_ingredient INT,
  PRIMARY KEY (id_focaccia, id_ingredient),
  FOREIGN KEY (id_focaccia) REFERENCES focaccia(id_focaccia),
  FOREIGN KEY (id_ingredient) REFERENCES ingredient(id_ingredient)
);
