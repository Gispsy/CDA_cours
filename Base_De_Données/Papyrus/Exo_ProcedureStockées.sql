--Exo 1--

DELIMITER |

CREATE PROCEDURE Lst_fournis()
BEGIN
	SELECT numcom, nomfou
	FROM entcom
	JOIN fournis on fournis.numfou = entcom.numfou;
END |

DELIMITER ;

CALL Lst_fournis;

SHOW CREATE PROCEDURE Lst_fournis;

--Exo 2--

DELIMITER |

CREATE PROCEDURE Lst_Commandes(IN Commande VARCHAR(50))
BEGIN
    SELECT entcom.numcom, obscom, nomfou, numlig, libart,
    ligcom.qtecde*ligcom.priuni AS SousTotal
    FROM produit
    JOIN ligcom ON ligcom.codart = produit.codart
    JOIN entcom ON entcom.numcom = ligcom.numcom
    JOIN fournis ON fournis.numfou = entcom.numfou
    WHERE obscom = Commande;
END |

DELIMITER ;

CALL Lst_Commandes('Commande urgente');

SHOW CREATE PROCEDURE Lst_Commandes;

--Exo 3--

DELIMITER |

CREATE PROCEDURE CA_Fournisseur(IN CodeF int, Annee YEAR)
BEGIN
    SELECT fournis.nomfou, SUM(qtecde * priuni * 0.2) AS CA
    FROM ligcom
    JOIN entcom ON entcom.numcom = ligcom.numcom
    JOIN fournis ON entcom.numfou = fournis.numfou
    WHERE Year(entcom.datcom) = Annee AND fournis.numfou = CodeF
    GROUP BY nomfou;
END |

DELIMITER ;

CALL CA_Fournisseur(120, 2018);

SHOW CREATE PROCEDURE CA_Fournisseur;