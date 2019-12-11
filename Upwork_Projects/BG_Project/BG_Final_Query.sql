--In order to distribute all records within a regular weekly period -> I used two CTE's.
WITH RECURSIVE

--"Calculation CTE" is shortening the period between State_1 and State_2 about one day from each side -> As these days shouldn't be included in the backlog.
--In case the difference between State_1 and State_2 is more then 14 days or State_2 is null -> State_2 is equal to State_1 + 14 days -> Which represents the longest period in backlog.
Calculation AS (
SELECT 
	"ID",
	"State_1",
	"State_2",
	"State_1"::timestamp + interval '1day' AS "Cal_State_1",
	(CASE 	
		WHEN DATE_PART('day',"State_2"::timestamp - "State_1"::timestamp)-1 > 14 OR "State_2" IS NULL
		THEN "State_1" + interval '14days'
		ELSE "State_2" - interval '1day'
	END)::timestamp AS "Cal_State_2"
FROM public."BG_Data"
),

--"Weeks RECURSIVE CTE" is distributing the original periods within regular weeks -> In order to calculate the final average backlog per week.
--"1st SELECT" -> Considers only records which stayed at least one day in backlog.
--"2nd SELECT" -> Brings extra records only in case the original period is going through more than one week.
--"1st & 2nd SELECT" -> In case the end of the week is smaller then State_2 the end of the week is set as the State_2 or the opposite.
Weeks AS (
SELECT  
	"ID",
	"Cal_State_1",
	CASE WHEN date_trunc('week', "Cal_State_1")+ interval '6days' > "Cal_State_2"
			THEN "Cal_State_2" 
			ELSE date_trunc('week', "Cal_State_1")+ interval '6days' 
	END AS "Cal_State_2",
	"Cal_State_2" as "Cal_State_2_End"
FROM Calculation
WHERE DATE_PART('day',"Cal_State_2" - "Cal_State_1") >= 0
UNION ALL
SELECT
	"ID",
	"Cal_State_2" + interval '1day' as "Cal_State_1",
	CASE WHEN "Cal_State_2" + interval '1week' < "Cal_State_2_End" 
			THEN "Cal_State_2" + interval '1week'
			ELSE "Cal_State_2_End" 
	END AS "Cal_State_2",
	"Cal_State_2_End"
FROM Weeks
WHERE "Cal_State_2" < "Cal_State_2_End"
)

--"Final SELECT" -> Groups average backlog counts by the (previously distributed) State_1 start week.
SELECT 
	(date_trunc('week', "Cal_State_1"))::date AS week, 
	ROUND((AVG(DATE_PART('day',"Cal_State_2" - "Cal_State_1")+1))::numeric,1) AS backlog
FROM Weeks
GROUP BY (date_trunc('week', "Cal_State_1"))::date
ORDER BY (date_trunc('week', "Cal_State_1"))::date;
