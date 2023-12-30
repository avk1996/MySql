DROP PROCEDURE IF EXISTS StartWithM;

DELIMITER &&

CREATE PROCEDURE StartWithM()

BEGIN
    SELECT TABLE_NAME FROM TABLES WHERE TABLE_NAME LIKE 'M%';
END;

&&

DELIMITER ;

-- ERROR: privileges to root@localhost is denied for information_schema