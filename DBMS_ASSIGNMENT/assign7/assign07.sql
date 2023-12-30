-- 1. Select the detail of the employee whose name start with P.
SELECT * FROM Employee WHERE EmpName LIKE "p%";

-- 2. How many permanent candidate take salary more than 5000.
SELECT DISTINCT EmpName FROM Employee e
INNER JOIN 
EmpSalary es
ON e.Empid = es.EmpId AND es.IsPermanent="Yes";

-- 3. Select the detail of employee whose emailId is in gmail.
SELECT * FROM Employee WHERE EmailId LIKE "%gmail%";

-- 4. Select the details of the employee who work either for department E-104 or E-102.
SELECT * FROM Employee WHERE Department IN ("E-104","E-102");

-- 5. What is the department name for DeptID E-102?
SELECT ed.DeptName FROM Employee e 
INNER JOIN
EmplDept ed 
ON e.Empid = ed.DeptHead AND ed.DeptID="E-102";

-- 6. What is total salary that is paid to permanent employees?

SELECT DISTINCT SUM(es.Salary) FROM Employee e
INNER JOIN 
EmpSalary es
ON es.IsPermanent="Yes";

-- 7. List name of all employees whose name ends with a.
SELECT * FROM Employee WHERE EmpName LIKE '%a';
SELECT * FROM Employee WHERE SUBSTRING(EmpName,-1,1) LIKE 'a';

-- 8. List the number of department of employees in each project.
SELECT ProjectId,COUNT(ProjectId) 'No. of employees' FROM EmpProject GROUP BY ProjectId;

-- 9. How many project started in year 2010.
SELECT COUNT(*) FROM EmpProject WHERE StartYear=2010;

-- 10. How many project started and finished in the same year.
SELECT COUNT(*) 'Project started and finished in same year' FROM EmpProject WHERE StartYear = EndYear;

-- 11. Select the name of the employee whose name's 3rd charactor is 'h'.
SELECT * FROM Employee WHERE SUBSTRING(EmpName,1,3)  LIKE 'h';
SELECT * FROM Employee WHERE EmpName LIKE "__h%";

-- 12. Select the department name of the company which is assigned to the employee whose
-- employee id is grater 103.
SELECT ed.DeptName FROM 
Employee e
INNER JOIN 
EmplDept ed 
ON e.Empid=ed.DeptHead AND ed.DeptHead>103;

-- 13. Select the name of the employee who is working under Abhishek.
SELECT * FROM Employee WHERE EmpHeadId IN (SELECT Empid FROM Employee WHERE EmpName = "Abhishek");

-- 14. Select the name of the employee who is department head of HR.
SELECT e.EmpName,ed.DeptName FROM 
Employee e
INNER JOIN
EmplDept ed
ON e.Empid=ed.DeptHead AND ed.DeptName="Hr";

SELECT e.EmpName,ed.DeptName FROM 
Employee e
INNER JOIN
EmplDept ed
ON e.Empid=ed.DeptHead AND ed.DeptID=e.Department;

-- 15. Select the name of the employee head who is permanent.
SELECT DISTINCT e.EmpName,es.IsPermanent FROM 
Employee e
INNER JOIN
EmpSalary es
ON e.Empid=es.Empid AND es.IsPermanent="Yes"; 

-- 16. Select the name and email of the Dept Head who is not Permanent.
SELECT DISTINCT e.EmpName,e.EmailId FROM
Employee e 
INNER JOIN 
EmpSalary es 
ON e.Empid = es.Empid  AND es.IsPermanent="No";

-- 17. Select the employee whose department off is monday
SELECT e.EmpName FROM 
Employee e
INNER JOIN
EmplDept ed
ON e.Empid=ed.DeptHead AND Dept_off = "monday";

-- 18. Select the indian clients details.
SELECT client.ClientID,client.ClientName FROM 
Country c 
INNER JOIN 
ClientTable client
ON c.cid = client.cid AND c.cname = "India";

-- 19. Select the details of all employee working in development department.
SELECT * FROM 
Employee e
INNER JOIN
EmplDept ed
ON e.Empid = ed.DeptHead AND ed.DeptName = "Development";

-- 20. Create a procedure to calculate the average salaries of employees.
SELECT AVG(es.Salary) FROM 
Employee e
INNER JOIN 
EmpSalary es
ON e.Empid=es.Empid;

-- 21. Join first two tables using inner join.
SELECT * FROM 
Employee e
INNER JOIN
EmplDept ed
ON e.Empid=ed.DeptHead;

-- 22. Create a copy of employee table, add three extra entries in it and find the union, difference
-- and intersect.

-- 23. Create a procedure to pass employee id as input and generate his id, salary, contact number
-- and department name as output.

-- 24. Create a view for the data retrieved client name, project id, start and end year.

-- 25. Calculate average salary of permanent employees.

-- 26. Create a function to print department off when department name is given as input.

-- 27. Write a function to deduct the 10% TDS from employees salary. The selct statement should
-- generate empid, salary after TDS, and department name on screen.

-- 28. Write a cursor to extract id, name, contact and email from first table and store it in another
-- tenporary table.

-- 29. Create a trigger on first table to check that user inserted dept head id between 101 and 105
-- or not. If he doesnt enter the same, make dept head id as 100.

-- 30. Create a trigger to create the log for updation done on first two tables. The log table will
-- contain the changes made by user on both of these tables.