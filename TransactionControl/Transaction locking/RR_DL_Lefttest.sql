
--Task 4 
-- LEFT
--1
ROLLBACK -- Ensure the query 

SET TRANSACTION ISOLATION LEVEL REPEATABLE READ
BEGIN TRANSACTION

SELECT * FROM account WHERE account_id = 1
sp_show_all_locks 

--3
UPDATE account SET balance = balance + 100 WHERE account_id = 1
sp_show_all_locks
COMMIT
