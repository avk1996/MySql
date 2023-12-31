DROP PROCEDURE IF EXISTS WorkerList;

DELIMITER $$

CREATE PROCEDURE WorkerList()

BEGIN

DECLARE v_flag INT DEFAULT 0;
DECLARE v_name_worker VARCHAR(255) DEFAULT "";
DECLARE worker_list VARCHAR(255);
DECLARE temp VARCHAR(255);
DECLARE v_cur CURSOR FOR SELECT FIRST_NAME FROM worker;

DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_flag=1;

  OPEN v_cur;

  SET @worker_list = "";  
    
    label:LOOP
  
    FETCH v_cur into v_name_worker;
    
      IF v_flag=1 THEN
        LEAVE label;
      END IF;

    SET @worker_list = CONCAT(@worker_list,v_name_worker,', ');    
    END LOOP;
  
  CLOSE v_cur;
  SET temp = TRIM(TRAILING ', ' FROM @worker_list);
  SELECT temp;
  INSERT INTO result VALUES(temp);
END;

$$

DELIMITER ;