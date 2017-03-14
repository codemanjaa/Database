BEGIN TRANSACTION

INSERT INTO bank_account(account_id, customer, balance) VALUES (5, 'D', 1000)

ROLLBACK

