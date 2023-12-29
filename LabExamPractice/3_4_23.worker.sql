 DROP FUNCTION IF EXISTS 3_4_23.worker;
 DELIMITER &&
 CREATE FUNCTION 3_4_23.worker(Id INT)
 RETURNS INT 
 DETERMINISTIC
 BEGIN
  DECLARE ret_salary INT
  SELECT SUM(SALARY) INTO ret_salary FROM worker GROUP BY DEPARTMENT WHERE WORKER_ID=Id;
  return ret_salary;
 END;
 &&
 DELIMITER ;