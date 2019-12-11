-- -------------------------------------------------------------------------------------
-- CHOOSE DATABASE ---------------------------------------------------------------------
-- -------------------------------------------------------------------------------------
USE Targit_Model
GO
-- -------------------------------------------------------------------------------------
-- CREATE THE TABLE --------------------------------------------------------------------
-- -------------------------------------------------------------------------------------
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tb_TRGMDL_Time]') AND TYPE IN (N'U'))
	BEGIN
		CREATE TABLE tb_TRGMDL_Time 
		(
			PKEY INT IDENTITY(1,1) NOT NULL,
			TM_Hour SMALLINT NULL,
			TM_Minute SMALLINT NULL,
			TM_Second SMALLINT NULL,
			TM_Description VARCHAR(20) NULL, -- TIME FORMAT OF THE ABOVE e.g. 20:35:58
			CONSTRAINT [PK_tb_TRGMDL_Time] PRIMARY KEY CLUSTERED 
			(PKEY ASC)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
		) ON [PRIMARY]
	END
-- -------------------------------------------------------------------------------------
-- FILL THE TABLE ----------------------------------------------------------------------
-- -------------------------------------------------------------------------------------
DECLARE @MY_INT INT
DECLARE @MY_LIMIT INT
DECLARE @MY_INCREMENT INT
DECLARE @MY_DATE VARCHAR(20)
DECLARE @MY_SQL NVARCHAR(MAX)
DECLARE @MY_HOURS SMALLINT
DECLARE @MY_MINUTES SMALLINT
DECLARE @MY_SECONDS SMALLINT

	SET @MY_SQL = ''

	SET @MY_SECONDS = 59
	SET @MY_MINUTES = 59
	SET @MY_HOURS = -1

	SET @MY_INT = 0
	SET @MY_LIMIT = 86400

	TRUNCATE TABLE tb_TRGMDL_Time

	WHILE @MY_INT < @MY_LIMIT
		BEGIN
		
			SET @MY_SECONDS	=	CASE WHEN @MY_SECONDS = 59 THEN 0 ELSE @MY_SECONDS + 1 END
			SET @MY_MINUTES	=	CASE 
									WHEN @MY_MINUTES = 59 AND @MY_SECONDS = 0 THEN 0 
									WHEN @MY_MINUTES = 59 AND @MY_SECONDS <> 0 THEN @MY_MINUTES
									WHEN @MY_MINUTES <> 59 AND @MY_SECONDS = 0 THEN @MY_MINUTES + 1
									WHEN @MY_MINUTES <> 59 AND @MY_SECONDS <> 0 THEN @MY_MINUTES
								END
									
			SET @MY_HOURS	=	CASE 
									WHEN @MY_MINUTES = 0 AND @MY_SECONDS = 0 THEN @MY_HOURS + 1 
									ELSE @MY_HOURS
								END

			INSERT INTO tb_TRGMDL_Time
			(PKEY, TM_Hour, TM_Minute, TM_Second, TM_Description)
			SELECT
				CAST(RIGHT('00' + CAST(@MY_HOURS AS VARCHAR(10)),2) + RIGHT('00' + CAST(@MY_MINUTES AS VARCHAR(10)),2) + RIGHT('00' + CAST(@MY_SECONDS AS VARCHAR(10)),2) AS INT) AS PKEY,
				@MY_HOURS, @MY_MINUTES, @MY_SECONDS, RIGHT('00' + CAST(@MY_HOURS AS VARCHAR(10)),2) + ':' + RIGHT('00' + CAST(@MY_MINUTES AS VARCHAR(10)),2) + ':' + RIGHT('00' + CAST(@MY_SECONDS AS VARCHAR(10)),2)
			
			SET @MY_INT = @MY_INT + 1
		END