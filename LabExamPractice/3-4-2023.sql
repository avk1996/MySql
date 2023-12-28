--3-4-2023

CREATE TABLE Worker ( 
 WORKER_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT, 
 FIRST_NAME CHAR(25), 
 LAST_NAME CHAR(25), 
 SALARY INT(15), 
 JOINING_DATE DATETIME, 
 DEPARTMENT CHAR(25) 
); 
 
INSERT INTO Worker  
 (WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES 
  (001, 'Monika', 'Arora', 100000, '14-02-20 09.00.00', 'HR'), 
  (002, 'Niharika', 'Verma', 80000, '14-06-11 09.00.00', 'Admin'), 
  (003, 'Vishal', 'Singhal', 300000, '14-02-20 09.00.00', 'HR'), 
  (004, 'Amitabh', 'Singh', 500000, '14-02-20 09.00.00', 'Admin'), 
  (005, 'Vivek', 'Bhati', 500000, '14-06-11 09.00.00', 'Admin'), 
  (006, 'Vipul', 'Diwan', 200000, '14-06-11 09.00.00', 'Account'), 
  (007, 'Satish', 'Kumar', 75000, '14-01-20 09.00.00', 'Account'), 
  (008, 'Geetika', 'Chauhan', 90000, '14-04-11 09.00.00', 'Admin'); 
 
CREATE TABLE Bonus ( 
 WORKER_REF_ID INT, 
 BONUS_AMOUNT INT(10), 
 BONUS_DATE DATETIME, 
 FOREIGN KEY (WORKER_REF_ID) 
  REFERENCES Worker(WORKER_ID) 
        ON DELETE CASCADE 
);

 
-- TCM / DI / 33 - Rev 00                                                                                                                      Page 2 of 3 
INSERT INTO Bonus  
 (WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES 
  (001, 5000, '16-02-20'), 
  (002, 3000, '16-06-11'), 
  (003, 4000, '16-02-20'), 
  (001, 4500, '16-02-20'), 
  (002, 3500, '16-06-11'); 
 
 
CREATE TABLE Title ( 
 WORKER_REF_ID INT, 
 WORKER_TITLE CHAR(25), 
 AFFECTED_FROM DATETIME, 
 FOREIGN KEY (WORKER_REF_ID) 
  REFERENCES Worker(WORKER_ID) 
        ON DELETE CASCADE 
); 

INSERT INTO Title  
 (WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES 
 (001, 'Manager', '2016-02-20 00:00:00'), 
 (002, 'Executive', '2016-06-11 00:00:00'), 
 (008, 'Executive', '2016-06-11 00:00:00'), 
 (005, 'Manager', '2016-06-11 00:00:00'), 
 (004, 'Asst. Manager', '2016-06-11 00:00:00'), 
 (007, 'Executive', '2016-06-11 00:00:00'), 
 (006, 'Lead', '2016-06-11 00:00:00'), 
 (003, 'Lead', '2016-06-11 00:00:00'); 

-- 1 SOLVE THE BELOW QUESTIONS EACH QUESTION OF 2 MARKS 
  
-- i. WRITE AN SQL QUERY TO FETCH FULLNAME , SALARY , JOINING_DATE AND DEPARTMENT FROM 
-- WORKER TABLE. 
SELECT FIRST_NAME,SALARY,JOINING_DATE, DEPARTMENT FROM Worker;

--     ii.WRITE AN SQL QUERY TO FETCH ID , FULLNAME , SALARY AND DEPARTMENT WHOSE DEPARTMENT 
-- IS HR OR ADMIN 

SELECT WORKER_ID, CONCAT(FIRST_NAME," ",LAST_NAME) AS FULLNAME, SALARY FROM Worker WHERE DEPARTMENT IN ("HR","ADMIN");
--    iii.WRITE AN SQL QUERY TO FETCH ID , FULLNAME , SALARY WHOSE FIRST_NAME ENDS WITH 'a'

SELECT WORKER_ID,CONCAT(FIRST_NAME," ",LAST_NAME) AS FULLNAME, SALARY FROM Worker WHERE SUBSTR(FIRST_NAME,-1) = 'a';
--    iv. WRITE AN SQL QUERY TO FEACH ALL RECORDS OF WORKER TABLE WHO HAVE JOIN IN FEB 2020 

SELECT * FROM Worker WHERE  YEAR(JOINING_DATE) = 2020 AND MONTH(JOINING_DATE) = 4;

--     V. WRITE AN SQL QUERY TO FEACH ALL RECORDS OF WORKER TABLE WHO HAVE SALARY >=50000 
-- AND <=100000.   
 
 SELECT * FROM worker WHERE SALARY BETWEEN 50000 AND 100000;

-- 2 SOLVE THE BELOW QUESTIONS EACH QUESTION OF 3 MARKS  
 
--    i. WRITE AN SQL QUERY TO DISPLAY NUMBER OF WORKER IN EACH DEPARTMENT ALONG WITH 
-- UNIQUE DEPARTMENT NAME 
SELECT COUNT(*) AS WORKER_NUMBER,DEPARTMENT FROM worker GROUP BY DEPARTMENT;

--    ii.WRITE AN SQL QUERY TO DISPLAY DEPARTMENT NAME AND TOTAL BONUS AMOUNT TO BE PAID IN 
-- EACH DEPARTMENT 

SELECT w.DEPARTMENT AS DEPARTMENT_NAME,SUM(b.BONUS_AMOUNT) AS TOTAL_BONUS_AMOUNT
FROM worker w INNER JOIN bonus b ON w.WORKER_ID = b.WORKER_REF_ID GROUP BY w.DEPARTMENT;

--   iii.WRITE AN SQL QUERY TO DISPALY THE FULLNAME , SALARY , TOTAL YEARS OF EXPERIANCE OF 
-- EACH WORKER  

SELECT CONCAT(FIRST_NAME," ",LAST_NAME) AS FULLNAME,
SALARY,
DATE_FORMAT(FROM_DAYS(DATEDIFF(NOW(),JOINING_DATE)),'%Y')+0 AS TOTAL_YEARS 
FROM worker;

--OR

SELECT CONCAT(FIRST_NAME," ",LAST_NAME) AS FULLNAME,
SALARY,
FLOOR((DATEDIFF(NOW(),JOINING_DATE))/365) AS TOTAL_YEARS
FROM worker;

--    iv.WRITE AN SQL QUERY TO DISPALY THE DETAILS OF THE WORKER WHO IS MANAGER  

SELECT w.WORKER_ID, w.FIRST_NAME, w.LAST_NAME, w.SALARY, w.JOINING_DATE, w.DEPARTMENT, t.WORKER_TITLE
FROM worker w INNER JOIN  title t ON w.WORKER_ID = t.WORKER_REF_ID WHERE WORKER_TITLE='manager';

-- ACTS, Head Quarters, Pune                               
 
-- 3 SOLVE THE BELOW QUESTIONS EACH QUESTION OF 4 MARKS 
 
-- i. CREATE SAMPLE_DB IN MONGO DATABASE  
--    -CREATE COLLECTION IN SIMPLE_DB AS MY_COL 
--      INSERT THE BELOW DATA 
db.mycol.insertMany([ 
  { title: "MongoDB Overview",  description: "MongoDB is no SQL database",  by: "tutorials point", url: "http://www.tutorialspoint.com", tags: ["mongodb", "database", "NoSQL"], likes: 100 }, 
 { 
  title: "NoSQL Database", 
  description: "NoSQL database doesn't have tables", 
  by: "tutorials point", 
  url: "http://www.tutorialspoint.com", 
  tags: ["mongodb", "database", "NoSQL"], 
  likes: 20, 
  comments: [ 
   { 
    user:"user1", 
    message: "My first comment", 
    dateCreated: new Date(2013,11,10,2,35), 
    like: 0 
   } 
  ] 
 } 
]) 

db.mycol.insertOne( 
  { title: "MongoDB Overview",  description: "MongoDB is no SQL database",  by: "tutorials point", url: "http://www.tutorialspoint.com", tags: ["mongodb", "database", "NoSQL"], likes: 100 })

db.mycol.insertOne({ title: "NoSQL Database", description: "NoSQL database doesn't have tables", by: "tutorials point", url: "http://www.tutorialspoint.com", tags: ["mongodb", "database", "NoSQL"], likes: 20, comments: [ { user:"user1", message: "My first comment", dateCreated: new Date(2013,11,10,2,35), like: 0 }]})
 
-- 1.SHOW THE DOCUMENTS THAT HAS LIKES GREATER THAN 10     

db.mycol.find({likes:{$gt:10}});
--link: https://www.tutorialspoint.com/mongodb/mongodb_query_document.htm
-- 2.SHOW THE DOCUMENTS THAT HAS USER NAME AS ‘user1’  

db.mycol.find({"comments.user":"user1"}) 

--   ii. CREATE A FUNCTION IN MYSQL THAT WILL ACCEPT THE ONE INPUT PARAMETER AS WORKER ID 
-- AND BASED ON THE ID 
--       RETURN THE TOTAL SALARY IN EACH DEPARTMENTS 
 
 
 DELIMITER //
 CREATE FUNCTION 3_4_23.worker(Id INT)
 RETURNS INT 
 DETERMINISTIC
 BEGIN
  DECLARE ret_salary INT
  SELECT SUM(SALARY) INTO ret_salary FROM worker GROUP BY DEPARTMENT WHERE WORKER_ID=Id;
  return ret_salary;
 END//
 DELIMITER;
 
 SELECT SUM(SALARY) FROM worker  WHERE WORKER_ID=? GROUP BY DEPARTMENT;

 3_4_23.
-- 4 CREATE A CURSOR IN MYSQL, BY USING THE CURSOR RETURN THE COMMA SEPRATED LIST OF 
-- WORKER NAMES               5 MARKS 
--    eg. Monika , Vishal , Satish , Vipul ...... 
 
 
 
 
-- 5 CREATE A AFTER INSERT TRIGGER IN MYSQL     ..        5 MARKS  
--   CREATE AN EMP_DETAILS TABLES AS FOLLOWS  
--     ID , FIRST_NAME , LAST_NAME , DEPARTMENT_ID ,SALARY  
--    WHEN AN INSERT HAPPEN INTO THE EMP_DETAILS TABLE INSERT THE  FIRST_NAME , LAST_NAME 
-- AND SALARY INTO THE 
--     EMP_LOG_DETAILS TABLE 
