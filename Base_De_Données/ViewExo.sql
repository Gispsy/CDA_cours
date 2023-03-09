--------Partie 1 --------

--Hotel--

--Exo 1 --

create view v_Liste_hotel_station
as
select hot_nom, sta_nom
from hotel
join station on station.sta_id = hotel.hot_sta_id

select * from v_liste_hotel_station 

--Exo 2--

create view v_liste_chambre_hotel
as
select hot_nom, cha_numero 
from hotel
join chambre on chambre.cha_hot_id = hotel.hot_id 

select * from v_liste_chambre_hotel 

--Exo 3--

create view v_liste_reservation_client
as
select cli_nom, res_id
from client
join reservation on reservation.res_cli_id = client.cli_id 

select * from v_liste_reservation_client 

--Exo 4--

create view v_liste_chamre_hotel_station
as
select cha_numero, hot_nom, sta_nom
from station
join hotel on hotel.hot_sta_id = station.sta_id 
join chambre on chambre.cha_hot_id = hotel.hot_id 

select * from v_liste_chamre_hotel_station 

--Exo 5--

create view v_liste_client_reservation_hotel
as
select cli_nom, res_id, hot_nom
from client
join reservation on reservation.res_cli_id = client.cli_id 
join chambre on chambre.cha_id = reservation.res_cha_id 
join hotel on hotel.hot_id  = chambre.cha_hot_id 

select* from v_liste_client_reservation_hotel 

---------Partie 2 -------------

--Papyrus--

--Exo 1--

create view v_GlobalCde
as
select codart, numcom, qtecde,
SUM(qtecde) as QteTot,
priuni * SUM(qtecde) as PrixTot
from ligcom
group by codart

select * from v_globalcde 

--Exo 2 --

create view v_VenteI100
as
select *
from vente
where codart = 'I100'

select * from v_ventei100 

--Exo 3--

create view v_VentesI100Grobrigan
as
select *
from vente
where codart = 'I100' and numfou = 00120

select * from v_ventesi100grobrigan 