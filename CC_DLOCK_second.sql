BEGIN TRANSACTION
  UPDATE bank_account
  SET balance = balance + 200
  WHERE account_id = 4




  UPDATE bank_account 
  SET balance = balance - 100
  WHERE account_id = 3


ROLLBACK
