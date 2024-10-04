CREATE TABLE [job_control].[job_log] (

	[log_id] int NOT NULL, 
	[log_dt] datetime2(2) NOT NULL, 
	[log_returncode] int NOT NULL, 
	[log_message] varchar(300) NOT NULL, 
	[log_jcf_job_id] varchar(300) NOT NULL, 
	[log_modul] varchar(255) NOT NULL
);

