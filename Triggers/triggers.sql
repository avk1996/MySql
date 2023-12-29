-- Executed automaticall on some events
-- Events like INSERT, UPDATE AND DELETE
-- Triggers are executed in DML opeartions
-- Before and After DMLs
-- No parameters and no return value
-- Triggers are supported by standard RDBMS

-- Triggers can contain SQL statements and programming constructs
-- Triggers may call SF or SP

-- COMMIT/ROLLBACK are NOT ALLOWED in Triggers

-- example: if the salary of employee is modifed save old and new it in the emp histroy
-- CREATE TABLE sal_history(empno INT,sal DECIMAL(7,2), changetime DATETIME)

DROP TRIGGER IF EXISTS EmpSalModifed;
DELIMITER $$

CREATE TRIGGER EmpSalModifed
BEFORE UPDATE ON emp
FOR EACH ROW 
BEGIN 
    DECLARE v_empno INT;
    DECLARE v_oldsal INT;
    DECLARE v_newsal INT;
    SET v_empno = OLD.empno;
    SET v_oldsal = OLD.sal;
    SET v_newsal = NEW.sal;
    INSERT INTO sal_history VALUES(v_empno,v_oldsal,v_newsal,NOW());
END;
$$

DELIMITER ;
 -- OLD & NEW is keyword
CREATE TABLE sal_history(empno INT,oldsal DECIMAL(7,2),newsal DECIMAL(7,2), changetime DATETIME);

UPDATE emp SET sal = 1000 WHERE ename='KING';