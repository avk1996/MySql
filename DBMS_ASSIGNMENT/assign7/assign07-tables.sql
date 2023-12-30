CREATE TABLE Employee (Empid INTEGER,EmpName VARCHAR(20), Department VARCHAR(10), ContactNo LONG, EmailId VARCHAR(20), EmpHeadId INTEGER);

INSERT INTO Employee VALUES
(101, "Isha", "E-101", 1234567890, "isha@gmail.com", 105),
(102, "Priya", "E-104", 1234567890, "priya@yahoo.com", 103),
(103, "Neha", "E-101", 1234567890, "neha@gmail.com", 101),
(104, "Rahul", "E-102", 1234567890, "rahul@yahoo.com", 105),
(105, "Abhishek", "E-101", 1234567890, "abhishek@gmail.com", 102);

CREATE TABLE EmplDept (DeptID VARCHAR(10), DeptName VARCHAR(20),Dept_off VARCHAR(10), DeptHead INTEGER);

INSERT INTO EmplDept VALUES
("E-101", "HR", "Monday", 105),
("E-102", "Development", "Tuesday", 101),
("E-103", "House Keeping", "Saturday", 103),
("E-104", "Sales", "Sunday", 104),
("E-105", "Purchage", "Tuesday", 104);

CREATE TABLE EmpSalary (Empid INT,Salary INT,IsPermanent VARCHAR(3));

INSERT INTO EmpSalary VALUES
(101, 2000, "Yes"),
(102, 10000, "Yes"),
(103, 5000, "No"),
(104, 1900, "Yes"),
(105, 2300, "Yes");

CREATE TABLE Country (cid VARCHAR(5), cname VARCHAR(20));

INSERT INTO Country VALUES
("c-1","India"),
("c-2","USA"),
("c-3","China"),
("c-4","Pakistan"),
("c-5","Russia");

CREATE TABLE ClientTable (ClientId VARCHAR(5),ClientName VARCHAR(20),cid VARCHAR(6));

INSERT INTO ClientTable VALUES
("cl-1","ABC Group","c-1"),
("cl-2","PQR","c-1"),
("cl-3","XYZ","c-2"),
("cl-4","tech altum","c-3"),
("cl-5","mnp","c-5");

CREATE TABLE Project (ProjectId VARCHAR(5), Duration INT);

INSERT INTO Project VALUES
("p-1", 23),
("p-2", 15),
("p-3", 45),
("p-4", 2), 
("p-5", 30);

CREATE TABLE EmpProject (EmpId INT,ProjectId VARCHAR(5),ClientID VARCHAR(6),StartYear YEAR,EndYear YEAR);

INSERT INTO EmpProject VALUES
(101,"p-1","Cl-1", 2010, 2010),
(102,"p-2","Cl-2", 2010, 2012),
(103,"p-1","Cl-3", 2013, NULL), 
(104,"p-4","Cl-1", 2014, 2015),
(105,"p-4","Cl-5", 2015, NULL);