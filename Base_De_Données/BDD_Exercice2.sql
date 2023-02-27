DROP DATABASE IF EXISTS Hotel;

CREATE DATABASE `Hotel`;

USE `Hotel`;

CREATE TABLE `Client` (

    cli_nom     VARCHAR(50) NOT NULL,
    cli_prenom  VARCHAR(50) NOT NULL,
    cli_adresse VARCHAR(50) NOT NULL,
    cli_num     INT NOT NULL AUTO_INCREMENT,
    PRIMARY KEY (cli_num)
);

CREATE TABLE `Station` (

    sta_nom   VARCHAR(50) NOT NULL,
    sta_num   INT NOT NULL AUTO_INCREMENT,
    PRIMARY KEY (sta_num)
);

CREATE TABLE `Hotel` (

    hot_nom         VARCHAR(50) NOT NULL,
    hot_categorie   VARCHAR(15) NOT NULL,
    hot_capacite    INT NOT NULL,
    hot_adresse     VARCHAR(50) NOT NULL,
    hot_num_sta     INT NOT NULL,
    hot_num         INT NOT NULL AUTO_INCREMENT,
    PRIMARY KEY (hot_num),
    FOREIGN KEY (hot_num_sta) REFERENCES Station (sta_num)
);

CREATE TABLE `Chambre` (

    cham_capacite       VARCHAR(1) NOT NULL,
    cham_deg_confort    VARCHAR(3) NOT NULL,
    cham_expo           VARCHAR(1) NOT NULL,
    cham_type           VARCHAR(15) NOT NULL,
    cham_num            INT NOT NULL AUTO_INCREMENT,
    cham_num_hot        INT NOT NULL,
    PRIMARY KEY (cham_num),                              
    FOREIGN KEY (cham_num_hot) REFERENCES Hotel (hot_num)
);

CREATE TABLE `Reservation` (

    res_date_debut  DATE NOT NULL,
    res_date_fin    DATE NOT NULL,
    res_date_res    DATE NOT NULL,
    res_montant_arrhes INT NOT NULL,
    res_prix_total  INT NOT NULL,
    res_num_cham    INT NOT NULL,
    res_num_cli    INT NOT NULL,
    FOREIGN KEY (res_num_cham) REFERENCES Chambre (cham_num),
    FOREIGN KEY (res_num_cli) REFERENCES Client (cli_num)
);

CREATE UNIQUE INDEX `nom_client` ON Client (`cli_nom`);
CREATE UNIQUE INDEX `nom_station` ON Station (`sta_nom`);
CREATE UNIQUE INDEX `nom_hotel` ON Hotel (`hot_nom`);
CREATE UNIQUE INDEX `num_chambre` ON Chambre (`cham_num`);
CREATE UNIQUE INDEX `date_reservation` ON Reservation (`res_date_res`);

DROP TABLE  Client;
DROP TABLE  Station;
DROP TABLE  Hotel;
DROP TABLE  Chambre;
DROP TABLE  Reservation;