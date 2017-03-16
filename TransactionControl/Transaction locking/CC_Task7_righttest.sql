--Task 7
-- RIGHT

ROLLBACK -- Ensure the query 

--2

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
BEGIN TRANSACTION
SELECT * FROM account WHERE customer = 'c'
sp_show_all_locks


--4 
UPDATE account SET balance = balance - 50 WHERE customer = 'c'
sp_show_all_locks

COMMIT


SELECT * FROM account
