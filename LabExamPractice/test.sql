DROP PROCEDURE IF EXISTS get_worker_names;
DELIMITER &&
CREATE PROCEDURE get_worker_names()
BEGIN
  DECLARE worker_name VARCHAR(255);
  DECLARE finished INT DEFAULT 0;
  DECLARE worker_cursor CURSOR FOR SELECT FIRST_NAME FROM worker;  -- Replace "workers" with your actual table name
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished = 1;

  OPEN worker_cursor;

  SET @worker_name_list = '';

  worker_loop: LOOP
    FETCH worker_cursor INTO worker_name;
    IF finished = 1 THEN
      LEAVE worker_loop;
    END IF;

    SET @worker_name_list = CONCAT(@worker_name_list, worker_name, ', ');
  END LOOP worker_loop;

  CLOSE worker_cursor;

  SELECT TRIM(TRAILING ', ' FROM @worker_name_list);  -- Remove trailing comma and space
  INSERT INTO result VALUES(worker_name_list);
END;
&&
DELIMITER ;
