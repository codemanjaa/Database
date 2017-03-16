--Task 5
-- RIGHT

ROLLBACK -- Ensure the query 

--2

SET TRANSACTION ISOLATION LEVEL READ COMMITTED
BEGIN TRANSACTION
INSERT INTO account(account_id, customer, balance) VALUES (22, 'B', 2000)

--4 
sp_show_all_locks
SELECT * FROM account
ROLLBACK
SELECT * FROM account
