USE TransactionTestDatabase

CREATE TABLE bank_account(

account_id INTEGER NOT NULL,
customer CHARACTER(10) NOT NULL,
balance INTEGER NOT NULL,
PRIMARY KEY (account_id)
)

INSERT INTO bank_account (account_id, customer, balance) VALUES (1, 'a', 100)
INSERT INTO bank_account (account_id, customer, balance) VALUES (2, 'b', 200)
INSERT INTO bank_account (account_id, customer, balance) VALUES (3, 'b', 300)
INSERT INTO bank_account (account_id, customer, balance) VALUES (4, 'c', 400)
