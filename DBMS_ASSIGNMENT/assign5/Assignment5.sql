-- Assignment 5:
-- Q.1 Write a mysql statement to find the name, birth, department name, department block from the given tables.

mysql> CREATE TABLE student
    -> (id INT,name VARCHAR(20),dept_id int, birth date);
Query OK, 0 rows affected (2.87 sec)

mysql> INSERT INTO student VALUES
    -> ( 1 , 'Maria Gloria' , 2 , '1994-03-12' ),
    -> ( 2 , 'John Smith' , 1 , '1993-02-07' ),
    -> ( 3 , 'Gal Rao' , 4 , '1992-09-11' ),
    -> ( 4 , 'Jakey Smith' , 2 , '1990-08-31' ),
    -> ( 5 , 'Rama Saho' , 1 , '1994-12-09' ),
    -> ( 6 , 'Maria Gaga' , 4 ,'1993-10-09');
Query OK, 6 rows affected (0.69 sec)
Records: 6  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE student ADD CONSTRAINT pkey primary key(id);
Query OK, 0 rows affected (5.05 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> CREATE TABLE student_dept 
    -> (dept_id INT,dept_name VARCHAR(30),dept_block VARCHAR(20));
Query OK, 0 rows affected (1.70 sec)

mysql> ALTER TABLE student_dept ADD CONSTRAINT pkey_dept primary key(dept_id);
Query OK, 0 rows affected (4.07 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> INSERT INTO student_dept VALUES
    -> (1 , 'Computer Science' ,'B-Block' ),
    -> ( 2 , 'Information Technology' , 'C-Block' ),
    -> ( 3 , 'Mechanical' , 'A-Block' ),
    -> ( 4 , 'Electronic Communication' , 'D-Block');
Query OK, 4 rows affected (0.41 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE student ADD CONSTRAINT fkey foreign key(dept_id) references student_dept(dept_id);
Query OK, 6 rows affected (5.90 sec)
Records: 6  Duplicates: 0  Warnings: 0

mysql> SELECT student.name as 'Name',student.birth as 'DOB', student_dept.dept_name as 'Deptartment Name', student_dept.dept_block as 'Department Block' FROM 
    -> student INNER JOIN student_dept on student.dept_id=student_dept.dept_id;
+--------------+------------+--------------------------+------------------+
| Name         | DOB        | Deptartment Name         | Department Block |
+--------------+------------+--------------------------+------------------+
| John Smith   | 1993-02-07 | Computer Science         | B-Block          |
| Rama Saho    | 1994-12-09 | Computer Science         | B-Block          |
| Maria Gloria | 1994-03-12 | Information Technology   | C-Block          |
| Jakey Smith  | 1990-08-31 | Information Technology   | C-Block          |
| Gal Rao      | 1992-09-11 | Electronic Communication | D-Block          |
| Maria Gaga   | 1993-10-09 | Electronic Communication | D-Block          |
+--------------+------------+--------------------------+------------------+
6 rows in set (0.06 sec)

-- Q.2 Write a mysql statement to get name of students containing exactly five characters with ‘a’ as last letter.

mysql> CREATE TABLE student1 
    -> (id INT,name VARCHAR(15),dept_id INT,birth DATE);
Query OK, 0 rows affected (2.10 sec)

mysql> INSERT INTO student1 VALUES
    -> (1 , 'Maria' , 2 , '1994-03-12' ),
    -> ( 2 , 'John' , 1 , '1993-02-07' ),
    -> ( 3 , 'Gal', 4 , '1992-09-11' ),
    -> ( 4 , 'Jakey' , 2 , '1990-08-31' ),
    -> ( 5 , 'Rama', 1 , '1994-12-09' ),
    -> ( 6 , 'Maria' , 4 , '1993-10-09' );
Query OK, 6 rows affected (0.76 sec)
Records: 6  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM student1;
+------+-------+---------+------------+
| id   | name  | dept_id | birth      |
+------+-------+---------+------------+
|    1 | Maria |       2 | 1994-03-12 |
|    2 | John  |       1 | 1993-02-07 |
|    3 | Gal   |       4 | 1992-09-11 |
|    4 | Jakey |       2 | 1990-08-31 |
|    5 | Rama  |       1 | 1994-12-09 |
|    6 | Maria |       4 | 1993-10-09 |
+------+-------+---------+------------+
6 rows in set (0.00 sec)

mysql> SELECT * FROM student1 WHERE name LIKE '_____' AND name LIKE '%a';
+------+-------+---------+------------+
| id   | name  | dept_id | birth      |
+------+-------+---------+------------+
|    1 | Maria |       2 | 1994-03-12 |
|    6 | Maria |       4 | 1993-10-09 |
+------+-------+---------+------------+
2 rows in set (0.00 sec)

-- Q.3 Write a mysql statement to determine the age of each of the students.

mysql> CREATE TABLE student2
    -> (id INT,name VARCHAR(20),department VARCHAR(20),birth DATE);
Query OK, 0 rows affected (2.24 sec)

mysql> 
mysql> INSERT INTO student2 VALUES
    -> (1 , 'Maria Gloria' , 'CS' , '1994-03-12' ),
    -> ( 2 , 'John Smith' , 'IT' , '1993-02-07' ),
    -> ( 3 , 'Gal Rao' , 'CS' , '1992-09-11' ),
    -> ( 4 , 'Jakey Smith' , 'EC' , '1990-08-31' ),
    -> ( 5 , 'Rama Saho' , 'IT' , '1994-12-09' ),
    -> ( 6 , 'Maria Gaga' , 'EC' , '1993-10-09');
Query OK, 6 rows affected (0.48 sec)
Records: 6  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM student2;
+------+--------------+------------+------------+
| id   | name         | department | birth      |
+------+--------------+------------+------------+
|    1 | Maria Gloria | CS         | 1994-03-12 |
|    2 | John Smith   | IT         | 1993-02-07 |
|    3 | Gal Rao      | CS         | 1992-09-11 |
|    4 | Jakey Smith  | EC         | 1990-08-31 |
|    5 | Rama Saho    | IT         | 1994-12-09 |
|    6 | Maria Gaga   | EC         | 1993-10-09 |
+------+--------------+------------+------------+
6 rows in set (0.00 sec)

mysql> SELECT id,name,department,DATE_FORMAT(FROM_DAYS(DATEDIFF(NOW(),birth)),'%Y')+0 AS Age FROM student2;
+------+--------------+------------+------+
| id   | name         | department | Age  |
+------+--------------+------------+------+
|    1 | Maria Gloria | CS         |   29 |
|    2 | John Smith   | IT         |   30 |
|    3 | Gal Rao      | CS         |   31 |
|    4 | Jakey Smith  | EC         |   33 |
|    5 | Rama Saho    | IT         |   28 |
|    6 | Maria Gaga   | EC         |   29 |
+------+--------------+------------+------+
6 rows in set (0.00 sec)

-- Q.4 These questions are based on the following two tables, Employee table and Reward table.

mysql> CREATE TABLE Employee
    -> (Employee_id INT,First_name VARCHAR(20),Last_name VARCHAR(20),Salary INT,Joining_date DATE,Department VARCHAR(20));
Query OK, 0 rows affected (2.11 sec)

mysql> INSERT INTO Employee VALUES
    -> (1 , 'Bob' , 'Kinto' , 1000000 , '2019-01-20' , 'Finance') ,
    -> ( 2 , 'Jerry' , 'Kansxo' , 6000000 , '2019-01-15' , 'IT' ),
    -> ( 3 , 'Philip' , 'Jose' , 8900000 , '2019-02-05' , 'Banking') ,
    -> ( 4 , 'John' , 'Abraham' , 2000000 , '2019-02-25' , 'Insurance') ,
    -> ( 5 , 'Michael' , 'Mathew' , 2200000 , '2019-02-28' , 'Finance') ,
    -> ( 6 , 'Alex' , 'chreketo' , 4000000 , '2019-05-10' , 'IT' ),
    -> ( 7 , 'Yohan' , 'Soso' , 1230000 , '2019-06-20' , 'Banking');
Query OK, 7 rows affected (0.38 sec)
Records: 7  Duplicates: 0  Warnings: 0

mysql> CREATE TABLE Reward
    -> (Employee_ref_id INT,date_reward DATE,amount INT);
Query OK, 0 rows affected (1.36 sec)
 
mysql> INSERT INTO Reward VALUES
    -> (1 , '2019-05-11' , 1000 ),
    -> ( 2 , '2019-02-15' , 5000 ),
    -> ( 3 , '2019-04-22' , 2000 ),
    -> ( 1 , '2019-06-20' , 8000);
Query OK, 4 rows affected (0.24 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM Reward;
+-----------------+-------------+--------+
| Employee_ref_id | date_reward | amount |
+-----------------+-------------+--------+
|               1 | 2019-05-11  |   1000 |
|               2 | 2019-02-15  |   5000 |
|               3 | 2019-04-22  |   2000 |
|               1 | 2019-06-20  |   8000 |
+-----------------+-------------+--------+
4 rows in set (0.01 sec)

-- 4.1. Get all employees.

mysql> SELECT * FROM Employee;
+-------------+------------+-----------+---------+--------------+------------+
| Employee_id | First_name | Last_name | Salary  | Joining_date | Department |
+-------------+------------+-----------+---------+--------------+------------+
|           1 | Bob        | Kinto     | 1000000 | 2019-01-20   | Finance    |
|           2 | Jerry      | Kansxo    | 6000000 | 2019-01-15   | IT         |
|           3 | Philip     | Jose      | 8900000 | 2019-02-05   | Banking    |
|           4 | John       | Abraham   | 2000000 | 2019-02-25   | Insurance  |
|           5 | Michael    | Mathew    | 2200000 | 2019-02-28   | Finance    |
|           6 | Alex       | chreketo  | 4000000 | 2019-05-10   | IT         |
|           7 | Yohan      | Soso      | 1230000 | 2019-06-20   | Banking    |
+-------------+------------+-----------+---------+--------------+------------+
7 rows in set (0.00 sec)

-- 4.2. Display the first name and last name of all employees.

mysql> SELECT First_name,Last_name FROM Employee;
+------------+-----------+
| First_name | Last_name |
+------------+-----------+
| Bob        | Kinto     |
| Jerry      | Kansxo    |
| Philip     | Jose      |
| John       | Abraham   |
| Michael    | Mathew    |
| Alex       | chreketo  |
| Yohan      | Soso      |
+------------+-----------+
7 rows in set (0.00 sec)

-- 4.3. Display all the values of the “First_Name” column using the alias “Employee Name”

mysql> SELECT First_name AS 'Employee Name' FROM Employee;
+---------------+
| Employee Name |
+---------------+
| Bob           |
| Jerry         |
| Philip        |
| John          |
| Michael       |
| Alex          |
| Yohan         |
+---------------+
7 rows in set (0.00 sec)

-- 4.4. Get all “Last_Name” in lowercase.

mysql> SELECT LOWER(Last_name) AS 'last_name' FROM Employee;
+-----------+
| last_name |
+-----------+
| kinto     |
| kansxo    |
| jose      |
| abraham   |
| mathew    |
| chreketo  |
| soso      |
+-----------+
7 rows in set (0.00 sec)


-- 4.5. Get all “Last_Name” in uppercase.

mysql> SELECT UPPER(Last_name) AS 'LAST_NAME' FROM Employee;
+-----------+
| LAST_NAME |
+-----------+
| KINTO     |
| KANSXO    |
| JOSE      |
| ABRAHAM   |
| MATHEW    |
| CHREKETO  |
| SOSO      |
+-----------+
7 rows in set (0.00 sec)

-- 4.6. Get unique “DEPARTMENT”.

mysql> SELECT DISTINCT Department FROM Employee;
+------------+
| Department |
+------------+
| Finance    |
| IT         |
| Banking    |
| Insurance  |
+------------+
4 rows in set (0.00 sec)

-- 4.7. Get the first 4 characters of “FIRST_NAME” column.

mysql> SELECT SUBSTRING(First_name,1,4) AS '4 Letter First_name' FROM Employee;
+---------------------+
| 4 Letter First_name |
+---------------------+
| Bob                 |
| Jerr                |
| Phil                |
| John                |
| Mich                |
| Alex                |
| Yoha                |
+---------------------+
7 rows in set (0.01 sec)

-- 4.8. Get the position of the letter ‘h’ in ‘John’.

mysql> SELECT Employee_id,First_name,POSITION('h' in First_name) AS 'h position' FROM Employee WHERE Employee_id=4;
+-------------+------------+------------+
| Employee_id | First_name | h position |
+-------------+------------+------------+
|           4 | John       |          3 |
+-------------+------------+------------+
1 row in set (0.00 sec)

-- 4.9. Get all values from the “FIRST_NAME” column after removing white space on the right.

mysql> SELECT RTRIM(First_name) FROM Employee;
+-------------------+
| RTRIM(First_name) |
+-------------------+
| Bob               |
| Jerry             |
| Philip            |
| John              |
| Michael           |
| Alex              |
| Yohan             |
+-------------------+
7 rows in set (0.00 sec)

-- 4.10. Get all values from the “FIRST_NAME” column after removing white space on the left.

mysql> SELECT LTRIM(First_name) FROM Employee;
+-------------------+
| LTRIM(First_name) |
+-------------------+
| Bob               |
| Jerry             |
| Philip            |
| John              |
| Michael           |
| Alex              |
| Yohan             |
+-------------------+
7 rows in set (0.00 sec)

-- 4.11. Write the syntax to create the “employee” table.

CREATE TABLE employee (col_name1 col_datatype,col_name2 col_datatype...,nth col_name nth col_datatype);