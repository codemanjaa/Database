--Task 7
-- LEFT
--1
ROLLBACK -- Ensure the query 

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
BEGIN TRANSACTION

SELECT * FROM account WHERE customer = 'a'
sp_show_all_locks 

--3

UPDATE account SET balance = balance + 100 WHERE customer = 'a'

sp_show_all_locks
COMMIT





