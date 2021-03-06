CREATE DATABASE Test;
USE Test;

--TASK 1

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

 

CREATE TRIGGER Account_Insert_Trigger ON Account
AFTER INSERT
AS
BEGIN
DECLARE @account_number INT
DECLARE @balance DECIMAL(11,2)
DECLARE @username VARCHAR(20)

SELECT @username = master.dbo.sysprocesses WHERE spid = @@SPID


SELECT @account_number = INSERTRED.account_number, @balance = INSERTED.balance
FROM INSERTED
INSERT INTO History(account_number,modification_date,modification_time,username,modification_type) VALUES
(@account_number, @balance,CONVERT(date, GETDATE()), CONVERT(date, CURRENT_TIMESTAMP), @username, 'INSERT' )
AS print 'INSERT DONE'

END

INSERT INTO Account (account_number,balance) VALUES(2, 15000.00)
