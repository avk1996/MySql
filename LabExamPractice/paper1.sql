----------------------------------------------------------------------------
-- Q1. Solve the below questions.(2 marks each)

-- 1. Write an sql query to fetch emp name, salary, joining date and department no and department name from tables who join after year of 1982.

SELECT ename,sal,hire,deptno FROM emp WHERE YEAR(hire) > 1982;

-- 2. Write an sql query to fetch id, emp name, departmentname, salary and department whose department is clerk or analyst 

SELECT e.empno, e.ename, d.dname, e.sal
FROM emp e INNER JOIN dept d
ON e.deptno = d.deptno 
WHERE e.job IN ('CLERK','ANALYST'); 

-- 3. Write an sql query to fetch id,empname, salary whose name contains third letter as i. 

SELECT empno, ename, sal FROM emp WHERE SUBSTRING(ename,1,3) = 'i';

SELECT empno, ename, sal FROM emp WHERE ename LIKE '__i%';

-- 4. Write an sql query to fetch all the record from emp table whose is join after the year of 1981

SELECT * FROM emp WHERE YEAR(hire) > 1981;

-- 5. Write an sql query to feach all records of worker table who have salary is greater than 1300 and less than 5000.

SELECT * FROM emp WHERE sal BETWEEN 1300 AND 5000;

SELECT * FROM emp WHERE sal > 1300 AND sal < 5000; 

-----------------------------------------------------------------------------

-- Q2. Solve the below questions. (3 marks each)

-- 1. Write a query to get the emp name along with manager name whose name contains third letter as 'a'

SELECT ename,job FROM emp WHERE job='MANAGER' OR ename='___a%';

-- 2 . Write a query to department name, department id, emp name from tables and order by the data based on department id
-- emp name

SELECT d.dname,d.deptno,e.ename
FROM emp e INNER JOIN dept d
ON e.deptno = d.deptno
ORDER BY e.deptno,ename; 

-- 3. Write a query to deparment name and number of employee in each department
**
SELECT d.dname,COUNT(e.ename)
FROM emp e INNER JOIN dept d 
ON e.deptno = e.deptno
GROUP BY e.ename; 

-- 4. Write a query to get the emp name and annual salary, the name of the employee earning highest annual salary should apper first

SELECT ename,sal FROM emp ORDER BY sal DESC;

-- Q3. Create a pl-sql function which will accept the department number as input and it will return total salary for that department



-- 04. Create insert,update, delete trigger on emp table, trigger will get fire when update operation is perform on salary column which will show salary diffences old and new values.
