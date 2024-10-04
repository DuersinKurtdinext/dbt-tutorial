CREATE    FUNCTION [job_control].[func_jcf_get_job_returncode] (
	@parRcLiteralCd VARCHAR(50),
	@parRcTypCd VARCHAR(20),
	@parLanguage VARCHAR(2)='DE'
)
RETURNS TABLE AS

RETURN
	SELECT TOP 1
	   [rc_literal_cd]
      ,[rc_typ_cd]
      ,[rc_id]
      ,(CASE WHEN UPPER(@parLanguage) = 'DE' THEN [rc_text_de_desc] ELSE [rc_text_en_desc] END) [returncode_text]
  FROM [job_control].[job_returncode]
  WHERE 1=1
    AND UPPER([rc_literal_cd]) = UPPER(@parRcLiteralCd)
	AND UPPER([rc_typ_cd]) = UPPER(@parRcTypCd)