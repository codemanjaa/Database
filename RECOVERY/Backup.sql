CREATE DATABASE RestTest





USE RestTest

ALTER DATABASE RestTest SET RECOVERY FULL

CREATE TABLE Test(

id INT NOT NULL PRIMARY KEY,

name VARCHAR(20) NOT NULL

)

ALTER DATABASE RestTest SET RECOVERY FULL

--FullBackup

BACKUP DATABASE RestTest TO DISK = 'C:\DBP_backups\RestTest_full_t1.bak'

--Insert two new rows



INSERT INTO Test (id, name) VALUES (1, 'T1 insert 1');

INSERT INTO Test (id, name) VALUES (2, 'T1 Insert 2');



BACKUP LOG RestTest TO DISK = 'C:\DBP_backups\RestTest_log_t2.bak'



-- Step 8

INSERT INTO Test (id, name) VALUES (3, 'T2 insert 3');

INSERT INTO Test (id, name) VALUES (4, 'T2 Insert 4');



-- Take a log back up

BACKUP LOG RestTest TO DISK = 'C:\DBP_backups\RestTest_log_t3.bak'



-- Insert two rows



INSERT INTO Test (id, name) VALUES (5, 'T1 insert 5');

INSERT INTO Test (id, name) VALUES (6, 'T1 Insert 6');



--Take a differential backup

BACKUP DATABASE RestTest TO DISK = 'C:\DBP_backups\RestTest_differential_t4.bak' WITH DIFFERENTIAL



--insert two new rows





INSERT INTO Test (id, name) VALUES (7, 'T1 insert 7');

INSERT INTO Test (id, name) VALUES (8, 'T1 Insert 8');





--Take a database backup

BACKUP LOG RestTest TO DISK = 'C:\DBP_backups\RestTest_log_t5.bak'

--

INSERT INTO Test (id, name) VALUES (9, 'T1 insert 9')

--

BACKUP LOG RestTest TO DISK = 'C:\DBP_backups\RestTest_log_t6.bak'

--

INSERT INTO Test (id, name) VALUES (10, 'T1 Insert 10')

