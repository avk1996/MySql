-- Q3. Create a pl-sql function which will accept the department number as input and it will return total salary for that department

DROP FUNCTION IF EXISTS SalSum;

DELIMITER &&

CREATE FUNCTION SalSum(id INT)

RETURNS INT
DETERMINISTIC

BEGIN
    DECLARE v_total_sal INT;
    SELECT SUM(e.sal) INTO v_total_sal 
    FROM emp e INNER JOIN dept d
    ON e.deptno = d.deptno
    WHERE d.dname = (SELECT dname FROM dept WHERE deptno = id);
    return v_total_sal;
END;

&&

DELIMITER ; 