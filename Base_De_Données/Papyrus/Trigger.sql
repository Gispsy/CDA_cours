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

