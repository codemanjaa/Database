--Task 4 
-- RIGHT

ROLLBACK -- Ensure the query 

--2

SET TRANSACTION ISOLATION LEVEL REPEATABLE READ
BEGIN TRANSACTION

SELECT * FROM account where account_id = 1
sp_show_all_locks

--4 
UPDATE account SET balance = balance + 100 WHERE account_id = 1
sp_show_all_locks
COMMIT
