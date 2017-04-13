

--TASK 1


CREATE DATABASE Test
USE Test

-------DDL Account Table

CREATE TABLE Account (

account_number VARCHAR(12) NOT NULL,
balance DECIMAL(11,2)
)

ALTER TABLE Account ADD 
CONSTRAINT pk_account PRIMARY KEY (account_number)

-------DDL History Table


CREATE TABLE History (

row_id int IDENTITY,
account_number VARCHAR(12),
modification_date DATE,
modificatoin_time TIME,
username VARCHAR(20),
modification_type VARCHAR(6) CHECK(modification_type IN('INSERT','UPDATE', 'DELETE')),
old_balance DECIMAL(11,2),
new_balance DECIMAL(11,2)
)


-------------- INSERT TRIGGER--------------------------------------------

CREATE TRIGGER Account_Insert_Trigger ON Account

AFTER INSERT

	AS
		BEGIN

			DECLARE @username VARCHAR(20)
			DECLARE @account_number VARCHAR(12)
			DECLARE @balance DECIMAL(11,2)

			SELECT @username = nt_username FROM master.dbo.sysprocesses WHERE spid = @@SPID

			SELECT @account_number = account_number, @balance = balance
			FROM inserted
			INSERT INTO History VALUES(
			@account_number, CONVERT(DATE, GETDATE()), CONVERT(TIME, CURRENT_TIMESTAMP), @username, 'INSERT', @balance, @balance 
			
			)
		END

		print 'INSERT Success!!!'


------------------ Testing Insertion 1----------------

INSERT INTO Account VALUES( 1, 15000.00)
SELECT * FROM History




-------- UPDATE TRIGGER---

CREATE TRIGGER Account_Update_Balance_Trigger ON Account

AFTER UPDATE 
	AS
		BEGIN

			IF UPDATE(balance)
			
				
				DECLARE @oldbalance DECIMAL(11,2)
				DECLARE @newbalance DECIMAL(11,2)
 
 				SELECT @oldbalance = old.balance,
 					   @newbalance = new.balance
  					FROM DELETED AS old
  					 JOIN INSERTED AS new ON (new.account_number = old.account_number)
  
 				 UPDATE History SET new_balance = @newbalance, old_balance = @oldbalance, SET modiftication_type = 'UPDATE' FROM History
				 JOIN inserted 
 				 ON History.account_number = inserted.account_number
				 				 		
		END

---------- Testing Update Trigger

UPDATE Account SET balance = 35000.00 WHERE account_number = 1 

SELECT * FROM History
SELECT * FROM Account



---------- DELETING Trigger-------------------------

CREATE TRIGGER Account_Delete_Trigger ON ACCOUNT

AFTER DELETE

		AS  
			BEGIN
				
			DECLARE @account_number VARCHAR(12)

			SELECT @account_number = deleted.account_number 
			FROM deleted

			DELETE FROM History
			WHERE account_number = @account_number


			END
	print 'DELETED'



DELETE FROM Account WHERE account_number = 1
