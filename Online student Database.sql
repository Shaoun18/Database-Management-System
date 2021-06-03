create database online2;

----- 1 Num  Ans --------

create table student1(
S_id varchar(255),
Name varchar(255),
Section varchar(255) check (Section in('A','B','C')),
Gender varchar (11) check (Gender in ('Male','Female')),
Cgpa numeric (3,2),
);

select * from student1
insert into student1(S_id,Name,Section,Gender,Cgpa) 
values 
('1',	'Robert',	'A',	'Male',	    '3.80'),
('2',	'Karim',	'A',	'Male',	    '3.90'),
('3',	'Sam',	    'B',	'Male',	    '2.60'),
('4',	'Julia',	'C',	'Female',	'4.00'),
('5',	'Adrina',	'C',	'Female',	'3.25'),
('6',	'Anderson',	'A',	'Male',	    '3.67'),
('7',	'Sarah',	'B',	'Female',	'2.98'),
('8',	'Johnson',	'B',	'Male',	    '3.45'),
('9',	'James',	'A',	'Male',	    '3.51'),
('10',	'Sarah',	'C',	'Female',	'3.68');

----- 2 Num Ans ---------

(select Name
from student1
where Section = 'A')
union 
(select Name
from student1
where Section = 'B')

---- 3 Num Ans --------

select TOP 3 S_id
from student1
where Gender = 'Male' and Section = 'A'

---- 4 Num Ans --------

select *
from student1
where Gender='Female' and Cgpa between 3 and 3.5 and Section in (select Section
																from Student1
																where Section='A' or Section='C')

---- 5 Num Ans --------

Alter table student1
add Age varchar (5)

update student1
set Age = 18
where S_id in(select TOP 5 S_id
			  from Student1)  

---- 6 Num Ans --------

select Name,Section
from Student1
where Name like'------%' or name like '%on'

---- 7 Num Ans --------

select Name 
from student1
where Name like '%a%' 

---- 8 Num Ans --------

select min(Cgpa) as Lowest_GP
from student1

---- 9 Num Ans --------

update student1
set Cgpa = case
when Cgpa < 3.90 then Cgpa + 0.05
end

---- 10 Num Ans --------

delete from student1
where S_id = 10