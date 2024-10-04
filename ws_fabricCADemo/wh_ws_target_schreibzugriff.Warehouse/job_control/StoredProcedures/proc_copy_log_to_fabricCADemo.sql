CREATE   PROCEDURE [job_control].[proc_copy_log_to_fabricCADemo]
AS
BEGIN
    BEGIN TRY
        -- Dynamisches SQL zum Einfügen von Daten in das Ziel-Warehouse
        DECLARE @sql NVARCHAR(MAX);

        SET @sql = N'
        INSERT INTO [ws_fabricCADemo].[wh_ws_target_schreibzugriff].[job_control].[job_log]
        (   [log_id]
            , [log_dt]
            , [log_returncode]
            , [log_message]
            , [log_jcf_job_id]
            , [log_modul]
        )
        SELECT 
            [log_id]
            , [log_dt]
            , [log_returncode]
            , [log_message]
            , [log_jcf_job_id]
            , [log_modul]
        FROM [ws_CADev].[wh_ws_ziel_schreibzugriff].[job_control].[job_log];';

        EXEC sp_executesql @sql;
    END TRY
    BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(4000);
        DECLARE @ErrorSeverity INT;
        DECLARE @ErrorState INT;

        SELECT 
            @ErrorMessage = ERROR_MESSAGE(),
            @ErrorSeverity = ERROR_SEVERITY(),
            @ErrorState = ERROR_STATE();

        RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH
END;