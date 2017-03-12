


BEGIN TRANSACTION
  UPDATE bank_account 
  SET balance=balance+100
  WHERE account_id = 3





UPDATE bank_account 
SET balance = balance - 100
WHERE account_id = 4



ROLLBACK
SELECT balance FROM bank_account
