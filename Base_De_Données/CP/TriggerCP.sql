DELIMITER $$
CREATE TRIGGER maj_total AFTER INSERT ON lignedecommande
    FOR EACH ROW
    BEGIN
        DECLARE id_c INT;
        DECLARE tot DOUBLE;
        SET id_c = NEW.id_commande;
        SET remise = (SELECT remise from commande WHERE commande.id = NEW.id_commande);
        SET tot = (SELECT sum((prix*quantite)- remise) FROM lignedecommande WHERE id_commande=id_c);
        UPDATE commande SET total=tot WHERE id=id_c;
END $$


--Exo 1--

INSERT INTO lignedecommande(id_commande, id_produit, quantite, prix)
VALUES
(1, 1, 3, 10);

--Exo 2--

DELIMITER $$
CREATE TRIGGER maj_UP AFTER UPDATE ON lignedecommande
    FOR EACH ROW
    BEGIN
        DECLARE id_c INT;
        DECLARE tot DOUBLE;
        SET id_c = NEW.id_commande;
        SET remise = (SELECT remise from commande WHERE commande.id = NEW.id_commande);
        SET tot = (SELECT sum((prix*quantite)- remise) FROM lignedecommande WHERE id_commande=id_c);
        UPDATE commande SET total=tot WHERE id=id_c;
END $$

DELIMITER $$
CREATE TRIGGER maj_DEL AFTER DELETE ON lignedecommande
    FOR EACH ROW
    BEGIN
        DECLARE id_c INT;
        DECLARE tot DOUBLE;
        SET id_c = OLD.id_commande;
        SET remise = (SELECT remise from commande WHERE commande.id = NEW.id_commande);
        SET tot = (SELECT sum((prix*quantite)- remise) FROM lignedecommande WHERE id_commande=id_c);
        UPDATE commande SET total=tot WHERE id=id_c;
END $$