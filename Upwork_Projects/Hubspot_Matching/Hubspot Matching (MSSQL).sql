---------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------HUBSPOT-------------------------------------------------------------------

--DELETE DUPLICATES FROM HUBSPOT DOMAIN TABLE
WITH CTE AS (
SELECT 
	Hubspot_Original_Name,
	ROW_NUMBER() OVER(PARTITION BY Hubspot_Original_Name, Hubspot_Domain_Name ORDER BY Hubspot_Domain_Name) rnk
FROM Hubspot_Domain
)
DELETE FROM CTE
WHERE rnk > 1;

--INSERT UNIQUE VALUES INTO HUBSPOT DEDUP TABLE
INSERT INTO Hubspot_Domain_Dedup
SELECT DISTINCT Hubspot_Domain_Name FROM Hubspot_Domain;

--DELETE SHORT STRINGS
DELETE Hubspot_Domain_Dedup WHERE LEN (Hubspot_Domain_Name)<4;

---------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------UD_2017-------------------------------------------------------------------

--DELETE SHORT STRINGS
UPDATE UD17 SET Level_1 = NULL WHERE LEN (Level_1)<4;
UPDATE UD17 SET Level_2 = NULL WHERE LEN (Level_2)<4;
UPDATE UD17 SET Level_3 = NULL WHERE LEN (Level_3)<4;
UPDATE UD17 SET Level_4 = NULL WHERE LEN (Level_4)<4;
UPDATE UD17 SET Level_5 = NULL WHERE LEN (Level_5)<4;
UPDATE UD17 SET Level_6 = NULL WHERE LEN (Level_6)<4;
UPDATE UD17 SET Level_7 = NULL WHERE LEN (Level_7)<4;
UPDATE UD17 SET Level_8 = NULL WHERE LEN (Level_8)<4;
UPDATE UD17 SET Level_9 = NULL WHERE LEN (Level_9)<4;
UPDATE UD17 SET Level_10 = NULL WHERE LEN (Level_10)<4;
UPDATE UD17 SET Level_11 = NULL WHERE LEN (Level_11)<4;
UPDATE UD17 SET Level_12 = NULL WHERE LEN (Level_12)<4;

--INSERT ALL MATCHED VALUES INTO ONE UNION TABLE
INSERT INTO UD17_Union
SELECT HD.Hubspot_Domain_Name, UD17.Umbrella_Domain_Name, UD17.[Rank] FROM Hubspot_Domain_Dedup AS HD INNER JOIN UD17 AS UD17 ON HD.Hubspot_Domain_Name = UD17.Level_1
UNION ALL
SELECT HD.Hubspot_Domain_Name, UD17.Umbrella_Domain_Name, UD17.[Rank] FROM Hubspot_Domain_Dedup AS HD INNER JOIN UD17 AS UD17 ON HD.Hubspot_Domain_Name = UD17.Level_2
UNION ALL
SELECT HD.Hubspot_Domain_Name, UD17.Umbrella_Domain_Name, UD17.[Rank] FROM Hubspot_Domain_Dedup AS HD INNER JOIN UD17 AS UD17 ON HD.Hubspot_Domain_Name = UD17.Level_3
UNION ALL
SELECT HD.Hubspot_Domain_Name, UD17.Umbrella_Domain_Name, UD17.[Rank] FROM Hubspot_Domain_Dedup AS HD INNER JOIN UD17 AS UD17 ON HD.Hubspot_Domain_Name = UD17.Level_4
UNION ALL
SELECT HD.Hubspot_Domain_Name, UD17.Umbrella_Domain_Name, UD17.[Rank] FROM Hubspot_Domain_Dedup AS HD INNER JOIN UD17 AS UD17 ON HD.Hubspot_Domain_Name = UD17.Level_5
UNION ALL
SELECT HD.Hubspot_Domain_Name, UD17.Umbrella_Domain_Name, UD17.[Rank] FROM Hubspot_Domain_Dedup AS HD INNER JOIN UD17 AS UD17 ON HD.Hubspot_Domain_Name = UD17.Level_6
UNION ALL
SELECT HD.Hubspot_Domain_Name, UD17.Umbrella_Domain_Name, UD17.[Rank] FROM Hubspot_Domain_Dedup AS HD INNER JOIN UD17 AS UD17 ON HD.Hubspot_Domain_Name = UD17.Level_7
UNION ALL
SELECT HD.Hubspot_Domain_Name, UD17.Umbrella_Domain_Name, UD17.[Rank] FROM Hubspot_Domain_Dedup AS HD INNER JOIN UD17 AS UD17 ON HD.Hubspot_Domain_Name = UD17.Level_8
UNION ALL
SELECT HD.Hubspot_Domain_Name, UD17.Umbrella_Domain_Name, UD17.[Rank] FROM Hubspot_Domain_Dedup AS HD INNER JOIN UD17 AS UD17 ON HD.Hubspot_Domain_Name = UD17.Level_9
UNION ALL
SELECT HD.Hubspot_Domain_Name, UD17.Umbrella_Domain_Name, UD17.[Rank] FROM Hubspot_Domain_Dedup AS HD INNER JOIN UD17 AS UD17 ON HD.Hubspot_Domain_Name = UD17.Level_10
UNION ALL
SELECT HD.Hubspot_Domain_Name, UD17.Umbrella_Domain_Name, UD17.[Rank] FROM Hubspot_Domain_Dedup AS HD INNER JOIN UD17 AS UD17 ON HD.Hubspot_Domain_Name = UD17.Level_11
UNION ALL
SELECT HD.Hubspot_Domain_Name, UD17.Umbrella_Domain_Name, UD17.[Rank] FROM Hubspot_Domain_Dedup AS HD INNER JOIN UD17 AS UD17 ON HD.Hubspot_Domain_Name = UD17.Level_12

--DEDUPLICATE VALUES IN ORDER TO TAKE ONLY THOSE WITH HIGHEST RANK
WITH CTE AS (
SELECT 
	Hubspot_Domain_Name,
	Umbrella_Domain_Name,
	[Rank],
	ROW_NUMBER() OVER(PARTITION BY Hubspot_Domain_Name ORDER BY [Rank]) rnk
FROM UD17_Union
)

INSERT INTO UD17_Union_Dedup
SELECT 
	Hubspot_Domain_Name, 
	Umbrella_Domain_Name, 
	[Rank] 
FROM CTE
WHERE rnk = 1;

---------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------UD_2018-------------------------------------------------------------------

--DELETE SHORT STRINGS
UPDATE UD18 SET Level_1 = NULL WHERE LEN (Level_1)<4;
UPDATE UD18 SET Level_2 = NULL WHERE LEN (Level_2)<4;
UPDATE UD18 SET Level_3 = NULL WHERE LEN (Level_3)<4;
UPDATE UD18 SET Level_4 = NULL WHERE LEN (Level_4)<4;
UPDATE UD18 SET Level_5 = NULL WHERE LEN (Level_5)<4;
UPDATE UD18 SET Level_6 = NULL WHERE LEN (Level_6)<4;
UPDATE UD18 SET Level_7 = NULL WHERE LEN (Level_7)<4;
UPDATE UD18 SET Level_8 = NULL WHERE LEN (Level_8)<4;
UPDATE UD18 SET Level_9 = NULL WHERE LEN (Level_9)<4;
UPDATE UD18 SET Level_10 = NULL WHERE LEN (Level_10)<4;
UPDATE UD18 SET Level_11 = NULL WHERE LEN (Level_11)<4;
UPDATE UD18 SET Level_12 = NULL WHERE LEN (Level_12)<4;

--INSERT ALL MATCHED VALUES INTO ONE UNION TABLE
INSERT INTO UD18_Union
SELECT HD.Hubspot_Domain_Name, UD18.Umbrella_Domain_Name, UD18.[Rank] FROM Hubspot_Domain_Dedup AS HD INNER JOIN UD18 AS UD18 ON HD.Hubspot_Domain_Name = UD18.Level_1
UNION ALL
SELECT HD.Hubspot_Domain_Name, UD18.Umbrella_Domain_Name, UD18.[Rank] FROM Hubspot_Domain_Dedup AS HD INNER JOIN UD18 AS UD18 ON HD.Hubspot_Domain_Name = UD18.Level_2
UNION ALL
SELECT HD.Hubspot_Domain_Name, UD18.Umbrella_Domain_Name, UD18.[Rank] FROM Hubspot_Domain_Dedup AS HD INNER JOIN UD18 AS UD18 ON HD.Hubspot_Domain_Name = UD18.Level_3
UNION ALL
SELECT HD.Hubspot_Domain_Name, UD18.Umbrella_Domain_Name, UD18.[Rank] FROM Hubspot_Domain_Dedup AS HD INNER JOIN UD18 AS UD18 ON HD.Hubspot_Domain_Name = UD18.Level_4
UNION ALL
SELECT HD.Hubspot_Domain_Name, UD18.Umbrella_Domain_Name, UD18.[Rank] FROM Hubspot_Domain_Dedup AS HD INNER JOIN UD18 AS UD18 ON HD.Hubspot_Domain_Name = UD18.Level_5
UNION ALL
SELECT HD.Hubspot_Domain_Name, UD18.Umbrella_Domain_Name, UD18.[Rank] FROM Hubspot_Domain_Dedup AS HD INNER JOIN UD18 AS UD18 ON HD.Hubspot_Domain_Name = UD18.Level_6
UNION ALL
SELECT HD.Hubspot_Domain_Name, UD18.Umbrella_Domain_Name, UD18.[Rank] FROM Hubspot_Domain_Dedup AS HD INNER JOIN UD18 AS UD18 ON HD.Hubspot_Domain_Name = UD18.Level_7
UNION ALL
SELECT HD.Hubspot_Domain_Name, UD18.Umbrella_Domain_Name, UD18.[Rank] FROM Hubspot_Domain_Dedup AS HD INNER JOIN UD18 AS UD18 ON HD.Hubspot_Domain_Name = UD18.Level_8
UNION ALL
SELECT HD.Hubspot_Domain_Name, UD18.Umbrella_Domain_Name, UD18.[Rank] FROM Hubspot_Domain_Dedup AS HD INNER JOIN UD18 AS UD18 ON HD.Hubspot_Domain_Name = UD18.Level_9
UNION ALL
SELECT HD.Hubspot_Domain_Name, UD18.Umbrella_Domain_Name, UD18.[Rank] FROM Hubspot_Domain_Dedup AS HD INNER JOIN UD18 AS UD18 ON HD.Hubspot_Domain_Name = UD18.Level_10
UNION ALL
SELECT HD.Hubspot_Domain_Name, UD18.Umbrella_Domain_Name, UD18.[Rank] FROM Hubspot_Domain_Dedup AS HD INNER JOIN UD18 AS UD18 ON HD.Hubspot_Domain_Name = UD18.Level_11
UNION ALL
SELECT HD.Hubspot_Domain_Name, UD18.Umbrella_Domain_Name, UD18.[Rank] FROM Hubspot_Domain_Dedup AS HD INNER JOIN UD18 AS UD18 ON HD.Hubspot_Domain_Name = UD18.Level_12

--DEDUPLICATE VALUES IN ORDER TO TAKE ONLY THOSE WITH HIGHEST RANK
WITH CTE AS (
SELECT 
	Hubspot_Domain_Name,
	Umbrella_Domain_Name,
	[Rank],
	ROW_NUMBER() OVER(PARTITION BY Hubspot_Domain_Name ORDER BY [Rank]) rnk
FROM UD18_Union
)

INSERT INTO UD18_Union_Dedup
SELECT 
	Hubspot_Domain_Name, 
	Umbrella_Domain_Name, 
	[Rank] 
FROM CTE
WHERE rnk = 1;

---------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------UD_2019-------------------------------------------------------------------

--DELETE SHORT STRINGS
UPDATE UD19 SET Level_1 = NULL WHERE LEN (Level_1)<4;
UPDATE UD19 SET Level_2 = NULL WHERE LEN (Level_2)<4;
UPDATE UD19 SET Level_3 = NULL WHERE LEN (Level_3)<4;
UPDATE UD19 SET Level_4 = NULL WHERE LEN (Level_4)<4;
UPDATE UD19 SET Level_5 = NULL WHERE LEN (Level_5)<4;
UPDATE UD19 SET Level_6 = NULL WHERE LEN (Level_6)<4;
UPDATE UD19 SET Level_7 = NULL WHERE LEN (Level_7)<4;
UPDATE UD19 SET Level_8 = NULL WHERE LEN (Level_8)<4;
UPDATE UD19 SET Level_9 = NULL WHERE LEN (Level_9)<4;
UPDATE UD19 SET Level_10 = NULL WHERE LEN (Level_10)<4;
UPDATE UD19 SET Level_11 = NULL WHERE LEN (Level_11)<4;
UPDATE UD19 SET Level_12 = NULL WHERE LEN (Level_12)<4;

--INSERT ALL MATCHED VALUES INTO ONE UNION TABLE
INSERT INTO UD19_Union
SELECT HD.Hubspot_Domain_Name, UD19.Umbrella_Domain_Name, UD19.[Rank] FROM Hubspot_Domain_Dedup AS HD INNER JOIN UD19 AS UD19 ON HD.Hubspot_Domain_Name = UD19.Level_1
UNION ALL
SELECT HD.Hubspot_Domain_Name, UD19.Umbrella_Domain_Name, UD19.[Rank] FROM Hubspot_Domain_Dedup AS HD INNER JOIN UD19 AS UD19 ON HD.Hubspot_Domain_Name = UD19.Level_2
UNION ALL
SELECT HD.Hubspot_Domain_Name, UD19.Umbrella_Domain_Name, UD19.[Rank] FROM Hubspot_Domain_Dedup AS HD INNER JOIN UD19 AS UD19 ON HD.Hubspot_Domain_Name = UD19.Level_3
UNION ALL
SELECT HD.Hubspot_Domain_Name, UD19.Umbrella_Domain_Name, UD19.[Rank] FROM Hubspot_Domain_Dedup AS HD INNER JOIN UD19 AS UD19 ON HD.Hubspot_Domain_Name = UD19.Level_4
UNION ALL
SELECT HD.Hubspot_Domain_Name, UD19.Umbrella_Domain_Name, UD19.[Rank] FROM Hubspot_Domain_Dedup AS HD INNER JOIN UD19 AS UD19 ON HD.Hubspot_Domain_Name = UD19.Level_5
UNION ALL
SELECT HD.Hubspot_Domain_Name, UD19.Umbrella_Domain_Name, UD19.[Rank] FROM Hubspot_Domain_Dedup AS HD INNER JOIN UD19 AS UD19 ON HD.Hubspot_Domain_Name = UD19.Level_6
UNION ALL
SELECT HD.Hubspot_Domain_Name, UD19.Umbrella_Domain_Name, UD19.[Rank] FROM Hubspot_Domain_Dedup AS HD INNER JOIN UD19 AS UD19 ON HD.Hubspot_Domain_Name = UD19.Level_7
UNION ALL
SELECT HD.Hubspot_Domain_Name, UD19.Umbrella_Domain_Name, UD19.[Rank] FROM Hubspot_Domain_Dedup AS HD INNER JOIN UD19 AS UD19 ON HD.Hubspot_Domain_Name = UD19.Level_8
UNION ALL
SELECT HD.Hubspot_Domain_Name, UD19.Umbrella_Domain_Name, UD19.[Rank] FROM Hubspot_Domain_Dedup AS HD INNER JOIN UD19 AS UD19 ON HD.Hubspot_Domain_Name = UD19.Level_9
UNION ALL
SELECT HD.Hubspot_Domain_Name, UD19.Umbrella_Domain_Name, UD19.[Rank] FROM Hubspot_Domain_Dedup AS HD INNER JOIN UD19 AS UD19 ON HD.Hubspot_Domain_Name = UD19.Level_10
UNION ALL
SELECT HD.Hubspot_Domain_Name, UD19.Umbrella_Domain_Name, UD19.[Rank] FROM Hubspot_Domain_Dedup AS HD INNER JOIN UD19 AS UD19 ON HD.Hubspot_Domain_Name = UD19.Level_11
UNION ALL
SELECT HD.Hubspot_Domain_Name, UD19.Umbrella_Domain_Name, UD19.[Rank] FROM Hubspot_Domain_Dedup AS HD INNER JOIN UD19 AS UD19 ON HD.Hubspot_Domain_Name = UD19.Level_12

--DEDUPLICATE VALUES IN ORDER TO TAKE ONLY THOSE WITH HIGHEST RANK
WITH CTE AS (
SELECT 
	Hubspot_Domain_Name,
	Umbrella_Domain_Name,
	[Rank],
	ROW_NUMBER() OVER(PARTITION BY Hubspot_Domain_Name ORDER BY [Rank]) rnk
FROM UD19_Union
)

INSERT INTO UD19_Union_Dedup
SELECT 
	Hubspot_Domain_Name, 
	Umbrella_Domain_Name, 
	[Rank] 
FROM CTE
WHERE rnk = 1;

---------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------FINAL_TABLE-----------------------------------------------------------------

--EXACT MATCH - INSERT
INSERT INTO Hubspot_Domain_Final (Hubspot_Name,Hubspot_Domain_Name,Umbrella_Domain_Name,UD17_Rank,UD18_Rank,UD19_Rank,Match_Type)
SELECT
	HD.Hubspot_Domain_Name,
	HD.Hubspot_Original_Name,
	COALESCE(UD17.Umbrella_Domain_Name,UD18.Umbrella_Domain_Name,UD19.Umbrella_Domain_Name) AS "Umbrella_Domain_Name",
	UD17.[Rank] AS "UD17_Rank",
	UD18.[Rank] AS "UD17_Rank",
	UD19.[Rank] AS "UD17_Rank",
	CASE WHEN COALESCE(UD17.Umbrella_Domain_Name,UD18.Umbrella_Domain_Name,UD19.Umbrella_Domain_Name) IS NOT NULL THEN 'Exact' ELSE NULL END AS "Match_Type"
FROM Hubspot_Domain AS HD
LEFT JOIN UD17 AS UD17 ON HD.Hubspot_Original_Name = UD17.Umbrella_Domain_Name
LEFT JOIN UD18 AS UD18 ON HD.Hubspot_Original_Name = UD18.Umbrella_Domain_Name
LEFT JOIN UD19 AS UD19 ON HD.Hubspot_Original_Name = UD19.Umbrella_Domain_Name

--APROXIMATE MATCH - UPDATE (UD17)
UPDATE HD
SET HD.Umbrella_Domain_Name = UD17.Umbrella_Domain_Name,
	HD.UD17_Rank = UD17.[Rank],
	HD.Match_Type = 'Approximate'
FROM Hubspot_Domain_Final AS HD
INNER JOIN UD17_Union_Dedup AS UD17
ON HD.Hubspot_Name = UD17.Hubspot_Domain_Name
WHERE HD.Match_Type IS NULL OR HD.Match_Type = 'Approximate'

--APROXIMATE MATCH - UPDATE (UD18)
UPDATE HD
SET HD.Umbrella_Domain_Name = UD18.Umbrella_Domain_Name,
	HD.UD18_Rank = UD18.[Rank],
	HD.Match_Type = 'Approximate'
FROM Hubspot_Domain_Final AS HD
INNER JOIN UD18_Union_Dedup AS UD18
ON HD.Hubspot_Name = UD18.Hubspot_Domain_Name
WHERE HD.Match_Type IS NULL OR HD.Match_Type = 'Approximate'

--APROXIMATE MATCH - UPDATE (UD19)
UPDATE HD
SET HD.Umbrella_Domain_Name = UD19.Umbrella_Domain_Name,
	HD.UD19_Rank = UD19.[Rank],
	HD.Match_Type = 'Approximate'
FROM Hubspot_Domain_Final AS HD
INNER JOIN UD19_Union_Dedup AS UD19
ON HD.Hubspot_Name = UD19.Hubspot_Domain_Name
WHERE HD.Match_Type IS NULL OR HD.Match_Type = 'Approximate'
