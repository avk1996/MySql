-- drop the function it it exists
DROP FUNCTION IF EXISTS sf_sqr;

-- always start with delimiter
DELIMITER &&

-- function start 
CREATE FUNCTION sf_sqr(num INT)
-- body
RETURNS INT
DETERMINISTIC

BEGIN 
    DECLARE sq INT;
    SET sq = num * num; 
    RETURN sq;
END;

&&

DELIMITER ;