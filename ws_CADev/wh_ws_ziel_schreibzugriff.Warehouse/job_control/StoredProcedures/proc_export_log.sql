CREATE   PROCEDURE [job_control].[proc_export_log]
AS
BEGIN
    -- Daten in eine temporäre Tabelle exportieren
    SELECT 
        [log_id],
        [log_dt],
        [log_returncode],
        [log_message],
        [log_jcf_job_id],
        [log_modul]
    INTO #temp_job_log
    FROM [job_control].[job_log];
    
    -- Exportiere die temporäre Tabelle in eine Datei (z.B. CSV)
    -- Dies kann mit BCP oder einem anderen Export-Tool erfolgen
END;