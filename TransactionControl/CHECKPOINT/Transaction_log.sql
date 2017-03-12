--Create a new database

CREATE DATABASE TestDatabase;

-- Use the DB

USE TestDatabase;

-- DROP The table if already exists

DROP Table TestTable;

-- Create the table for testing purposes

CREATE TABLE TestTable (

number INTEGER
)


-- Insert the first row in the taable

BEGIN TRANSACTION 
INSERT INTO TestTable (number) VALUES (5)
COMMIT



--1 View the table content 

SELECT * FROM TestTable

-- 2 Execute the CHECKPOINT for testing purpose only

CHECKPOINT

-- INSERT one into the table in the AUTOCOMMIT Mode

INSERT INTO TestTable (number) VALUES (11)

-- VIEW the active part of the transaction log

SELECT [CURRENT LSN],Operation, [Transaction ID], AllocUnitName, [Page ID], [Slot ID] FROM fn_dblog(NULL, NULL)

--5 insert more rows into the table ain an EXPLICIT transaction


BEGIN TRANSACTION
INSERT INTO TestTable (number) VALUES (22)
INSERT INTO TestTable (number) VALUES (33)
INSERT INTO TestTable (number) VALUES (44)
COMMIT


-- View the table content
SELECT * FROM TestTable


--- View the transaction log content

SELECT [Current LSN], Operation, [Transaction ID], AllocUnitName, [Page ID], [Slot ID] FROM fn_dblog(NULL, NULL)


-- 8  Start new transaction and inset rows without commit

BEGIN TRANSACTION

INSERT INTO TestTable (number) VALUES (10)
INSERT INTO TestTable (number) VALUES (11)
INSERT INTO TestTable (number) VALUES (12)


--9 View the content
SELECT * FROM TestTable


-- 10 View the transaction log

SELECT [Current LSN], Operation, [Transaction ID], AllocUnitName, [Page ID], [Slot ID] FROM fn_dblog(NULL, NULL)


--11 Terminate the transaction by rolling back

ROLLBACK

--View the table content

SELECT * FROM TestTable


--View the transaction log

SELECT [Current LSN], Operation, [Transaction ID], AllocUnitName, [Page ID], [Slot ID] FROM fn_dblog(NULL, NULL)





