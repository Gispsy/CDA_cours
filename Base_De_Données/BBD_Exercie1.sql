DROP DATABASE IF EXISTS `Exo1_BDD`;

CREATE DATABASE `Exo1_BDD`;

USE `Exo1_BDD`;

CREATE TABLE Personne (

    per_num INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    per_nom VARCHAR(50) NOT NULL,
    per_prenom VARCHAR(50) NOT NULL,
    per_adresse VARCHAR(50) NOT NULL,
    per_ville VARCHAR(50) NOT NULL,
);

CREATE TABLE Groupe (

    gro_num INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    gro_libelle VARCHAR(50) NOT NULL,
);

CREATE TABLE Appartient (

    per_num INT NOT NULL,
    gro_num INT NOT NULL,
    FOREIGN KEY (per_num) REFERENCES Personne (per_num),
    FOREIGN KEY (gro_num) REFERENCES Groupe (gro_num),
);