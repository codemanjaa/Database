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
		DECLARE @oldbalance DECIMAL(11,2)
		DECLARE @newbalance DECIMAL(11,2)

			SELECT @oldbalance = old.balance,
				   @newbalance =new.balance
			FROM DELETED AS old
				 JOIN INSERTED AS new ON (new.account_number = old.account_number)

				 UPDATE History SET new_balance = @newbalance, old_balance = @oldbalance FROM History JOIN inserted 
				 ON History.account_number = inserted.account_number

--			SELECT @oldbalance = DELETED.balance, @newbalance = DELETED.new_balance FROM DELETED
	--	UPDATE History SET old_balance = old.balance, new_balance = old.balance FROM DELETED as old JOIN History AS new ON
	--	(new.account_number = old.account_number)
				 
				 
print 'Update balance success'			 
END


-- UPDATE THE History table




UPDATE Account set balance = 350000.00 WHERE account_number = 2

SELECT * FROM Account
SELECT * FROM History
