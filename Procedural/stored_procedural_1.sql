-- Persistance Stored Module is written by programmers
-- Only CREATE PROCEDURE & DROP PROCEDURE
-- Actual execution happens (at server level) using CALL statement
-- block is BEGIN --CODE-- END;

-- DELIMITER && -> && is the way to tell mysql to end when this '&&' comes
-- we can use any thing instead of && or $$ or ..
-- BUT REMEMBER THAT AFTER EVERY SETTING DELIMITER AS ANY OTHER CHARACTER THAN ; (SEMICOLEN) WE MUST SET
-- EXAMPLE: 
-- Delimiter is the end of query we have
-- to recall the stored procedure we use CALL keyword e.g. CALL stored_procedure_name()

-- Stored Procedure: CLI

DELIMITER &&

CREATE PROCEDURE sp_hello()
BEGIN
    SELECT "HELLO WORLD" AS VALUE FROM DUAL;
END;

&&

DELIMITER ;

-- stored Procedure: A better way: using .sql file

-- step1: create sp_fileName.sql 
-- step2: write sp in it

    DELIMITER &&
    --if the procedure exists with the same name then we will get error so we use the following to avoid 
    DROP PROCEDURE IF EXISTS sp_hello;

    CREATE PROCEDURE sp_hello()
    BEGIN
        SELECT "HELLO WORLD" AS VALUE FROM DUAL;
    END;

    &&

    DELIMITER ;

-- step3: run .sql file using src command

-- step4: execute the sp on prompt: CALL sp_hello();