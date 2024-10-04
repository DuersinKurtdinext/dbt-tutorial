--EXEC [job_control].[proc_log]

CREATE   PROCEDURE [job_control].[proc_log]
AS
BEGIN
    BEGIN TRY
        INSERT INTO [job_control].[job_log]
        (   [log_id]
            , [log_dt]
            , [log_returncode]
            , [log_message]
            , [log_jcf_job_id]
            , [log_modul]  -- Füge die Spalte log_modul hinzu
        )
        VALUES
        (   1
            , GETDATE()
            , 0
            , 'Finished'
            , 'Test'
            , 'Module1'  -- Gib einen Wert für log_modul an
        );

        INSERT INTO [job_control].[job_log]
        (   [log_id]
            , [log_dt]
            , [log_returncode]
            , [log_message]
            , [log_jcf_job_id]
            , [log_modul]  -- Füge die Spalte log_modul hinzu
        )
        VALUES
        (   2
            , GETDATE()
            , 1
            , 'Error'
            , 'Test1'
            , 'Module2'  -- Gib einen Wert für log_modul an
        );
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