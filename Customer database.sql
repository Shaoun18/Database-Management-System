create Database customer;

-- 1 Num Ans ----- 

create table customers
	(C_id varchar(7),name varchar(10),
	Branch varchar(12) check (Branch in ('Gulshan', 'Banani', 'Dhanmondi', 'Baridhora','Malibagh')),
	Gender varchar(10) check (Gender in ('Male','Female')),
	saving numeric(7),
	primary key (C_id)
	);
	

select * from customers
INSERT INTO customers(C_id,name,Branch,Gender,saving)
VALUES
('101',	'Rahim','Gulshan', 'Male','10000'),
('102',	'Karim','Banani',  'Male','20000'),
('103',	'John',	'Gulshan', 'Male','10500'),
('104',	'Akber','Dhanmondi','Male',	'40000'),
('105',	'Sahid','Baridhora','Male','35000'),
('106',	'Mila',	'Banani', 'Female',	'85000'),
('107',	'Sarah','Malibagh','Female','58000');

-- 2 Num Ans ----- 

(select name 
from customers
where Branch = 'Banani') 
union 
(select name 
from customers
where Branch = 'Gulshan');

-- 3 Num Ans ----- 

select * 
from customers
where Gender = 'Female' and Branch = 'Banani' and saving between 40000 and 60000;

-- 4 Num Ans ----- 

ALTER TABLE Customers
ADD withdraw varchar(255);

update customers
set withdraw = 500
where C_id >= 102;

-- 5 Num Ans ----- 

select name 	
from customers	
where name like '%im%';

-- 6 Num Ans ----- 

select min(saving) as low_saving 	
from customers; 	

-- 7 Num Ans ----- 

update customers
set Branch  = 'Banani'
where Branch = 'Gulshan' and c_id = 101;

-- 8 Num Ans ----- 

delete from customers
where C_id = 107;
