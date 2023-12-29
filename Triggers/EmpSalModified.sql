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