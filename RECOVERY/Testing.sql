
--CREATE TABLE in SQLQ6
--P1
CREATE TABLE Rtest(
id INT NOT NULL PRIMARY KEY,
val VARCHAR(20),
ts DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);
GO
--P2
CHECKPOINT

-----------------------SQLQ1
-- T! 
BEGIN TRAN
INSERT INTO Rtest (id,val) VALUES (1, 'T1 insert 1');

--P2
INSERT INTO Rtest (id, val) VALUES (4, 'T1 insert 2');
COMMIT WORK;

------------------------------SQLQ2
--T2 
BEGIN TRAN
INSERT INTO Rtest(id,val) VALUES (2, 'T2 insert 1')

--P2
INSERT INTO Rtest (id, val) VALUES (5, 'T2 insert 2');
--P3
UPDATE Rtest SET val = 'T2 UPDATE of 2' WHERE id = 5;
ROLLBACK WORK;

-----------------------------------------SQLQ3
--T3
BEGIN TRAN
INSERT INTO Rtest(id, val) VALUES(3, 'T3 Insert 1');

-- --P2
SELECT * FROM rtest;

---------------------------------------------------------------------SQLQ4
-- T4 
BEGIN TRAN
INSERT INTO Rtest (id, val) VALUES (6, 'T4 insert 1')

--P2
INSERT INTO Rtest (id, val) VALUES (8, 'T4 insert 2');
COMMIT


----------------------------------------------------------------------------------------------------------------------------SQLQ5

--T5
BEGIN TRAN
INSERT INTO Rtest(id, val) VALUES(7, 'T5 insert 1');





