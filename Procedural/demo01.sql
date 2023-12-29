    DELIMITER &&
    --if the procedure exists with the same name then we will get error so we use the following to avoid 
    DROP PROCEDURE IF EXISTS sp_hello;
    
    CREATE PROCEDURE sp_hello()
    BEGIN
        SELECT "HELLO WORLD" AS VALUE FROM DUAL;
    END;

    &&

    DELIMITER ;