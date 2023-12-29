-- we cannot have in and out paramters in stored function (sf) ONLY IN paramters

-- deterministic vs non-deterministic in sf

-- prob1: calculate square of parameter then return this result

-- drop the function it it exists
DROP FUNCTION IF EXISTS sf_sqr;

-- always start with delimiter
DELIMTER &&
-- deterministic or non-deterministic
RETURNS INT
DETERMINISTIC

-- function start 
CREATE FUNCTION sf_sqr(num INT)
-- body
BEGIN 
    DECLARE sq INT;
    SET sq = num * num;
    RETURN sq;
END;

&&

DELIMTER ;

-- to call this function we use: SELECT FUNCTION_NAME(value) FROM DUAL
-- only for procedure use CALL, NOT FOR FUNCTIONs

-- To run function one must set -> SET GLOBAL log_bin_trust_function_creators = 1;