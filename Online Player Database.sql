create database online;

----- 1 Num Ans --------

create table player(
Player_sl varchar (11),
Name varchar (11),
Country varchar (11) check (Country in ('Bd','Ind','Ire','Eng','Pak','Aus')),
Run numeric (5,0),
Wicket varchar (11),
Batsman varchar (11) check (Batsman in ('Yes','No')),
Bowler varchar (11) check (Bowler in ('Yes','No')),
);

select * from player
insert player(Player_sl,Name,Country,Run,Wicket,Batsman,Bowler)
values
('1',	'Sakib',	'Bd',	'5000',	'253',	'Yes',	'Yes'),
('2',	'Tamim',	'Bd',	'7000',	'2',	'Yes',	'No'),
('3',	'Kohli',	'Ind',	'6000',	'5',	'Yes',	'No'),
('4',	'Morgan',	'Ire',	'3000',	'0',	'Yes',	'No'),
('5',	'Mashrafee','Bd',	'1000',	'265',	'No',	'Yes'),
('6',	'Anderson',	'Eng',	'600',	'467',	'No',	'Yes'),
('7',	'Afridi',	'Pak',	'4000',	'360',	'Yes',	'Yes'),
('8',	'Warner',	'Aus',	'7000',	'14',	'Yes',	'No');

----- 2 Num Ans --------

select Name,Country
from player

----- 3 Num Ans --------

select Top 3 H.Name
from player as H,player as L
where (H.Country='Bd' or H.Country='Ind' or H.Country='Pak') and (H.Wicket>L.Wicket)

----- 4 Num Ans --------

select Name as All_Rounder
from player
where Batsman='Yes' and Bowler='Yes' and Country in (select Country
													  from player
													  where Country='Bd'or Country='Pak')

----- 5 Num Ans --------

select Name,Wicket
from player
where Bowler='Yes' and Wicket between 200 and 400

----- 6 Num Ans --------

select Country
from player
where name like '-----%' or name like 'S%'

----- 7 Num Ans --------

select distinct(name)
from player
where name like 'a%' or name like 'e%' or name like 'i%' or name like 'o%' 
or name like 'u%' or name like 'A%' or name like 'E%' or name like 'I%'
or name like 'O%' or name like 'U%'

----- 8 Num Ans --------

Alter table player
add Trophy varchar (255) 

update player
set Trophy=0
where Player_sl in(select TOP 5 Player_sl
					from player) 

----- 9 Num Ans --------

update player
set run = case
when run > 3000 then run - 100
end

----- 10 Num Ans --------

Delete from player
where Country = 'Ire' and Run >= 1000
 