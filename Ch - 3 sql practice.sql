create database University_M_S;
create table timeslot(
time_slot_id varchar (4),
day varchar (1) check (day in ('M','T','W','R','F','S','U')),
start_time time,
end_time time,
primary key (time_slot_id, day, start_time));

select *from timeslot
INSERT INTO timeslot(time_slot_id,day,start_time,end_time)
VALUES
('A', 'M', '8:00', '8:50'),
('A', 'W', '8:00', '8:50'),
('A', 'F', '8:00', '8:50'),
('B', 'M', '9:00', '9:50'),
('B', 'W', '9:00', '9:50'),
('B', 'F', '9:00', '9:50'),
('C', 'M', '11:00', '11:50'),
('C', 'W', '11:00', '11:50'),
('C', 'F', '11:00', '11:50'),
('D', 'M', '13:00', '13:50'),
('D', 'W', '13:00', '13:50'),
('D', 'F', '13:00', '13:50'),
('E', 'T', '10:30', '11:45'),
('E', 'R', '10:30', '11:45'),
('F', 'T', '14:30', '15:45'),
('F', 'R', '14:30', '15:45'),
('G', 'M', '16:00', '16:50'),
('G', 'W', '16:00', '16:50'),
('G', 'F', '16:00', '16:50'),
('H', 'W', '10:00', '12:30');

create table department(
dept_name varchar (20),
building varchar (15),
budget numeric (12,2) check (budget > 0),
primary key (dept_name));

select *from department
INSERT INTO department(dept_name,building,budget)
VALUES
('Biology','Watson',90000),
('Comp. Sci.','Taylor',100000),
('Elec. Eng.','Taylor',85000),
('Finance', 'Painter', 120000),
('History', 'Painter', 50000),
('Music', 'Packard', 80000),
('Physics', 'Watson', 70000);

create table student(
ID varchar (5),
name varchar (20) not null,
dept_name varchar (20),
tot_cred numeric (3,0) check (tot_cred >= 0),
primary key (ID),
foreign key (dept_name) references department
on delete set null);

select *from student
INSERT INTO student(ID,name,dept_name,tot_cred)
VALUES
(00128, 'Zhang', 'Comp. Sci.', 102),
(12345, 'Shankar', 'Comp. Sci.', 32),
(19991, 'Brandt', 'History', 80),
(23121, 'Chavez', 'Finance', 110),
(44553, 'Peltier', 'Physics', 56),
(45678, 'Levy', 'Physics', 46),
(54321, 'Williams', 'Comp. Sci.', 54),
(55739, 'Sanchez', 'Music', 38),
(70557, 'Snow', 'Physics', 0),
(76543, 'Brown', 'Comp. Sci.', 58),
(76653, 'Aoi', 'Elec. Eng.', 60),
(98765, 'Bourikas', 'Elec. Eng.', 98),
(98988, 'Tanaka', 'Biology', 120);


create table instructor(
ID varchar (5),
name varchar (20) not null,
dept_name varchar (20),
salary numeric (8,2) check (salary > 29000),
primary key (ID),
foreign key (dept_name) references department
on delete set null);

select *from instructor
INSERT INTO instructor(ID,name,dept_name,salary)
VALUES
(10101, 'Srinivasan', 'Comp. Sci.', 65000),
(12121, 'Wu', 'Finance', 90000),
(15151, 'Mozart', 'Music', 40000),
(22222, 'Einstein', 'Physics', 95000),
(32343, 'El Said', 'History', 60000),
(33456, 'Gold', 'Physics', 87000),
(45565, 'Katz', 'Comp. Sci.', 75000),
(58583, 'Califieri', 'History', 62000),
(76543, 'Singh', 'Finance', 80000),
(76766, 'Crick', 'Biology', 72000),
(83821, 'Brandt', 'Comp. Sci.', 92000),
(98345, 'Kim', 'Elec. Eng.', 80000);

select name
from instructor
where dept_name = 'Comp. Sci.'and salary > 80000

select name	
from instructor	
where name like '%gol%' 

select name
from instructor
where salary between 90000 and 100000

select avg (salary)
from instructor
where dept_name= 'Comp. Sci.';

select dept_name, avg_salary
from (select dept_name, avg (salary)            
from instructor           
group by dept_name) as dept_avg (dept_name, avg_salary)
where avg_salary > 42000;

select dept_name, avg (salary)
from instructor
group by dept_name
having avg (salary) > 42000;

with dept_total (dept_name, value) as
        (select dept_name, sum(salary)
         from instructor
         group by dept_name),
dept_total_avg(value) as
       (select avg(value)
       from dept_total)
select dept_name
from dept_total, dept_total_avg
where dept_total.value > dept_total_avg.value;

select dept_name,              
(select count(*)                  
from instructor                 
where department.dept_name = instructor.dept_name)             
as num_instructorsfrom department;

select name 
from instructor
where salary > all(select salary
					from instructor
					where dept_name = 'Biology');

create table advisor(
s_ID varchar (5),
i_ID varchar (5),
primary key (s_ID),
foreign key (i_ID) references instructor (ID)
on delete set null,
foreign key (s_ID) references student (ID)
on delete cascade);

select *from advisor
INSERT INTO advisor(s_ID,i_ID)
VALUES
(00128, 45565),
(12345, 10101),
(23121, 76543),
(44553, 22222),
(45678, 22222),
(76543, 45565),
(76653, 98345),
(98765, 98345),
(98988, 76766);

create table course(
course_id varchar (8),
title varchar (50),
dept_name varchar (20),
credits numeric (2,0) check (credits > 0),
primary key (course_id),
foreign key (dept_name) references department
on delete set null);

select *from course
INSERT INTO course(course_id,title,dept_name,credits)
VALUES
('BIO-101', 'Intro. to Biology', 'Biology', 4),
('BIO-301', 'Genetics', 'Biology', 4),
('BIO-399', 'Computational Biology', 'Biology', 3),
('CS-101', 'Intro. to Computer Science', 'Comp. Sci.', 4),
('CS-190', 'Game Design', 'Comp. Sci.', 4),
('CS-315', 'Robotics', 'Comp. Sci.', 3),
('CS-319', 'Image Processing', 'Comp. Sci.', 3),
('CS-347', 'Database System Concepts', 'Comp. Sci.', 3),
('EE-181', 'Intro. to Digital Systems', 'Elec. Eng.', 3),
('FIN-201', 'Investment Banking', 'Finance', 3),
('HIS-351', 'World History', 'History', 3),
('MU-199', 'Music Video Production', 'Music', 3),
('PHY-101', 'Physical Principles', 'Physics', 4);

create table prereq(
course_id varchar(8),
prereq_id varchar(8),
primary key (course_id, prereq_id),
foreign key (course_id) references course
on delete cascade,
foreign key (prereq_id) references course);

select *from prereq
INSERT INTO prereq(course_id,prereq_id)
VALUES
('BIO-301', 'BIO-101'),
('BIO-399', 'BIO-101'),
('CS-190', 'CS-101'),
('CS-315', 'CS-101'),
('CS-319', 'CS-101'),
('CS-347', 'CS-101'),
('EE-181', 'PHY-101');

create table classroom(
building varchar (15),
room_number varchar (7),
capacity numeric (4),
primary key (building, room_number));

select *from classroom
INSERT INTO classroom(building,room_number,capacity)
VALUES
('Packard', '101' , '100'),
('Painter', '514', '10'),
('Taylor', '3128', '70'),
('Watson', '100', '30'),
('Watson', '120', '50');

create table section(
course_id varchar (8),
sec_id varchar (8),
semester varchar (6) check (semester in('Fall', 'Winter', 'Spring', 'Summer')),
year numeric (4,0) check (year > 1701 and year < 2100),
building varchar (15),
room_number varchar (7),
time_slot_id varchar (4),
primary key (course_id, sec_id, semester, year),
foreign key (course_id) references course on delete cascade,
foreign key (building, room_number) references classroom on delete set null);

select *from section
INSERT INTO section(course_id,sec_id,semester,year,building,room_number,time_slot_id)
VALUES
('BIO-101', 1, 'Summer', 2009, 'Painter', 514, 'B'),
('BIO-301', 1, 'Summer', 2010, 'Painter', 514, 'A'),
('CS-101', 1, 'Fall', 2009, 'Packard', 101, 'H'),
('CS-101', 1, 'Spring', 2010, 'Packard', 101, 'F'),
('CS-190', 1, 'Spring', 2009, 'Taylor', 3128, 'E'),
('CS-190', 2, 'Spring', 2009, 'Taylor', 3128, 'A'),
('CS-315', 1, 'Spring', 2010, 'Watson', 120, 'D'),
('CS-319', 1, 'Spring', 2010, 'Watson', 100, 'B'),
('CS-319', 2, 'Spring', 2010, 'Taylor', 3128, 'C'),
('CS-347', 1, 'Fall', 2009, 'Taylor', 3128, 'A'),
('EE-181', 1, 'Spring', 2009, 'Taylor', 3128, 'C'),
('FIN-201', 1, 'Spring', 2010, 'Packard', 101, 'B'),
('HIS-351', 1, 'Spring', 2010, 'Painter', 514, 'C'),
('MU-199', 1, 'Spring', 2010, 'Packard', 101, 'D'),
('PHY-101', 1, 'Fall', 2009, 'Watson', 100, 'A');

select course_id   
from section as S   
where semester = 'Fall' and year = 2009 and exists (select *  
from section as T                            
where semester = 'Spring' and year= 2010                                         
and S.course_id = T.course_id);

(select course_id from section where semester = 'Fall' and year = 2009)
 union
(select course_id from section where semester = 'Spring' and year = 2010)

(select course_id from section where semester = 'Fall' and year = 2009)
  intersect
(select course_id from section where semester = 'Spring' and year = 2010)

(select course_id from section where semester = 'Fall' and year = 2009)
 except
(select course_id from section where semester = 'Spring' and year = 2010)

(select course_id from section where semester = 'Fall' and year = 2009)
 unionall
(select course_id from section where semester = 'Spring' and year = 2010)

select distinct course_id
from section
where semester = 'Fall' and year= 2009 and            
course_id in (select course_id
from section
where semester = 'Spring' and year= 2010);

select distinct course_id
from section
where semester = 'Fall' and year= 2009 and            
course_id not in (select course_id
from section
where semester = 'Spring' and year= 2010);

create table teaches(
ID varchar (5),
course_id varchar(8),
sec_id varchar (8),
semester varchar (6),
year numeric (4,0),
primary key (ID, course_id, sec_id, semester, year),
foreign key (course_id, sec_id, semester, year) references section on delete cascade,
foreign key (ID) references instructor
on delete cascade);

select *from teaches
INSERT INTO teaches(ID,course_id,sec_id,semester,year)
VALUES
(10101, 'CS-101', 1, 'Fall', 2009),
(10101, 'CS-315', 1, 'Spring', 2010),
(10101, 'CS-347', 1, 'Fall', 2009),
(12121, 'FIN-201', 1, 'Spring', 2010),
(15151, 'MU-199', 1, 'Spring', 2010),
(22222, 'PHY-101', 1, 'Fall', 2009),
(32343, 'HIS-351', 1, 'Spring', 2010),
(45565, 'CS-101', 1, 'Spring', 2010),
(45565, 'CS-319', 1, 'Spring', 2010),
(76766, 'BIO-101', 1, 'Summer', 2009),
(76766, 'BIO-301', 1, 'Summer', 2010),
(83821, 'CS-190', 1, 'Spring', 2009),
(83821, 'CS-190', 2, 'Spring', 2009),
(83821, 'CS-319', 2, 'Spring', 2010),
(98345, 'EE-181', 1, 'Spring', 2009);

select count (distinct ID)
from teaches
where semester = 'Spring' and year = 2010;

select name, 
course_idfrom instructor, 
teacheswhere instructor.ID = teaches.ID  and  instructor. dept_name = 'Art';

create table takes(
ID varchar (5),
course_id varchar (8),
sec_id varchar (8),
semester varchar (6),
year numeric (4,0),
grade varchar (2),
primary key (ID, course_id, sec_id, semester, year),
foreign key (course_id, sec_id, semester, year) references section
on delete cascade,
foreign key (ID) references student
on delete cascade);

select * from takes
INSERT INTO takes(ID,course_id,sec_id,semester,year,grade)
VALUES
(00128, 'CS-101', 1, 'Fall', 2009, 'A'),
(00128, 'CS-347', 1, 'Fall', 2009, 'A-'),
(12345, 'CS-101', 1, 'Fall', 2009, 'C'),
(12345, 'CS-190', 2, 'Spring', 2009, 'A'),
(12345, 'CS-315', 1, 'Spring', 2010, 'A'),
(12345, 'CS-347', 1, 'Fall', 2009, 'A'),
(19991, 'HIS-351', 1, 'Spring', 2010, 'B'),
(23121, 'FIN-201', 1, 'Spring', 2010, 'C+'),
(44553, 'PHY-101', 1, 'Fall', 2009, 'B-'),
(45678, 'CS-101', 1, 'Fall', 2009, 'F'),
(45678, 'CS-101', 1, 'Spring', 2010, 'B+'),
(45678, 'CS-319', 1, 'Spring', 2010, 'B'),
(54321, 'CS-101', 1, 'Fall', 2009, 'A-'),
(54321, 'CS-190', 2, 'Spring', 2009, 'B+'),
(55739, 'MU-199', 1, 'Spring', 2010, 'A-'),
(76543, 'CS-101', 1, 'Fall', 2009, 'A'),
(76543, 'CS-319', 2, 'Spring', 2010, 'A'),
(76653, 'EE-181', 1, 'Spring', 2009, 'C'),
(98765, 'CS-101', 1, 'Fall', 2009, 'C-'),
(98765, 'CS-315', 1, 'Spring', 2010, 'B'),
(98988, 'BIO-101', 1, 'Summer', 2009, 'A'),
(98988, 'BIO-301', 1, 'Summer', 2010, null);

select count(distinct ID)
from takes
where (course_id, sec_id, semester, year) in (select course_id, sec_id, semester, year  
from teaches
where teaches.ID= 10101);

-- course id does not exists because sql does not support --

select distinct S.ID, S.name
from student as S
where not exists ( (select course_id
from course
where dept_name = 'Biology')
except(select T.course_id
from takes as T
where S.ID = T.ID));

-- Unique does not exists because sql does not support --

select T.course_idfrom course as Twhere unique (select R.course_id                           
from section as R                           
where T.course_id= R.course_id and R.year = 2009);

insert into student             
values ('3003', 'Green', 'Finance', null);

insert into course (course_id, title, dept_name, credits)             
values ('CS-437', 'Database Systems', 'Comp. Sci.', 4);

insert into student	
select ID, name, dept_name, 0         
from   instructor

delete from instructor               
where dept_name in (select dept_name                                                        
from department                                                        
where building = 'Watson');

delete from instructor
where salary < (select avg (salary) 
from instructor);

update instructor               
set salary = salary * 1.03               
where salary > 100000;  
         
update instructor                
set salary = salary * 1.05                
where salary <= 100000;

update student S      
set tot_cred = (select sum(credits)                              
from takes, course                              
where takes.course_id = course.course_id and                                          
S.ID= takes.ID.and                             				   
takes.grade <> 'F' and                                         
takes.grade is not null);
