--Create tail-log backup

BACKUP LOG RestTest TO DISK = 'C:\DBP_backups\backuplog.bak' WITH CONTINUE_AFTER_ERROR

--Start from the last full backup

RESTORE DATABASE RestTest FROM DISK = 'C:\DBP_backups\backuplog.bak' WITH NORECOVERY

-- RESTORE the last differential back up 

RESTORE DATABASE RestTest FROM DISK = 'C:\DBP_backups\backuplog.bak'

-- Restore the log backups
RESTORE LOG RestTest FROM DISK = 'C:\DBP_backups\backuplog.bak' WITH NORECOVERY
RESTORE LOG RestTest FROM DISK = 'C:\DBP_backups\backuplog.bak' WITH NORECOVERY
RESTORE LOG RestTest FROM DISK = 'C:\DBP_backups\backuplog.bak' WITH NORECOVERY


-- Completion

RESTORE DATABASE RestTest WITH RECOVERY
