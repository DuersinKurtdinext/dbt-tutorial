CREATE VIEW [job_control].[vw_job_log]
AS
SELECT 
    [log_id],
    [log_dt],
    [log_returncode],
    [log_message],
    [log_jcf_job_id],
    [log_modul]
FROM [job_control].[job_log];