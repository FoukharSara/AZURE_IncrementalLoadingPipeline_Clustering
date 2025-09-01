CREATE PROCEDURE UPDATEWatemarkTable
    @lastload Varchar(2000)
AS 
  Begin
    BEGIN TRANSACTION;

	UPDATE [dbo].[water_table]
	SET last_load = @lastload
	COMMIT TRANSACTION;

	END;