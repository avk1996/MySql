 DROP FUNCTION IF EXISTS MarkToGrade;

 DELIMITER &&
 
 CREATE FUNCTION MarkToGrade(mark INT)
 
 RETURNS VARCHAR(4)
 DETERMINISTIC

 BEGIN
  DECLARE grade VARCHAR(4);
  IF Mark >= 80 THEN
    SET grade = 'A';
  ELSEIF Mark >= 65 AND Mark < 80 THEN
    SET grade ='B';
  ELSEIF Mark >= 50 AND Mark < 65 THEN
    SET grade ='C';
  ELSE 
    SET grade ='FAIL';
  END IF;
  RETURN grade; 
 END;
 &&

 DELIMITER ;