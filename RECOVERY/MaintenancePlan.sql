BACKUP DATABASE [RestTest] TO  DISK = N'E:\DBP_backups\RestTest_backup_2017_04_08_173954_0712709.bak' WITH  MAXTRANSFERSIZE = 65536,  EXPIREDATE = N'04/22/2017 00:00:00', NOFORMAT, NOINIT,  NAME = N'RestTest_backup_2017_04_08_173954_0712709', SKIP, REWIND, NOUNLOAD,  STATS = 10
GO
declare @backupSetId as int
select @backupSetId = position from msdb..backupset where database_name=N'RestTest' and backup_set_id=(select max(backup_set_id) from msdb..backupset where database_name=N'RestTest' )
if @backupSetId is null begin raiserror(N'Verify failed. Backup information for database ''RestTest'' not found.', 16, 1) end
RESTORE VERIFYONLY FROM  DISK = N'E:\DBP_backups\RestTest_backup_2017_04_08_173954_0712709.bak' WITH  FILE = @backupSetId,  NOUNLOAD,  NOREWIND
