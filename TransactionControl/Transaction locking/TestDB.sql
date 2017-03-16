CREATE TABLE account(
account_id INTEGER NOT NULL,
customer CHARACTER(10) NOT NULL,
balance INTEGER NOT NULL
)

INSERT INTO account(account_id, customer, balance) VALUES
(1, 'a', 100),
(2, 'b', 200),
(3, 'c', 300),
(4, 'd', 400);

SELECT * FROM account;
