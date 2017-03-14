-- This session shows the NONREPEATABLE situation problem:

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

BEGIN TRANSACTION;

SELECT * FROM bank_account 
WHERE account_id = 1

WAITFOR DELAY '00:00:10'

SELECT * FROM bank_account 
WHERE account_id =1


ROLLBACK TRANSACTION;

------ Solution for the NONREPEATABLE situation but this time working on the balance

SET TRANSACTION ISOLATION LEVEL REPEATABLE READ

BEGIN TRANSACTION;

SELECT * FROM bank_account 
WHERE account_id = 1

WAITFOR DELAY '00:00:10'

SELECT * FROM bank_account 
WHERE account_id =1


ROLLBACK TRANSACTION;
