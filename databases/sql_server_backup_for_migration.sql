-- Remove temporary procedures if they exist (we will replace them)
IF OBJECT_ID('tempdb..#my_backup_db') IS NOT NULL
	DROP PROCEDURE #my_backup_db
IF OBJECT_ID('tempdb..#do_backup_dbs') IS NOT NULL
	DROP PROCEDURE #do_backup_dbs
GO

-- This is the main script procedure, modify to suit each run.
CREATE PROCEDURE #do_backup_dbs AS BEGIN
	DECLARE @my_folder VARCHAR(MAX);
  -- Customize the backup folder and database names to match your environment.
	SELECT @my_folder = 'D:/SQL_Backup/Bak_Files/';
	-- EXEC #my_backup_db @dbName = 'db_1', @folder = @my_folder;
	-- EXEC #my_backup_db @dbName = 'db_2', @folder = @my_folder;
	-- EXEC #my_backup_db @dbName = 'db_3', @folder = @my_folder;
	-- EXEC #my_backup_db @dbName = 'db_4', @folder = @my_folder;
	-- EXEC #my_backup_db @dbName = 'db_5', @folder = @my_folder;
	-- EXEC #my_backup_db @dbName = 'db_6', @folder = @my_folder;
	-- EXEC #my_backup_db @dbName = 'db_7', @folder = @my_folder;
	-- EXEC #my_backup_db @dbName = 'db_8', @folder = @my_folder;
	-- EXEC #my_backup_db @dbName = 'db_9', @folder = @my_folder;
END -- PROCEDURE #do_backup_dbs
GO

-- This is the accessory procedure, it will be called by the above for convenience.
CREATE PROCEDURE #my_backup_db
	@dbName VARCHAR(50),
	@folder VARCHAR(MAX)
AS BEGIN -- PROCEDURE #my_backup_db

DECLARE @myDate VARCHAR(100);
DECLARE @fileName VARCHAR(MAX);
DECLARE @verify_fail_message VARCHAR(MAX);

SELECT @myDate = REPLACE(REPLACE(CONVERT(VARCHAR,GETDATE(),120),' ','_'),':','');

SELECT @fileName = @folder + @myDate + '_' + @dbName + '_full.bak';


BACKUP DATABASE @dbName
	TO  DISK = @fileName
	WITH  COPY_ONLY, 
	FORMAT, 
	INIT,  
	--NAME = N'unanet2-Full Database Backup', 
	SKIP, 
	NOREWIND, 
	NOUNLOAD, 
	COMPRESSION,  
	STATS = 10
; --GO

declare @backupSetId as int

select @backupSetId = position from msdb..backupset where database_name=@dbName and backup_set_id=(select max(backup_set_id) from msdb..backupset where database_name=@dbName )

select @verify_fail_message = 'Verify failed. Backup information for database [' + @dbName + '] not found.'
if @backupSetId is null begin raiserror(@verify_fail_message, 16, 1) end

RESTORE VERIFYONLY FROM  DISK = @fileName 
	WITH  FILE = @backupSetId,  NOUNLOAD,  NOREWIND
; --GO

-- Take database offline if you are migrating it to another system.
-- EXEC ('ALTER DATABASE '+@dbName+' SET OFFLINE WITH ROLLBACK IMMEDIATE')

END -- PROCEDURE #my_backup_db
GO

-- Run the procedure defined near top of script
EXEC #do_backup_dbs
GO

-- Delete the temporary procedures to clean up
DROP PROCEDURE #my_backup_db
DROP PROCEDURE #do_backup_dbs
GO
