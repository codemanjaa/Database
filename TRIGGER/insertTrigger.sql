CREATE DATABASE Test
USE Test

CREATE TABLE Account(
account_number VARCHAR(12) NOT NULL PRIMARY KEY,
balance DECIMAL(11,2) NOT NULL
)

ALTER TABLE Account ADD 
CONSTRAINT chk_balance CHECK(balance < 999999999.99)

DROP Table History

CREATE TABLE History(
row_id INT IDENTITY,
account_number VARCHAR(12),
modification_date DATE,
modification_time TIME,
username VARCHAR(20),
modification_type VARCHAR(6),
old_balance DECIMAL(11,2),
new_balance DECIMAL(11,2) 
)

ALTER TABLE History ADD 
CONSTRAINT chk_type CHECK(modification_type IN('INSERT', 'UPDATE', 'DELETE'))



--DECLARE @username VARCHAR(20)
--SELECT username = nt_username FROM master.dbo.sysprocesses WHERE spid = @@SPID 
-- SELECT * FROM INFORMATION_SCHEMA.TABLES






-----------------------------***************************---------------------------------
-- Insert Trigger 


CREATE TRIGGER Account_Insert_Trigger ON Account
AFTER INSERT 
	AS
		BEGIN
		
			DECLARE @account_number VARCHAR(12)
			DECLARE @balance DECIMAL(11,2)
			DECLARE @username VARCHAR(20)

			SELECT @username = spid FROM master.dbo.sysprocesses WHERE spid = @@SPID

			SELECT @account_number = inserted.account_number, @balance = inserted.balance
			  FROM inserted
			  INSERT INTO History VALUES(@account_number, CONVERT(date, GETDATE()), CONVERT(time, CURRENT_TIMESTAMP),@username,'INSERT', @balance,@balance)
		END

		print 'Insert sucess!!!'


-- Testing value 

INSERT INTO Account Values(1, 15000.00)
SELECT * FROM account
SELECT * FROM History
