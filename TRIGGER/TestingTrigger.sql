CREATE DATABASE Test;
USE Test;

--TASK 1

CREATE TABLE Account(

account_number VARCHAR(12) NOT NULL PRIMARY KEY,
balance DECIMAL(11,2)    
)

CREATE TABLE History(
row_id INT IDENTITY,
account_number VARCHAR(12),
modification_date DATE,
modification_time Time,
username VARCHAR(50),
modification_type VARCHAR(10) NOT NULL 
CHECK(modification_type IN('INSERT','UPDATE','DELETE')),
old_balance DECIMAL(11,2),
new_balance DECIMAL(11,2)  
)

 

ALTER TRIGGER Account_Insert_Trigger ON Account
AFTER INSERT
AS
BEGIN
DECLARE @account_number INT
DECLARE @balance DECIMAL(11,2)
DECLARE @username VARCHAR(20)

SELECT @username = spid FROM master.dbo.sysprocesses  WHERE spid = @@SPID


SELECT @account_number = INSERTED.account_number, @balance = INSERTED.balance
FROM INSERTED
INSERT INTO History  VALUES
(@account_number, CONVERT(date, GETDATE()), CONVERT(time, CURRENT_TIMESTAMP), @username, 'INSERT', @balance, @balance)

END

print 'INSERT Success'

INSERT INTO Account (account_number,balance) VALUES(10, 15000.00)

SELECT * FROM History


ALTER TRIGGER Account_Update_balance_Trigger ON Account
AFTER UPDATE
AS
	IF UPDATE(balance)

		BEGIN
			SELECT old.balance AS 'Old Balance',
				   new.balance AS 'New balance'
			FROM DELETED AS old
				 JOIN INSERTED AS new ON (new.account_number = old.account_number)
print 'Update balance success'			 
END


UPDATE Account set balance = 250000.00 WHERE account_number = 2

SELECT * FROM Account
SELECT * FROM History
