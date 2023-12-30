-- write a SP to process records of dept table one by one using cursor
-- each record should be added into result table -> deptno,name+loc

DROP PROCEDURE IF EXISTS sp_process_dept;

DELIMITER &&

CREATE PROCEDURE sp_process_dept()
BEGIN
    DECLARE v_flag INT DEFAULT 0;
    DECLARE v_deptno INT;
    DECLARE v_dname CHAR(30);
    DECLARE v_loc CHAR (30);
    DECLARE v_cur CURSOR FOR SELECT deptno, dname, loc FROM dept;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_flag = 1;
    
    OPEN v_cur;
    read_obo : LOOP
        
        FETCH v_cur INTO v_deptno, v_dname, v_loc;
        
        IF v_flag = 1 THEN 
            LEAVE read_obo;
        END IF;

        INSERT INTO result VALUES(v_deptno,CONCAT(v_dname," - ",v_loc));
    
    END LOOP;
    CLOSE v_cur;
END;
&&

DELIMITER ;

-- go to cursor.sql