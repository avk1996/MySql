-- 5. WRITE A STORE FUNCTION TO FIND THE TYPE OF CARD TO BE ALLOCATED TO THE EMPLOYEE 
-- BASED ON THE SALARY :-  
-- • Salary between 1000 - 10000  (Silver Card With 50000 Limit) 
-- • Salary between 10000 - 20000 (Gold Card With 150000 Limit) 
-- • Salary greater then 20000 (Platinum Card with 300000 Limit) 
DROP FUNCTION IF EXISTS CardType;

DELIMITER &&

CREATE FUNCTION CardType(sal DECIMAL(8,2))

RETURNS VARCHAR(100)
DETERMINISTIC

BEGIN
    DECLARE v_card_type VARCHAR(100);
    IF sal > 1000 AND sal <= 10000 THEN
        SET v_card_type = 'Silver Card With 50000 Limit';
    ELSEIF sal > 10000 AND sal <= 20000 THEN 
        SET v_card_type = 'Gold Card With 150000 Limit';
    ELSEIF sal > 20000 THEN
        SET v_card_type = 'Platinum Card With 300000 Limit';
    END IF;
    RETURN v_card_type;
END;

&&

DELIMITER ;
