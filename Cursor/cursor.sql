-- Cursors
-- what ? Cursor is a special variable -> seperate datatype
    -- DECLARE variName CURSOR FOR select_statement;
    -- when? select_statment, group by, order by, subquery, and or join
    -- we can use on view also
-- why ? To read record records one by one 
-- from where ? mostly from select query

-- Cursor programing Steps:
-- 1. declare Error Handler for cursor end condition (NOTFOUND)<- IS A SQL State, which means EOF
-- 2. declare cursor variable and its select statements 
-- 3. open the cursor -> ready for the process
-- 4. fetch values from cursor into local variable (of current record) and process them 
-- 5. when all rows are completed, error handler will be executed
-- 6. close cursor at the end of cursor

-- Cursor syntax
DECLARE v_flag INT DEFAULT 0;
DECLARE CONTINUE HANDLER FOR NOTFOUND SET v_flag = 1;
DECLARE v_cur CURSOR FOR SELECT ...;
OPEN v_cur;
label: LOOP 
    FETCH v_cur INTO variables;
    IF v_flag = 1 THEN 
        LEAVE label;
    END IF
    process variabels;
END LOOP;
CLOSE v_cur;

-- go to record_fetcher.sql