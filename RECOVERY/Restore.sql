
ALTER DATABASE RestTest SET OFFLINE

ALTER DATABASE RestTest SET ONLINE
-- Create a tail-log backup

BACKUP LOG RestTest TO DISK = 'C:\DBP_backups\RestTest_log_t7.bak' WITH NORECOVERY



--Start from the last full backup

RESTORE DATABASE RestTest FROM DISK = 'C:\DBP_backups\RestTest_full_t1.bak' WITH NORECOVERY



-- RESTORE the last differential back up 



RESTORE DATABASE RestTest FROM DISK = 'C:\DBP_backups\RestTest_differential_t4.bak' WITH NORECOVERY



-- Restore the log backups

--RESTORE LOG RestTest FROM DISK = 'E:\DBP_backups\RestTest_log_t2.bak' WITH NORECOVERY

--RESTORE LOG RestTest FROM DISK = 'E:\DBP_backups\RestTest_log_t3.bak' WITH NORECOVERY

RESTORE LOG RestTest FROM DISK = 'C:\DBP_backups\RestTest_log_t5.bak' WITH NORECOVERY

RESTORE LOG RestTest FROM DISK = 'C:\DBP_backups\RestTest_log_t6.bak' WITH NORECOVERY

RESTORE LOG RestTest FROM DISK = 'C:\DBP_backups\RestTest_log_t7.bak' WITH NORECOVERY
-- Completion



RESTORE DATABASE RestTest WITH RECOVERY

USE RestTest
select * from Test
