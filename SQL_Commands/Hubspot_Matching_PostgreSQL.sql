--Check Loaded Data
SELECT * FROM public."Hubspot_Domain";
SELECT * FROM public."Umbrella_Domain_2017";
SELECT * FROM public."Umbrella_Domain_2018";
SELECT * FROM public."Umbrella_Domain_2019";

--Check Counts
SELECT COUNT(*) FROM public."Hubspot_Domain";
SELECT COUNT(DISTINCT "Umbrella_Domain_Name") FROM public."Umbrella_Domain_2017";
SELECT COUNT(*) FROM public."Umbrella_Domain_2018";
SELECT COUNT(*) FROM public."Umbrella_Domain_2019";

--Check Duplicates
WITH CTE AS (
SELECT 
	"Umbrella_Domain_Name", 
	ROW_NUMBER() OVER(PARTITION BY "Umbrella_Domain_Name" ORDER BY "Rank") rnk
FROM public."Umbrella_Domain_2019"
)
SELECT * FROM CTE
WHERE rnk > 1

--FINAL QUERY
SELECT
	HD."Hubspot_Domain_Name" AS "Hubspot Domain",
	Coalesce(UD2017."Umbrella_Domain_Name",UD2018."Umbrella_Domain_Name",UD2019."Umbrella_Domain_Name") AS "Umbrella Domain",
	UD2019."Rank" AS "Rank 06/09/2019",
	UD2018."Rank" AS "Rank 06/09/2018",
	UD2017."Rank" AS "Rank 06/08/2017"
FROM public."Hubspot_Domain" AS HD
LEFT JOIN public."Umbrella_Domain_2017" AS UD2017 ON HD."Hubspot_Domain_Name" = UD2017."Umbrella_Domain_Name"
LEFT JOIN public."Umbrella_Domain_2018" AS UD2018 ON HD."Hubspot_Domain_Name" = UD2018."Umbrella_Domain_Name"
LEFT JOIN public."Umbrella_Domain_2019" AS UD2019 ON HD."Hubspot_Domain_Name" = UD2019."Umbrella_Domain_Name"
WHERE Coalesce(UD2017."Umbrella_Domain_Name",UD2018."Umbrella_Domain_Name",UD2019."Umbrella_Domain_Name") IS NOT NULL;

