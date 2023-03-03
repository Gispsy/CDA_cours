--Exo 1--

--Afficher la liste des hôtels. Le résultat doit faire apparaître le nom de l’hôtel et la ville--

SELECT hot_nom, hot_ville
FROM hotel

--Exo 2--

--Afficher la ville de résidence de Mr White Le résultat doit faire apparaître le nom, le prénom, et l'adresse du client--

SELECT cli_nom, cli_prenom, cli_adresse,cli_ville
FROM client
WHERE cli_nom = 'White'

--Exo 3--

-- Afficher la liste des stations dont l’altitude < 1000 Le résultat doit faire apparaître le nom de la station et l'altitude--

SELECT sta_nom, sta_altitude
FROM station
WHERE sta_altitude < 1000

--Exo 4--

-- Afficher la liste des chambres ayant une capacité > 1 Le résultat doit faire apparaître le numéro de la chambre ainsi que la capacité--

SELECT cha_numero, cha_capacite
FROM chambre
WHERE cha_capacite > 1

--Exo 5--

--Afficher les clients n’habitant pas à Londre Le résultat doit faire apparaître le nom du client et la ville--

SELECT cli_nom, cmi_ville
FROM client
WHERE cli_ville != 'Londre'

--Exo 6--

--Afficher la liste des hôtels située sur la ville de Bretou et possédant une catégorie>3 Le résultat doit faire apparaître le nom de l'hôtel, ville et la catégorie--

SELECT hot_nom, hot_ville, hot_categorie
FROM hotel
WHERE hot_ville = 'Bretou' AND hot_categorie > 3

--Lot 2--

--Exo 7--

--Afficher la liste des hôtels avec leur station Le résultat doit faire apparaître le nom de la station, le nom de l’hôtel, la catégorie, la ville)--

SELECT hot_nom, hot_categorie, hot_ville, sta_nom
FROM hotel
JOIN station ON station.sta_id = hotel.hot_sta_id

--Exo 8--

--Afficher la liste des chambres et leur hôtel Le résultat doit faire apparaître le nom de l’hôtel, la catégorie, la ville, le numéro de la chambre)--

SELECT hot_nom, hot_categorie, hot_ville, cha_numero
FROM hotel
JOIN chambre ON chambre.cha_id = hotel.hot_id

--Exo 9 --

--Afficher la liste des chambres de plus d'une place dans des hôtels situés sur la ville de Bretou Le résultat doit faire apparaître le nom de l’hôtel, la catégorie, la ville, le numéro de la chambre et sa capacité)--

SELECT hot_nom, hot_categorie, hot_ville, cha_numero, cha_capacite
FROM hotel
JOIN chambre ON chambre.cha_id = hotel.hot_id
WHERE hot_ville = 'Bretou' AND cha_capacite > 1 

--Exo 10--

--Afficher la liste des réservations avec le nom des clients Le résultat doit faire apparaître le nom du client, le nom de l’hôtel, la date de réservation--

SELECT hot_nom, cli_nom, res_date
FROM hotel
JOIN chambre ON chambre.cha_id = hotel.hot_id
JOIN reservation ON reservation.res_id = chambre.cha_id
JOIN client ON client.cli_id = reservation.res_id

--Exo 11--

--Afficher la liste des chambres avec le nom de l’hôtel et le nom de la station Le résultat doit faire apparaître le nom de la station, le nom de l’hôtel, le numéro de la chambre et sa capacité)--

SELECT sta_nom, hot_nom, cha_numero, cha_capacite
FROM station
JOIN hotel ON hotel.hot_id = station.sta_id
JOIN chambre ON chambre.cha_id = hotel.hot_id

--Exo 12--

--Afficher les réservations avec le nom du client et le nom de l’hôtel Le résultat doit faire apparaître le nom du client, le nom de l’hôtel, la date de début du séjour et la durée du séjour--

SELECT cli_nom, hot_nom,
DATEDIFF (res_date_debut, res_date_fin) AS DurerSejour
FROM client
JOIN reservation ON reservation.res_id = client.cli_id
JOIN chambre ON chambre.cha_id = reservation.res_id
JOIN hotel ON hotel.hot_id = chambre.cha_id

--Lot 3--

--Exo 13--

--Compter le nombre d’hôtel par station--