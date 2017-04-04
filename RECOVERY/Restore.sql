BACKUP LOG RestTest TO DISK = 'C:\DBP_backups\backuplog.bak' WITH CONTINUE_AFTER_ERROR

--Start from the last full backup

RESTORE DATABASE RestTest FROM DISK = 'C:\DBP_backups\resttest_full_t1.bak' WITH NORECOVERY

-- RESTORE the last differential back up 

RESTORE DATABASE RestTest FROM DISK = 'C:\DBP_backups\rt_dlog_t3.bak'

-- Restore the log backups
RESTORE LOG RestTest FROM DISK = 'C:\DBP_backups\rt_logt1.bak' WITH NORECOVERY
RESTORE LOG RestTest FROM DISK = 'C:\DBP_backups\rt_log_t2.bak' WITH NORECOVERY
RESTORE LOG RestTest FROM DISK = 'C:\DBP_backups\rt_log_t4.bak' WITH NORECOVERY
RESTORE LOG RestTest FROM DISK = 'C:\DBP_backups\rt_log_t5.bak' WITH NORECOVERY


-- Completion

RESTORE DATABASE RestTest WITH RECOVERY
