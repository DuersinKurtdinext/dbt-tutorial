CREATE   PROCEDURE [job_control].[proc_copy_log]
AS
BEGIN
    BEGIN TRY
        -- Daten aus der Quelle lesen
        INSERT INTO [wh_ws_ziel_schreibzugriff].[job_control].[job_log]
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
        FROM [wh_ws_test_schreibzugriff].[job_control].[job_log];
    END TRY
    BEGIN CATCH
        DECLARE @ErrorMessage VARCHAR(4000);
        DECLARE @ErrorSeverity INT;
        DECLARE @ErrorState INT;

        SELECT 
            @ErrorMessage = ERROR_MESSAGE(),
            @ErrorSeverity = ERROR_SEVERITY(),
            @ErrorState = ERROR_STATE();

        RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH
END;