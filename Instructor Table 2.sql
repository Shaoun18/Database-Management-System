CREATE TABLE INSTRUCTOR(
ID char(5),
NAME varchar(20),
DEPT_NAME varchar(20),
SALARY numeric(8,2),
PRIMARY Key(ID),
FOREIGN Key (dept_name)references department);