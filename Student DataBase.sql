create Database Customer1
create Table Customer
(
CustomerID int IDENTITY(1,1)PRIMARY KEY,
LastNAME Varchar (50) NOT NULL,
FirstNAME Varchar (50) NOT NULL,
AreaCODE int NULL,
Address varchar(200) NULL,
phone varchar (11) NULL,
)
select * from Customer
insert into Customer
values ('karim','khan',1207,'Dhaka','01687025556')