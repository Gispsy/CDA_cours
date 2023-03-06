--1--

--Quelles sont les commandes du fournisseur 09120 ?--

SELECT fournis.numfou, numcom
FROM fournis
JOIN entcom ON entcom.numfou = fournis.numfou
WHERE fournis.numfou = 9120

--2--

--Afficher le code des fournisseurs pour lesquels des commandes ont été passées.--

SELECT fournis.numfou, 
COUNT(numcom) AS CommandePasser
FROM fournis
JOIN entcom ON entcom.numfou = fournis.numfou
GROUP BY fournis.numfou

--3--

--Afficher le nombre de commandes fournisseurs passées, et le nombre de fournisseur concernés.--

SELECT COUNT(numcom) AS Nombrecommande,
COUNT(fournis.numfou) AS NombreFournisseur
FROM fournis
JOIN entcom ON entcom.numfou = fournis.numfou

--4--

--Editer les produits ayant un stock inférieur ou égal au stock d'alerte et dont la quantité annuelle est inférieur à 1000 (informations à fournir : n° produit, libellé produit, stock, stock actuel d'alerte, quantité annuelle)

SELECT codart, libart, stkphy, stkale, qteann
FROM produit
WHERE stkphy <= stkale AND qteann < 1000

--5--

--Quels sont les fournisseurs situés dans les départements 75 78 92 77 ? L’affichage (département, nom fournisseur) sera effectué par département décroissant, puis par ordre alphabétique--

SELECT posfou, nomfou
FROM fournis
WHERE SUBSTRING(posfou,1,2) = '75' OR SUBSTRING(posfou,1,2) = '78' OR SUBSTRING(posfou,1,2) = '92' OR SUBSTRING(posfou,1,2) = '77'
ORDER BY posfou DESC, nomfou ASC

--6--

--Quelles sont les commandes passées au mois de mars et avril ?--

SELECT numcom, datcom
FROM entcom
WHERE MONTH(datcom) = 4 or MONTH(datcom) = 3

--7--

--Quelles sont les commandes du jour qui ont des observations particulières ? (Affichage numéro de commande, date de commande)--

SELECT numcom, datcom, obscom
FROM entcom
WHERE obscom != ""

--8--

--Lister le total de chaque commande par total décroissant (Affichage numéro de commande et total)--

SELECT numcom,
SUM(qtecde) AS TotalQtecde,
SUM(priuni) AS TotalPriuni,
SUM(qteliv) AS TotalQteliv
FROM ligcom
GROUP BY numcom

--9--

--Lister les commandes dont le total est supérieur à 10 000€ ; on exclura dans le calcul du total les articles commandés en quantité supérieure ou égale à 1000. (Affichage numéro de commande et total)--

SELECT numcom, SUM(qtecde*priuni) as total_cde
FROM ligcom
GROUP BY numcom
HAVING total_cde > 10000 AND SUM(qtecde) >= 1000

--10--

--Lister les commandes par nom fournisseur (Afficher le nom du fournisseur, le numéro de commande et la date)--

SELECT fournis.nomfou, entcom.numcom, entcom.datcom
FROM fournis
JOIN entcom ON entcom.numfou = fournis.numfou
GROUP BY fournis.nomfou

--11--

--Sortir les produits des commandes ayant le mot "urgente' en observation ? (Afficher le numéro de commande, le nom du fournisseur, le libellé du produit et le sous total = quantité commandée * Prix unitaire)--

SELECT entcom.numcom, obscom, nomfou, numlig, libart,
ligcom.qtecde*ligcom.priuni AS SousTotal
FROM produit
JOIN ligcom ON ligcom.codart = produit.codart
JOIN entcom ON entcom.numcom = ligcom.numcom
JOIN fournis ON fournis.numfou = entcom.numfou
WHERE obscom LIKE '%urgent%'

--12--

--Coder de 2 manières différentes la requête suivante : Lister le nom des fournisseurs susceptibles de livrer au moins un article--

SELECT nomfou, qteliv
FROM fournis
JOIN entcom ON entcom.numfou = fournis.numfou
JOIN ligcom ON ligcom.numcom = entcom.numcom
WHERE qteliv != 0

SELECT nomfou, qteliv
FROM fournis
JOIN entcom ON entcom.numfou = fournis.numfou
JOIN ligcom ON ligcom.numcom = entcom.numcom
WHERE qteliv > 0 

--13--

--Coder de 2 manières différentes la requête suivante Lister les commandes (Numéro et date) dont le fournisseur est celui de la commande 70210 :--

SELECT entcom.numcom, datcom
FROM entcom
JOIN fournis ON fournis.numfou = entcom.numfou
WHERE entcom.numcom = 70210

SELECT entcom.numcom, datcom
FROM entcom
JOIN fournis ON fournis.numfou = entcom.numfou
WHERE entcom.numcom LIKE '%210'

--14--

--Dans les articles susceptibles d’être vendus, lister les articles moins chers (basés sur Prix1) que le moins cher des rubans (article dont le premier caractère commence par R). On affichera le libellé de l’article et prix1--

SELECT libart, prix1
FROM produit
JOIN vente ON vente.codart = produit.codart
WHERE prix1 < (SELECT MIN(prix1)
                FROM produit
                JOIN vente ON vente.codart = produit.codart
                WHERE libart LIKE ('r%'))

--15--

--Editer la liste des fournisseurs susceptibles de livrer les produits dont le stock est inférieur ou égal à 150 % du stock d'alerte. La liste est triée par produit puis fournisseur

SELECT nomfou,
SUM(stkale) AS TotalStockAlert,
SUM(stkale) * 100 AS Pourcentage
FROM fournis
JOIN entcom ON entcom.numfou = fournis.numfou
JOIN ligcom ON ligcom.numcom = ligcom.numcom
JOIN produit ON produit.codart = ligcom.codart
GROUP BY nomfou