CREATE DATABASE Test

USE Test

CREATE TABLE Account(

account_number VARCHAR(12) NOT NULL,
balance DECIMAL(11,2) NOT NULL
)

ALTER TABLE Account ADD
CONSTRAINT pk_account PRIMARY KEY (account_number)



CREATE TABLE History (
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
CONSTRAINT chk_type CHECK(modification_type IN('INSERT','UPDATE','DELETE'))

CREATE TRIGGER Account_insert_trigger ON Account
AFTER INSERT
	AS
		BEGIN
			DECLARE @username VARCHAR(20)
			DECLARE @account_number VARCHAR(12)
			DECLARE @balance DECIMAL(11,2)

			SELECT @username = nt_username FROM master.dbo.sysprocesses WHERE spid = @@SPID

			SELECT @account_number = old.account_number, @balance = old.balance 
			FROM inserted as old
			INSERT INTO History VALUES(
			@account_number, CONVERT(DATE, GETDATE()), CONVERT(TIME, CURRENT_TIMESTAMP), @username, 'INSERT', @balance, @balance)
			
		END
		print 'INSERT Success!!!'



INSERT INTO Account VALUES(1, 15000.00)

Select * FROM History



CREATE TRIGGER Account_Update_Balance_Trigger ON Account
AFTER UPDATE
AS
	IF UPDATE(balance)
			
			BEGIN 
				
				SELECT old.balance AS 'Old Balance', new.balance AS 'New Balance'
				FROM DELETED AS old

				JOIN INSERTED AS new on (new.account_number = old.account_number)
			
			END






















