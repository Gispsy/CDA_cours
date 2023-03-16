--Exemple--

DELIMITER $$
CREATE OR REPLACE TRIGGER insert_station AFTER INSERT ON station
    FOR EACH ROW
    BEGIN
        DECLARE altitude INT;
        SET altitude = NEW.sta_altitude;
        IF altitude<1000 THEN
            SIGNAL SQLSTATE '40000' SET MESSAGE_TEXT = 'Un problème est survenu. Règle de gestion altitude !';
    END IF;
END $$



--Exo 1--

DELIMITER $$
CREATE OR REPLACE TRIGGER modif_reservation BEFORE UPDATE ON hotel.reservation
    FOR EACH ROW
    BEGIN
        SIGNAL SQLSTATE '40000' SET MESSAGE_TEXT = 'Un problème est survenu. Personne ne peu modifier les reservation';
END $$


UPDATE hotel.station
SET res_date = '2017-01-11 00:00:00'
WHERE res_id = 1

INSERT INTO reservation (res_cha_id, res_cli_id, res_date, res_date_debut, res_date_fin, res_prix, res_arrhes)
VALUES 
(9, 1, '2017-08-01', '2017-08-01', '2017-09-20', 2400, 800);


--Exo 2--

DELIMITER $$
CREATE OR REPLACE TRIGGER insert_reservation BEFORE INSERT ON hotel.reservation
    FOR EACH ROW
    BEGIN
        DECLARE NombreChambre INT;
        SET NombreChambre = (SELECT COUNT(res_cha_id) FROM reservation JOIN chambre on chambre.cha_id = reservation.res_cha_id WHERE reservation.res_cha_id = new.res_cha_id)
        if NombreChambre >= 10 THEN
    SIGNAL SQLSTATE '40000' SET MESSAGE_TEXT = 'Un problème est survenu. Trop de reservation supperieur a 10';
    END IF
END $$

--Exo 3--

DELIMITER $$

CREATE OR REPLACE TRIGGER insert_reservation2 BEFORE INSERT ON hotel.reservation
    FOR EACH ROW
    BEGIN
        DECLARE CliNombreRes INT;
        SET CliNombreRes = (SELECT COUNT(res_cha_id) FROM reservation JOIN chambre on chambre.cha_id = reservation.res_cha_id WHERE reservation.res_cli_id = new.res_cli_id);
        if CliNombreRes >= 3 THEN
    SIGNAL SQLSTATE '40000' SET MESSAGE_TEXT = 'Un problème est survenu. Trop de reservation supperieur a 3';
    END IF
END $$

--Exo 4--

DELIMITER $$
CREATE OR REPLACE TRIGGER insert_chambre AFTER INSERT ON hotel.chambre
    FOR EACH ROW
    BEGIN
        DECLARE CapCham INT;
        SET CapCham = (SELECT SUM(cha_capacite) FROM chambre GROUP BY cha_hot_id);
        if CapCham > 50 THEN
    SIGNAL SQLSTATE '40000' SET MESSAGE_TEXT = 'Un problème est survenu. Capacité de chambre supérieur a 50';
    END IF
END $$