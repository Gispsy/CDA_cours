-- Active: 1677597816141@@127.0.0.1@3306@papyrus
CREATE TABLE Articles_a_commander (

    Codart char(4),
    Date DATE DEFAULT CURTIME(),
    Qte int(11),
    Foreign Key (codart) REFERENCES produit(codart)
);

DELIMITER $$

CREATE OR REPLACE TRIGGER update_produit AFTER UPDATE ON papyrus.produit
    FOR EACH ROW
    BEGIN
        DECLARE    
            Diff INT;
        SET Diff = NEW.stkale - NEW.stkphy ;
            IF NEW.stkphy <= NEW.stkale THEN
            INSERT INTO Articles_a_commander(
                codart,
                Qte)
            VALUES(
                NEW.codart,
                Diff
            );
    END IF;
END $$