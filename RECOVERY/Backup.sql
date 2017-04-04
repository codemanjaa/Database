USE RestTest

CREATE TABLE Test(
id INT NOT NULL PRIMARY KEY,
name VARCHAR(20) NOT NULL
)


--Insert two new rows

INSERT INTO Test (id, name) VALUES (1, 'T1 insert 1');
INSERT INTO Test (id, name) VALUES (2, 'T1 Insert 2');

BACKUP LOG RestTest TO DISK = 'C:\DBP_backups\backuplog_t1'

-- Step 8
INSERT INTO Test (id, name) VALUES (3, 'T1 insert 3')
INSERT INTO Test (id, name) VALUES (4, 'T1 Insert 4')

-- Take a log back up
BACKUP LOG RestTest TO DISK = 'C:\DBP_backups\backuplog_t2'

-- Insert two rows

INSERT INTO Test (id, name) VALUES (5, 'T1 insert 5')
INSERT INTO Test (id, name) VALUES (6, 'T1 Insert 6')

--Take a differential backup
BACKUP DATABASE RestTest TO DISK = 'C:\DBP_backups\differitialbackup_t3'

--insert two new rows


INSERT INTO Test (id, name) VALUES (7, 'T1 insert 7')
INSERT INTO Test (id, name) VALUES (8, 'T1 Insert 8')


--Take a database backup
BACKUP LOG RestTest TO DISK = 'C:\DBP_backups\backuplog_t4'


--
INSERT INTO Test (id, name) VALUES (9, 'T1 insert 9')

--
BACKUP LOG RestTest TO DISK = 'C:\DBP_backups\backuplog_t5'
--
INSERT INTO Test (id, name) VALUES (10, 'T1 Insert 10')






