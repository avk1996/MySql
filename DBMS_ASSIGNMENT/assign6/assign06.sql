-- Assignment 5:

mysql> CREATE TABLE Worker (
    ->     WORKER_ID INT PRIMARY KEY,
    ->     FIRST_NAME VARCHAR(50),
    ->     LAST_NAME VARCHAR(50),
    ->     SALARY DECIMAL(10, 2),
    ->     JOINING_DATE DATETIME,
    ->     DEPARTMENT VARCHAR(50)
    -> );

mysql> INSERT INTO Worker (WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT)
    -> VALUES
    ->     (1, 'Monika', 'Arora', 100000.00, '2014-02-20 09:00:00', 'HR'),
    ->     (2, 'Niharik', 'Verma', 80000.00, '2014-06-11 09:00:00', 'Admin'),
    ->     (3, 'Vishal', 'Singhal', 300000.00, '2014-02-20 09:00:00', 'HR'),
    ->     (4, 'Amitabh', 'Singh', 500000.00, '2014-02-20 09:00:00', 'Admin'),
    ->     (5, 'Vivek', 'Bhati', 500000.00, '2014-06-11 09:00:00', 'Admin'),
    ->     (6, 'Vipul', 'Diwan', 200000.00, '2014-06-11 09:00:00', 'Account'),
    ->     (7, 'Satish', 'Kumar', 75000.00, '2014-01-20 09:00:00', 'Account'),
    ->     (8, 'Geetika', 'Chauhan', 90000.00, '2014-04-11 09:00:00', 'Admin');
Query OK, 8 rows affected (0.19 sec)
Records: 8  Duplicates: 0  Warnings: 0

-- 1. Write an SQL query to fetch “FIRST_NAME” from the Worker table using the alias name <WORKER_NAME>.

mysql> SELECT FIRST_NAME AS 'WORKER_NAME' FROM Worker;
+-------------+
| WORKER_NAME |
+-------------+
| Monika      |
| Niharik     |
| Vishal      |
| Amitabh     |
| Vivek       |
| Vipul       |
| Satish      |
| Geetika     |
+-------------+
8 rows in set (0.00 sec)

-- 2. Write an SQL query to fetch “FIRST_NAME” from the Worker table in upper case.

mysql> SELECT UPPER(FIRST_NAME) AS UPPER_CASE_FIRST_NAME FROM Worker;
+-----------------------+
| UPPER_CASE_FIRST_NAME |
+-----------------------+
| MONIKA                |
| NIHARIK               |
| VISHAL                |
| AMITABH               |
| VIVEK                 |
| VIPUL                 |
| SATISH                |
| GEETIKA               |
+-----------------------+
8 rows in set (0.03 sec)

-- 3. Write an SQL query to fetch unique values of DEPARTMENT from the Worker table.

mysql> SELECT DISTINCT DEPARTMENT FROM Worker;
+------------+
| DEPARTMENT |
+------------+
| HR         |
| Admin      |
| Account    |
+------------+
3 rows in set (0.00 sec)

-- 4. Write an SQL query to print the first three characters of FIRST_NAME from the Worker table.

mysql> SELECT SUBSTRING(FIRST_NAME,1,3) 'First_name_3_letters' FROM Worker;
+----------------------+
| First_name_3_letters |
+----------------------+
| Mon                  |
| Nih                  |
| Vis                  |
| Ami                  |
| Viv                  |
| Vip                  |
| Sat                  |
| Gee                  |
+----------------------+
8 rows in set (0.00 sec)

-- 5. Write an SQL query to find the position of the alphabet (‘a’) in the first name column ‘Amitabh’ from the Worker table.

-- 6. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending.

mysql> SELECT * FROM Worker ORDER BY FIRST_NAME ASC;
+-----------+------------+-----------+-----------+---------------------+------------+
| WORKER_ID | FIRST_NAME | LAST_NAME | SALARY    | JOINING_DATE        | DEPARTMENT |
+-----------+------------+-----------+-----------+---------------------+------------+
|         4 | Amitabh    | Singh     | 500000.00 | 2014-02-20 09:00:00 | Admin      |
|         8 | Geetika    | Chauhan   |  90000.00 | 2014-04-11 09:00:00 | Admin      |
|         1 | Monika     | Arora     | 100000.00 | 2014-02-20 09:00:00 | HR         |
|         2 | Niharik    | Verma     |  80000.00 | 2014-06-11 09:00:00 | Admin      |
|         7 | Satish     | Kumar     |  75000.00 | 2014-01-20 09:00:00 | Account    |
|         6 | Vipul      | Diwan     | 200000.00 | 2014-06-11 09:00:00 | Account    |
|         3 | Vishal     | Singhal   | 300000.00 | 2014-02-20 09:00:00 | HR         |
|         5 | Vivek      | Bhati     | 500000.00 | 2014-06-11 09:00:00 | Admin      |
+-----------+------------+-----------+-----------+---------------------+------------+
8 rows in set (0.00 sec)

-- 7. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending and DEPARTMENT Descending.

mysql> SELECT * FROM Worker ORDER BY FIRST_NAME ASC,DEPARTMENT DESC;
+-----------+------------+-----------+-----------+---------------------+------------+
| WORKER_ID | FIRST_NAME | LAST_NAME | SALARY    | JOINING_DATE        | DEPARTMENT |
+-----------+------------+-----------+-----------+---------------------+------------+
|         4 | Amitabh    | Singh     | 500000.00 | 2014-02-20 09:00:00 | Admin      |
|         8 | Geetika    | Chauhan   |  90000.00 | 2014-04-11 09:00:00 | Admin      |
|         1 | Monika     | Arora     | 100000.00 | 2014-02-20 09:00:00 | HR         |
|         2 | Niharik    | Verma     |  80000.00 | 2014-06-11 09:00:00 | Admin      |
|         7 | Satish     | Kumar     |  75000.00 | 2014-01-20 09:00:00 | Account    |
|         6 | Vipul      | Diwan     | 200000.00 | 2014-06-11 09:00:00 | Account    |
|         3 | Vishal     | Singhal   | 300000.00 | 2014-02-20 09:00:00 | HR         |
|         5 | Vivek      | Bhati     | 500000.00 | 2014-06-11 09:00:00 | Admin      |
+-----------+------------+-----------+-----------+---------------------+------------+
8 rows in set (0.00 sec)

-- 8. Write an SQL query to print details for Workers with the first names “Vipul” and “Satish” from the Worker table.

mysql> SELECT * FROM Worker WHERE FIRST_NAME IN ('Satish','Vivek');
+-----------+------------+-----------+-----------+---------------------+------------+
| WORKER_ID | FIRST_NAME | LAST_NAME | SALARY    | JOINING_DATE        | DEPARTMENT |
+-----------+------------+-----------+-----------+---------------------+------------+
|         5 | Vivek      | Bhati     | 500000.00 | 2014-06-11 09:00:00 | Admin      |
|         7 | Satish     | Kumar     |  75000.00 | 2014-01-20 09:00:00 | Account    |
+-----------+------------+-----------+-----------+---------------------+------------+
2 rows in set (0.00 sec)

-- 9. Write an SQL query to print details of workers excluding first names, “Vipul” and “Satish” from the Worker table.

mysql> SELECT * FROM Worker WHERE NOT (FIRST_NAME='Satish' OR FIRST_NAME='Vivek');
+-----------+------------+-----------+-----------+---------------------+------------+
| WORKER_ID | FIRST_NAME | LAST_NAME | SALARY    | JOINING_DATE        | DEPARTMENT |
+-----------+------------+-----------+-----------+---------------------+------------+
|         1 | Monika     | Arora     | 100000.00 | 2014-02-20 09:00:00 | HR         |
|         2 | Niharik    | Verma     |  80000.00 | 2014-06-11 09:00:00 | Admin      |
|         3 | Vishal     | Singhal   | 300000.00 | 2014-02-20 09:00:00 | HR         |
|         4 | Amitabh    | Singh     | 500000.00 | 2014-02-20 09:00:00 | Admin      |
|         6 | Vipul      | Diwan     | 200000.00 | 2014-06-11 09:00:00 | Account    |
|         8 | Geetika    | Chauhan   |  90000.00 | 2014-04-11 09:00:00 | Admin      |
+-----------+------------+-----------+-----------+---------------------+------------+
6 rows in set (0.00 sec)

-- 10. Write an SQL query to print details of Workers with DEPARTMENT name as “Admin”.

mysql> SELECT * FROM Worker WHERE DEPARTMENT='Admin';
+-----------+------------+-----------+-----------+---------------------+------------+
| WORKER_ID | FIRST_NAME | LAST_NAME | SALARY    | JOINING_DATE        | DEPARTMENT |
+-----------+------------+-----------+-----------+---------------------+------------+
|         2 | Niharik    | Verma     |  80000.00 | 2014-06-11 09:00:00 | Admin      |
|         4 | Amitabh    | Singh     | 500000.00 | 2014-02-20 09:00:00 | Admin      |
|         5 | Vivek      | Bhati     | 500000.00 | 2014-06-11 09:00:00 | Admin      |
|         8 | Geetika    | Chauhan   |  90000.00 | 2014-04-11 09:00:00 | Admin      |
+-----------+------------+-----------+-----------+---------------------+------------+
4 rows in set (0.00 sec)

-- 11. Write an SQL query to print details of the Workers whose FIRST_NAME contains ‘a’.

mysql> SELECT FIRST_NAME FROM Worker WHERE FIRST_NAME LIKE 'a%';
+------------+
| FIRST_NAME |
+------------+
| Amitabh    |
+------------+
1 row in set (0.00 sec)

-- 12. Write an SQL query to print names of the Workers whose FIRST_NAME ends with ‘a’.

mysql> SELECT FIRST_NAME FROM Worker WHERE FIRST_NAME LIKE '%a';
+------------+
| FIRST_NAME |
+------------+
| Monika     |
| Geetika    |
+------------+
2 rows in set (0.00 sec)

-- 13. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets.

mysql> SELECT FIRST_NAME FROM Worker WHERE FIRST_NAME LIKE '%h' AND FIRST_NAME LIKE '______';
+------------+
| FIRST_NAME |
+------------+
| Satish     |
+------------+
1 row in set (0.00 sec)

-- 14. Write an SQL query to print details of the Workers whose SALARY lies between
-- 100000 and 500000.

SELECT * FROM Worker WHERE SALARY BETWEEN 100000 AND 500000;

-- 15. Write an SQL query to print details of the Workers who joined in Feb’2014.

SELECT * FROM Worker WHERE JOINING_DATE = YEAR(2014) AND JOINING_DATE = MONTH(04);

-- 16. Write an SQL query to fetch the count of employees working in the department
-- ‘Admin’.
PENDING
SELECT COUNT(*) AS 'Admins in Worker' FROM Worker WHERE DEPARTMENT="Admin";

-- 17. Write an SQL query to fetch worker names with salaries >= 50000 and <=
-- 100000.

SELECT * FROM Worker WHERE SALARY BETWEEN 50000 AND 100000;

-- 18. Write an SQL query to fetch the no. of workers for each department in
-- descending order.

SELECT DEPARTMENT,COUNT(*) AS 'NUMBER OF WORKERS' FROM Worker GROUP BY DEPARTMENT ORDER BY COUNT(DEPARTMENT) DESC;

-- 19. Write an SQL query to print details of the Workers who are also Managers.

SELECT * FROM Worker w 
INNER JOIN
Title t
ON t.WORKER_REF_ID=w.WORKER_ID 
AND t.WORKER_TITLE = "Manager";

-- 20. Write an SQL query to fetch duplicate records having matching data in some
-- fields of a table.

PENDING:SELECT DISTINCT DEPARTMENT FROM Worker;

-- 21. Write an SQL query to show only odd rows from a table.

SELECT * FROM Worker WHERE WORKER_ID%2!=0;
SELECT * FROM Worker WHERE MOD(WORKER_ID,2)!=0;

-- 22. Write an SQL query to show only even rows from a table.

SELECT * FROM Worker WHERE WORKER_ID%2=0;
SELECT * FROM Worker WHERE MOD(WORKER_ID,2)=0;

-- 23. Write an SQL query to clone a new table from another table.

CREATE TABLE CLONE_TABLE SELECT * FROM Worker;

-- 24. Write an SQL query to fetch intersecting records of previous two tables.

SELECT * FROM Worker w INNER JOIN Title t WHERE t.WORKER_REF_ID=w.WORKER_ID;

-- 25. Write an SQL query to show records from one table that another table does not
-- have.

PENDING: SELECT * FROM Worker w RIGHT OUTER JOIN Title t WHERE t.WORKER_REF_ID=w.WORKER_ID;

-- 26. Write an SQL query to show the top n (say 10) records of a table.

SELECT * FROM Worker LIMIT 3;

-- 27. Write an SQL query to fetch the list of employees with the same salary.

SELECT * FROM Worker WHERE SALARY IN (SELECT SALARY FROM Worker GROUP BY SALARY HAVING COUNT(SALARY)>1);

-- 28. Write an SQL query to show the second-highest salary from a table.

SELECT SALARY FROM Worker GROUP BY SALARY ORDER BY SALARY DESC LIMIT 1,1;
-- SELECT * FROM Worker ORDER BY SALARY DESC LIMIT 1,1;

-- 29. Write an SQL query to fetch intersecting records of two tables.

SELECT * FROM Worker w INNER JOIN Title t WHERE t.WORKER_REF_ID=w.WORKER_ID;

-- 30. Write an SQL query to fetch the first 50% of records from a table.

SELECT * FROM Worker LIMIT (SELECT COUNT(*)/2 FROM Worker GROUP BY WORKER_ID);

-- 31. Write an SQL query to fetch the departments that have less than five people in
-- them.

SELECT * FROM Worker WHERE WORKER_ID <= (SELECT COUNT(WORKER_ID)/2 FROM Worker);

-- 32. Write an SQL query to show all departments along with the number of people in
-- there.

SELECT DEPARTMENT,COUNT(DEPARTMENT) AS 'DEPARTMENT COUNT' FROM Worker GROUP BY DEPARTMENT;

-- 33. Write an SQL query to show the last record from a table.

SELECT * FROM Worker ORDER BY WORKER_ID DESC LIMIT 1;

SELECT * FROM Worker LIMIT 7,1;

-- 34. Write an SQL query to fetch the first row of a table.

SELECT * FROM Worker ORDER BY WORKER_ID ASC LIMIT 1;

SELECT * FROM Worker LIMIT 1;

-- 35. Write an SQL query to fetch the last five records from a table.

SELECT * FROM Worker ORDER BY WORKER_ID DESC LIMIT 5;

-- 36. Write an SQL query to print the name of employees having the highest salary in
-- each department.

SELECT FIRST_NAME,LAST_NAME,DEPARTMENT,SALARY FROM Worker 
WHERE SALARY IN (SELECT MAX(SALARY) FROM Worker GROUP BY DEPARTMENT); 

-- 37. Write an SQL query to fetch three max salaries from a table.

SELECT SALARY FROM Worker GROUP BY SALARY ORDER BY SALARY DESC LIMIT 0,3;

-- 38. Write an SQL query to fetch departments along with the total salaries paid for
-- each of them.

SELECT DEPARTMENT, SUM(SALARY) FROM Worker GROUP BY DEPARTMENT; 

-- 39. Write an SQL query to fetch the names of workers who earn the highest salary.

SELECT FIRST_NAME,LAST_NAME FROM Worker ORDER BY SALARY DESC LIMIT 1;