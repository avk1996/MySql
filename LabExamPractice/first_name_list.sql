DROP PROCEDURE IF EXISTS WorkerList;

DELIMITER $$

CREATE PROCEDURE WorkerList()

BEGIN

DECLARE v_flag INT DEFAULT 0;
DECLARE v_name_worker VARCHAR(255) DEFAULT "";
DECLARE v_cur CURSOR FOR SELECT FIRST_NAME FROM worker;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_flag=1;

  OPEN v_cur;
  
    label:LOOP
  
    FETCH v_cur into v_name_worker;
    
      IF v_flag=1 THEN
        LEAVE label;
      END IF;
  
    SET v_name_worker=CONCAT(v_name_worker,",");
  
    END LOOP;
  
  CLOSE v_cur;
  SET v_name_worker = TRIM(TRAILING ', ' FROM v_name_worker);
  INSERT INTO result VALUES(v_name_worker);
END;

$$

DELIMITER ;