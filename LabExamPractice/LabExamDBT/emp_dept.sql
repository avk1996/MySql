CREATE DATABASE LabExamDBT;

USE LabExamDBT;

CREATE TABLE dept(deptno INT(4), dname VARCHAR(40), loc VARCHAR(40));

INSERT INTO dept VALUES (10,'ACCOUNTING','NEW YORK');
INSERT INTO dept VALUES (20,'RESEARCH','DALLAS');
INSERT INTO dept VALUES (30,'SALES','CHICAGO');
INSERT INTO dept VALUES (40,'OPERATIONS','BOSTON');

CREATE TABLE emp(empno INT(4), ename VARCHAR(40), job VARCHAR(40), mgr INT(4), hiredate DATE, sal DECIMAL(8,2), comm DECIMAL(8,2), deptno INT(4));

INSERT INTO emp VALUES (7839,'KING','PRESIDENT',NULL,'1981-11-17',5000.00,NULL,10);
INSERT INTO emp VALUES (7698,'BLAKE','MANAGER',7839,'1981-05-01',2850.00,NULL,30);
INSERT INTO emp VALUES (7566,'JONES','MANAGER',7839,'1981-04-02',2975.00,NULL,20);
INSERT INTO emp VALUES (7788,'SCOTT','ANALYST',7566,'1982-12-09',3000.00,NULL,20);
INSERT INTO emp VALUES (7902,'FORD','ANALYST',7566,'1981-12-03',3000.00,NULL,20);
INSERT INTO emp VALUES (7369,'SMITH','CLERK',7902,'1980-12-17',800.00,NULL,20);
INSERT INTO emp VALUES (7499,'ALLEN','SALESMAN',7698,'1981-02-20',1600.00,300.00,30);
INSERT INTO emp VALUES (7521,'WARD','SALESMAN',7698,'1981-02-22',1250.00,500.00,30);
INSERT INTO emp VALUES (7654,'MARTIN','SALESMAN',7698,'1981-09-28',1250.00,1400.00,30);
INSERT INTO emp VALUES (7844,'TURNER','SALESMAN',7698,'1981-09-08',1500.00,0.00,30);
INSERT INTO emp VALUES (7782,'CLARK','MANAGER',7839,'1981-06-09',2450.00,NULL,10);
INSERT INTO emp VALUES (7876,'ADAMS','CLERK',7788,'1983-01-12',1100.00,NULL,20);
INSERT INTO emp VALUES (7900,'JAMES','CLERK',7698,'1981-12-03',950.00,NULL,30);
INSERT INTO emp VALUES (7934,'MILLER','CLERK',7782,'1982-01-23',1300.00,NULL,10);

SELECT * FROM emp;
SELECT * FROM dept;

--------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Q1: 
-- i. solution
SELECT e.empno,e.ename,d.loc,d.dname
FROM emp e INNER JOIN dept d
ON e.deptno = d.deptno
WHERE e.sal > (SELECT sal FROM emp WHERE ename='JONES') OR e.sal > (SELECT sal FROM emp WHERE ename='SCOTT');

--------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------

-- ii. solution
SELECT e.empno,e.ename,d.dname,e.sal,d.deptno
FROM emp e INNER JOIN dept d
ON e.deptno = d.deptno
WHERE e.job = 'CLERK' OR e.job = 'SALESMAN';
--------------------------------------------------------------------------------------------------------------------------------------------------------------

-- iii. solution
SELECT e.empno ,e.ename , e.job , e.mgr , e.hiredate , e.sal , e.comm , e.deptno,  d.dname , d.loc
FROM emp e INNER JOIN dept d
ON e.deptno = d.deptno
WHERE d.dname = 'ACCOUNTING';
--------------------------------------------------------------------------------------------------------------------------------------------------------------

-- iv. solution
SELECT CONCAT(UPPER(e.ename),' ',LENGTH(e.ename)) AS 'Emp name and no. of char',LOWER(d.dname) AS dname
FROM emp e INNER JOIN dept d
ON e.deptno = d.deptno;
--------------------------------------------------------------------------------------------------------------------------------------------------------------

-- v. solution
SELECT empno ,ename , 
CASE 
  WHEN job='MANAGER' THEN "BOSS"
  ELSE job 
END AS job,  
mgr , hiredate , sal , comm , deptno
FROM emp;
--------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Q2:

-- i solution
SELECT e.ename, d.dname , d.loc
FROM emp e INNER JOIN dept d
ON e.deptno = d.deptno
WHERE e.deptno IS NOT NULL; 
--------------------------------------------------------------------------------------------------------------------------------------------------------------

-- ii solution
SELECT e.job ,SUM(e.sal) AS "Total Salary in each job." 
FROM emp e INNER JOIN dept d
ON e.deptno = d.deptno
GROUP BY e.job;
--------------------------------------------------------------------------------------------------------------------------------------------------------------

-- iii. solution **
SELECT d.deptno, d.dname
FROM dept d INNER JOIN emp e
WHERE e.deptno = d.deptno
GROUP BY deptno
HAVING COUNT(*) > 3;

--------------------------------------------------------------------------------------------------------------------------------------------------------------

-- iv. solution **
SELECT * FROM emp WHERE empno IN (SELECT mgr FROM emp WHERE mgr IS NOT NULL);

-- Q3: 
DROP FUNCTION IF EXISTS FindEmpByEmpNum;

DELIMITER &&

CREATE FUNCTION FindEmpByEmpNum(v_empno INT)

RETURNS VARCHAR(50)
DETERMINISTIC

BEGIN
  DECLARE v_ename VARCHAR(50);
  SELECT ename into v_ename
  FROM emp 
  WHERE empno=v_empno;
  RETURN v_ename;
END;

&&

DELIMITER ;

-- Q4:

DROP TABLE IF EXISTS emp_sal_log;

CREATE TABLE emp_sal_log (old_sal DECIMAL(8,2),new_sal DECIMAL(8,2),sal_diff DECIMAL(8,2));

-----------------------------TRIGGER: UPDATE---------------------------------------
DROP TRIGGER IF EXISTS UpdateEmployee;

DELIMITER &&

CREATE TRIGGER UpdateEmployee

BEFORE UPDATE ON emp

FOR EACH ROW

BEGIN
  INSERT INTO emp_sal_log  VALUES(OLD.sal,NEW.sal,ABS(OLD.sal - NEW.sal));    
END;

&&

DELIMITER ;
-----------------------------TRIGGER: DELETE---------------------------------------

DROP TRIGGER IF EXISTS DeleteEmployee;

DELIMITER &&

CREATE TRIGGER DeleteEmployee

AFTER DELETE ON emp

FOR EACH ROW

BEGIN
  INSERT INTO emp_sal_log  VALUES(NEW.sal,NEW.sal,ABS(NEW.sal - NEW.sal));    
END;

&&

DELIMITER ;

-----------------------------TRIGGER: INSERT---------------------------------------

DROP TRIGGER IF EXISTS InsertEmployee;

DELIMITER &&

CREATE TRIGGER InsertEmployee

BEFORE INSERT ON emp

FOR EACH ROW

BEGIN
  INSERT INTO emp_sal_log VALUES(NEW.sal,NEW.sal,ABS(NEW.sal - NEW.sal));    
END;

&&

DELIMITER ;

------------------------------------------------------------------------------------

--TEST QUERIES: 

UPDATE emp SET sal=5000 WHERE empno=7839;
INSERT INTO emp VALUES (8000,'DALE','MANAGER',7839,'1982-06-06',2950.10,NULL,20);
DELETE FROM emp WHERE empno=8000;
SELECT * FROM emp_sal_log;

-- Q5:
use sample_db;

db.my_col.insertOne({title: "MongoDB Overview",description: "MongoDB is no SQL database",by: "tutorials point", url: "http://www.tutorialspoint.com",tags: ["mongodb", "database", "NoSQL"],likes: 100}) 
db.my_col.insertOne(
 {
    _id: ObjectId('659268e29cc01d8cd8717281'),
    title: 'NoSQL Database',
    description: "NoSQL database doesn't have tables",
    by: 'tutotials point',
    url: 'http://tutorialspoint.com',
    tags: [ 'mongodbm', 'database', 'NoSQL' ],
    likes: 20,
    comments: [
      {
        user: 'user1',
        message: 'My first comment',
        dateCreated: ISODate('2013-12-09T21:05:00.000Z'),
        likes: 0
      }
    ]
  }
);

-- 1. solution
db.my_col.updateOne({"comments.user":"user1"},{$set: {url: "www.google.com"}});

-- 2. solution
db.my_col.find({likes:{$gt:20}});
--------------------------------------------------------------------------------------------------------------------------------------------------------------