-- create database college

CREATE DATABASE college;

USE collge;

SELECT * FROM student;

-- creating table
CREATE TABLE student_2
(roll INT PRIMARY KEY,
name VARCHAR(20) NOT NULL,
class VARCHAR(5) DEFAULT 'XXXX',
marks FLOAT ,
age INT 
);

-- altering constraint
ALTER TABLE student_2 ADD CONSTRAINT check_1 CHECK (marks<=100 AND marks>0);
ALTER TABLE student_2 ADD CONSTRAINT check_2 CHECK (age>18);

-- dropping constraint
ALTER TABLE student_2 DROP CONSTRAINT check_1;
ALTER TABLE student_2 DROP CONSTRAINT check_2;

-- inserting values to the table
INSERT INTO student_2 VALUES 
(1,'Avishkar','BE',90.20,22), 
(2,'Abhishek','TE',99.20,20), 
(3,'Piyush','SE',88.40,24), 
(4,'Vijaya','FE',50,22), 
(5,'Kavya','TE',78.33,22), 
(6,'Manasi','BE',45.33,25);

-- sum, avg, count, max, min
SELECT sum(marks) AS 'total_marks' FROM student_2;
SELECT avg(marks) AS 'Average_marks' FROM student_2;
SELECT count(marks) AS 'count_rows' FROM student_2;
SELECT max(marks) AS 'Maximum_marks' FROM student_2;
SELECT min(marks) AS 'Minimum_marks' FROM student_2;

-- order by
SELECT * FROM student_2 ORDER BY name ASC;
SELECT * FROM student_2 ORDER BY marks DESC;

--GROUP BY
SELECT class FROM student_2 GROUP BY class;
SELECT COUNT(class) AS 'Class count',class FROM student_2 GROUP BY class;
-- SELECT COUNT(marks),name FROM student_2 GROUP WHERE age<20 GROUP BY age;

--having
SELECT age FROM student_2 GROUP BY age HAVING age>20;
-- average marks will show averge of same age people, when marks is null then it is not counted within average of marks
SELECT age,avg(marks) as 'Average' FROM student_2 GROUP BY age HAVING age>20;

-- distint
SELECT DISTINCT class FROM student_2;
SELECT DISTINCT age FROM student_2;  

-- like
SELECT * FROM student_2 WHERE class LIKE 'TE';
SELECT * FROM student_2 WHERE name LIKE 'A%';
SELECT * FROM student_2 WHERE name LIKE '_____';

-- between
SELECT * FROM student_2 WHERE marks BETWEEN 70 AND 100;
--altering the table column of age to date
ALTER TABLE student_2 
-- in and not in
SELECT * FROM student_2 WHERE roll IN (1,3,5);
SELECT * FROM student_2 WHERE roll NOT IN (1,3,5);

-- null and not null
SELECT * FROM student_2 WHERE marks IS NULL;
SELECT * FROM student_2 WHERE marks IS NOT NULL;

