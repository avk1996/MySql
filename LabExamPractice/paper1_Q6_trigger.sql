-- 04. Create insert,update, delete trigger on emp table, trigger will get fire when update operation is perform on salary column which will show salary diffences old and new values.

DROP TABLE IF EXISTS SalLog;

CREATE TABLE SalLog (new_sal DECIMAL(8,2),old_sal DECIMAL(8,2), sal_diff DECIMAL(8,2));

DROP TRIGGER IF EXISTS sal_logs;

DELIMITER &&

CREATE TRIGGER sal_logs 

BEFORE INSERT ON emp

FOR EACH ROW
BEGIN
    INSERT INTO SalLog VALUES(NEW.sal,NEW.sal,ABS(NEW.sal-NEW.sal));
END;

&&

DELIMITER ;