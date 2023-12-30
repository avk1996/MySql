create database college;
use college;

show tables;

create table student(roll int, name varchar(20),class varchar(5), marks float, age int);

insert into student values (1,'Avishkar','BE',90.20,22);
insert into student values (2,'Abhishek','TE',99.20,20);
insert into student values (3,'Piyush','SE',88.40,24);
insert into student values (4,'Vijaya','FE',50,22);
insert into student values (5,'Kavya','TE',78.33,22);
insert into student values (6,'Manasi','BE',45.33,25);

select * from student;

delete from student where roll=4;
select * from student;

update student set marks=90 where roll=3;
select * from student;

update student set marks=marks+0.5;
select * from student;

truncate student;

insert into student values 
(1,'Avishkar','BE',90.20,22), 
(2,'Abhishek','TE',99.20,20), 
(3,'Piyush','SE',88.40,24), 
(4,'Vijaya','FE',50,22), 
(5,'Kavya','TE',78.33,22), 
(6,'Manasi','BE',45.33,25);
