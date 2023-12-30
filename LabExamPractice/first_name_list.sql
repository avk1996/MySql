DROP PROCEDURE IF EXISTS Worker_List;

DELIMITER &&

CREATE PROCEDURE Worker_List()

BEGIN
  -- first set up error handler flag
  DECLARE v_flag INT DEFAULT 0;
  DECLARE v_name_str VARCHAR(100);
  DECLARE v_cur CURSOR FOR SELECT FIRST_NAME FROM worker;

  DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_flag = 1;

  OPEN v_cur;
  v_name_str = "";
  read_names : LOOP

    v_name_str = CONCAT(FIRST_NAME,",")
    IF v_flag = 1 THEN 
      FETCH v_cur INTO v_name_str;
      LEAVE read_names;
    END IF
  END LOOP;
  INSERT INTO result VALUES(v_name_str);
  END v_cur;
END;

&&

DELIMITER ;
 