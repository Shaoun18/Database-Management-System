create database Bank;

----- 1 Num Ans ----

create table transtion(
T_id int,
Receiver_first_name varchar (15) Not null,
Receiver_last_name varchar (15) Not null,
date Date not null,
Amount NUMERIC(10,4) DEFAULT 100,
Branch_NO INT NOT NULL,
PRIMARY KEY(T_ID),
);

create table Branch(
Branch_No int,
strect varchar (15) Not Null,
city varchar (15) Not Null,
postcode  INT,
PRIMARY KEY (Branch_No),
);

----- 2 Num Ans ----

select * from transtion
insert transtion (T_id,Receiver_first_name,Receiver_last_name,date,Amount,Branch_No)
values
(7369,'Rahim','Khan','12/17/1989',800,40),
(7370,'Khan','Thameed','02/20/1980',1600,30),
(7371,'Karim','Ali','01/17/1999',1200,35),
(7372,'Mokbul','Islam','12/05/1993',1800,39),
(7373,'Satter','Khan','03/05/1979',450,21),
(7374,'Zafor','Kazi','05/05/1995',4500,40),
(7375,'Aftab','Asraf','06/04/1994',1250,21),
(7376,'Maruf','Hasan','03/08/1998',6500,4);

select * from Branch
insert Branch(Branch_No,strect,city,postcode)
values
(10,'Mohammadpur','Dhaka',1204),
(20,'Atibazar','Chitagong',''),
(11,'Mohakhali','Dhaka',1225),
(13,'Banani','Dhaka',1205),
(14,'Katakhali','Rajshahi',1206),
(15,'Shahbagh','Dhaka',1025),
(16,'Bongshal','Dhaka',1000),
(18,'Dhanmondi','Dhaka',1026);


----- 3 Num Ans ----

select * from Branch

----- 4 Num Ans ----

select T_id,Receiver_first_name,Receiver_last_name,Amount
from transtion

----- 5 Num Ans ----

select *
from transtion
where Amount >= 1500

----- 6 Num Ans ----

select * 
from transtion
order by Amount asc, date desc;

----- 7 Num Ans ----

select *
from transtion
where Receiver_first_name like 'K%' or Receiver_last_name like 'K%'

----- 8 Num Ans ----

select *
from transtion
where Amount >= 1000 and  Date between '1989' and '1999'

----- 9 Num Ans ----

SELECT SUM(Amount) AS SUM_AMOUNT
FROM transtion
GROUP BY Branch_No
ORDER BY Branch_No

----- 10 Num Ans ----

select sum(Amount) as Sum_Amount
from transtion
GROUP BY Branch_No
HAVING COUNT(Branch_No)>1


----- 11 Num Ans ----

SELECT *
FROM transtion AS A
WHERE 3>=(SELECT COUNT(B.Amount)
		FROM transtion AS B
		WHERE B.Amount>=A.Amount
		)

----- 12 Num Ans ----

update Branch
set postcode = 1200
WHERE Postcode IS NULL

----- 13 Num Ans ----

UPDATE transtion
SET Amount=Amount*0.05+Amount
WHERE T_ID IN(SELECT TOP 30 PERCENT T_ID
		FROM transtion
		)

