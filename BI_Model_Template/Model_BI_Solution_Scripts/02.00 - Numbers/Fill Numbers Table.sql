TRUNCATE TABLE tb_TRGMDL_Numbers
DECLARE @startnum INT=0
DECLARE @endnum INT=32767
;

WITH gen AS (
    SELECT @startnum AS PKEY
    UNION ALL
    SELECT PKEY+1 FROM gen WHERE PKEY+1<=@endnum
)
INSERT INTO tb_TRGMDL_Numbers
(
	PKEY, Number, 
	Group_by_50_ID, Group_by_50_Name, 
	Group_by_100_ID, Group_by_100_Name, 
	Group_by_150_ID, Group_by_150_Name, 
	Group_by_250_ID, Group_by_250_Name, 
	Group_by_500_ID, Group_by_500_Name,
	Group_by_1000_ID, Group_by_1000_Name
)
SELECT 
	PKEY,
	PKEY AS Number,
	ROUND(PKEY/50,0)+1 AS Group_by_50_ID,
	CAST(ROUND(PKEY/50,0) * 50 AS VARCHAR(20)) + '-' + CAST(((ROUND(PKEY/50,0)+1) * 50)-1 AS VARCHAR(20)) AS Group_by_50_Name,
	ROUND(PKEY/100,0)+1 AS Group_by_100_ID,
	CAST(ROUND(PKEY/100,0) * 100 AS VARCHAR(20)) + '-' + CAST(((ROUND(PKEY/100,0)+1) * 100)-1 AS VARCHAR(20)) AS Group_by_100_Name,
	ROUND(PKEY/150,0)+1 AS Group_by_150_ID,
	CAST(ROUND(PKEY/150,0) * 150 AS VARCHAR(20)) + '-' + CAST(((ROUND(PKEY/150,0)+1) * 150)-1 AS VARCHAR(20)) AS Group_by_150_Name,
	ROUND(PKEY/250,0)+1 AS Group_by_250_ID,
	CAST(ROUND(PKEY/250,0) * 250 AS VARCHAR(20)) + '-' + CAST(((ROUND(PKEY/250,0)+1) * 250)-1 AS VARCHAR(20)) AS Group_by_250_Name,
	ROUND(PKEY/500,0)+1 AS Group_by_500_ID,
	CAST(ROUND(PKEY/500,0) * 500 AS VARCHAR(20)) + '-' + CAST(((ROUND(PKEY/500,0)+1) * 500)-1 AS VARCHAR(20)) AS Group_by_500_Name,
	ROUND(PKEY/1000,0)+1 AS Group_by_1000_ID,
	CAST(ROUND(PKEY/1000,0) * 1000 AS VARCHAR(20)) + '-' + CAST(((ROUND(PKEY/1000,0)+1) * 1000)-1 AS VARCHAR(20)) AS Group_by_1000_Name
FROM gen
option (maxrecursion 32767)


INSERT INTO tb_TRGMDL_Numbers
(
	PKEY, Number, 
	Group_by_50_ID, Group_by_50_Name, 
	Group_by_100_ID, Group_by_100_Name, 
	Group_by_150_ID, Group_by_150_Name, 
	Group_by_250_ID, Group_by_250_Name, 
	Group_by_500_ID, Group_by_500_Name,
	Group_by_1000_ID, Group_by_1000_Name
)
SELECT 
	PKEY + 32768 AS PKEY,
	PKEY + 32768 AS Number,
	ROUND((PKEY + 32768)/50,0)+1 AS Group_by_50_ID,
	CAST(ROUND((PKEY + 32768)/50,0) * 50 AS VARCHAR(20)) + '-' + CAST(((ROUND((PKEY + 32768)/50,0)+1) * 50)-1 AS VARCHAR(20)) AS Group_by_50_Name,
	ROUND((PKEY + 32768)/100,0)+1 AS Group_by_100_ID,
	CAST(ROUND((PKEY + 32768)/100,0) * 100 AS VARCHAR(20)) + '-' + CAST(((ROUND((PKEY + 32768)/100,0)+1) * 100)-1 AS VARCHAR(20)) AS Group_by_100_Name,
	ROUND((PKEY + 32768)/150,0)+1 AS Group_by_150_ID,
	CAST(ROUND((PKEY + 32768)/150,0) * 150 AS VARCHAR(20)) + '-' + CAST(((ROUND((PKEY + 32768)/150,0)+1) * 150)-1 AS VARCHAR(20)) AS Group_by_150_Name,
	ROUND((PKEY + 32768)/250,0)+1 AS Group_by_250_ID,
	CAST(ROUND((PKEY + 32768)/250,0) * 250 AS VARCHAR(20)) + '-' + CAST(((ROUND((PKEY + 32768)/250,0)+1) * 250)-1 AS VARCHAR(20)) AS Group_by_250_Name,
	ROUND((PKEY + 32768)/500,0)+1 AS Group_by_500_ID,
	CAST(ROUND((PKEY + 32768)/500,0) * 500 AS VARCHAR(20)) + '-' + CAST(((ROUND((PKEY + 32768)/500,0)+1) * 500)-1 AS VARCHAR(20)) AS Group_by_500_Name,
	ROUND((PKEY + 32768)/1000,0)+1 AS Group_by_1000_ID,
	CAST(ROUND((PKEY + 32768)/1000,0) * 1000 AS VARCHAR(20)) + '-' + CAST(((ROUND((PKEY + 32768)/1000,0)+1) * 1000)-1 AS VARCHAR(20)) AS Group_by_1000_Name
FROM tb_TRGMDL_Numbers TN WITH (NOLOCK)

INSERT INTO tb_TRGMDL_Numbers
(
	PKEY, Number, 
	Group_by_50_ID, Group_by_50_Name, 
	Group_by_100_ID, Group_by_100_Name, 
	Group_by_150_ID, Group_by_150_Name, 
	Group_by_250_ID, Group_by_250_Name, 
	Group_by_500_ID, Group_by_500_Name,
	Group_by_1000_ID, Group_by_1000_Name
)
SELECT 
	PKEY + 65536 AS PKEY,
	PKEY + 65536 AS Number,
	ROUND((PKEY + 65536)/50,0)+1 AS Group_by_50_ID,
	CAST(ROUND((PKEY + 65536)/50,0) * 50 AS VARCHAR(20)) + '-' + CAST(((ROUND((PKEY + 65536)/50,0)+1) * 50)-1 AS VARCHAR(20)) AS Group_by_50_Name,
	ROUND((PKEY + 65536)/100,0)+1 AS Group_by_100_ID,
	CAST(ROUND((PKEY + 65536)/100,0) * 100 AS VARCHAR(20)) + '-' + CAST(((ROUND((PKEY + 65536)/100,0)+1) * 100)-1 AS VARCHAR(20)) AS Group_by_100_Name,
	ROUND((PKEY + 65536)/150,0)+1 AS Group_by_150_ID,
	CAST(ROUND((PKEY + 65536)/150,0) * 150 AS VARCHAR(20)) + '-' + CAST(((ROUND((PKEY + 65536)/150,0)+1) * 150)-1 AS VARCHAR(20)) AS Group_by_150_Name,
	ROUND((PKEY + 65536)/250,0)+1 AS Group_by_250_ID,
	CAST(ROUND((PKEY + 65536)/250,0) * 250 AS VARCHAR(20)) + '-' + CAST(((ROUND((PKEY + 65536)/250,0)+1) * 250)-1 AS VARCHAR(20)) AS Group_by_250_Name,
	ROUND((PKEY + 65536)/500,0)+1 AS Group_by_500_ID,
	CAST(ROUND((PKEY + 65536)/500,0) * 500 AS VARCHAR(20)) + '-' + CAST(((ROUND((PKEY + 65536)/500,0)+1) * 500)-1 AS VARCHAR(20)) AS Group_by_500_Name,
	ROUND((PKEY + 65536)/1000,0)+1 AS Group_by_1000_ID,
	CAST(ROUND((PKEY + 65536)/1000,0) * 1000 AS VARCHAR(20)) + '-' + CAST(((ROUND((PKEY + 65536)/1000,0)+1) * 1000)-1 AS VARCHAR(20)) AS Group_by_1000_Name
FROM tb_TRGMDL_Numbers TN WITH (NOLOCK) WHERE PKEY BETWEEN 0 AND 32767

SELECT 
	COUNT(*)
FROM tb_TRGMDL_Numbers TN WITH (NOLOCK)
