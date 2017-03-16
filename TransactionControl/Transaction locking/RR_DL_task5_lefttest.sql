--Task 5 
-- LEFT
--1
ROLLBACK -- Ensure the query 

SET TRANSACTION ISOLATION LEVEL REPEATABLE READ
BEGIN TRANSACTION

SELECT * FROM account WHERE account_id > 10
sp_show_all_locks 

--3

sp_show_all_locks
COMMIT
SELECT * FROM account

