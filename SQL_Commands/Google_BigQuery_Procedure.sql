CREATE OR REPLACE PROCEDURE `voreldata.PROC_BQ`()
BEGIN

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------- RAW DATA TABLE --------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Check if table BQ_RawData already esists, if yes -> Drop the table

IF (SELECT COUNT(1) FROM voreldata.__TABLES__ WHERE table_id='BQ_RawData') != 0 THEN
  DROP TABLE `voreldata.BQ_RawData`;
END IF;

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Create partitioned BQ_RawData table in order to be able access it via Data Studio

CREATE TABLE `voreldata.BQ_RawData`
PARTITION BY campaign
CLUSTER BY instance_id
AS SELECT 
	region,
	top_bottom,
	loc_id,
	location_name,
	address_1,
	address_2,
	city,
	county,
	state_region,
	postal_code,
	country_code,
	instance_id,
	client_name,
	industry,
	industry_2,
	industry_3,
	survey_title,
	survey_family,
	IF(LOWER(section_level_1) LIKE 'nps%','NPS',IF(LOWER(section_level_1) LIKE 'fashion stylist%','Fashion Stylist',TRIM(REGEXP_REPLACE(section_level_1, r'([^\p{ASCII}+])', '')))) AS section_level_1,
	section_level_2,
	section_level_3,
	question_category_1,
	question_category_2,
	question_category_3,
	question_text,
	question_comment,
	sales_asc_name,
	answer_text,
	shopper_login,
	shopper_name,
	campaign,
	year_month,
	year,
	month,
	date,
	time,
	quarter,
	hour_by_1_hour,
	hour_by_2_hours,
	hour_by_3_hours,
	hour_by_4_hours,
	hour_by_6_hours,
	pts,
	pts_of,
	count_neg,
	caq
FROM `voreldata.SRC_RawData`;

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------- DATASCORE TABLE -------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Check if table BQ_DataScore already esists, if yes -> Drop the table

IF (SELECT COUNT(1) FROM voreldata.__TABLES__ WHERE table_id='BQ_DataScore') != 0 THEN
  DROP TABLE `voreldata.BQ_DataScore`;
END IF;

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Create temporary initial aggregation for following BQ_DataScore table calculations

CREATE TEMP TABLE BQ_Agg AS
SELECT

	/* Baseline columns used in Datascore table*/
	NULL AS custome_properties_1,
	NULL AS custome_properties_2,
	NULL AS custome_properties_3,
	RD.region AS custome_properties_4,
	RD.top_bottom AS custome_properties_5,
	RD.loc_id AS loc_id,
	RD.location_name AS location_name,
	address_1 AS address_1,
	address_2 AS address_2,
	city AS city,
	county AS county,
	state_region AS state,
	postal_code AS postal_code,
	RD.country_code AS country_code,
	instance_id AS instance_id,
	client_name AS client_name,
	industry AS industry_1,
	industry_2 AS industry_2,
	industry_3 AS industry_3,
	survey_title AS survey_title,
	survey_family AS survey_family,
	question_category_1 AS question_category_1,
	question_category_2 AS question_category_2,
	question_category_3 AS question_category_3,
	sales_asc_name AS sales_asc_name,
	shopper_login AS shopper_login,
	shopper_name AS shopper_name,
	campaign AS campaign,
	year_month AS year_month,
	year AS year,
	month AS month,
	date AS date,
	time AS time,
	quarter AS quarter,
	hour_by_1_hour AS hour_by_1_hour,
	hour_by_2_hours AS hour_by_2_hours,
	hour_by_3_hours AS hour_by_3_hours,
	hour_by_4_hours AS hour_by_4_hours,
	hour_by_6_hours AS hour_by_6_hours,
	SUM(pts) AS sum_pts,
	SUM(pts_of)AS sum_pts_of,
	
	/* Extra column to distinguish what Config values should be used for RT-Score calculations - not used in Datascore table*/
	IF (campaign >= '2019-02-01','201902','201606') AS from_date,
	
	/* Extra calculated columns to calculate RT-Score - also used in Datascore table*/
	IF(RD.country_code='SA','SA','Other') AS variable_1,
	LC.top_bottom AS variable_2,
	IF(survey_title LIKE '%Refund%','Refund',IF(survey_title LIKE '%Purchase%','Purchase','')) AS variable_3,
	CONCAT(CAST(year AS STRING),'-Q',CAST(quarter AS STRING)) AS quarter_report,
	TRIM(SUBSTR(client_name,0,LENGTH(client_name)-5)) AS client,
	
	/* Extra aggregated columns to calculate RT-Score - also used in Datascore table*/
	SAFE_CAST(STRING_AGG(IF(question_text = 'NPS',answer_text,NULL), '+') AS NUMERIC) AS nps,
	SAFE_CAST(STRING_AGG(IF(question_text = 'Accessibility',answer_text,NULL), '+') AS NUMERIC) AS accessibility,
	SAFE_CAST(STRING_AGG(IF(question_text = 'Attractiveness',answer_text,NULL), '+') AS NUMERIC) AS attractiveness,
	SAFE_CAST(STRING_AGG(IF(question_text = 'Authenticity',answer_text,NULL), '+') AS NUMERIC) AS authenticity,
	SAFE_CAST(STRING_AGG(IF(question_text = 'Comfort',answer_text,NULL), '+') AS NUMERIC) AS comfort,
	SAFE_CAST(STRING_AGG(IF(question_text = 'Courteousy',answer_text,NULL), '+') AS NUMERIC) AS courteousy,
	SAFE_CAST(STRING_AGG(IF(question_text = 'Helpfullness',answer_text,NULL), '+') AS NUMERIC) AS helpfullness,
	SAFE_CAST(STRING_AGG(IF(question_text = 'Knowledge',answer_text,NULL), '+') AS NUMERIC) AS knowledgeveness,
	SAFE_CAST(STRING_AGG(IF(question_text = 'Passion',answer_text,NULL), '+') AS NUMERIC) AS passion,
	SAFE_CAST(STRING_AGG(IF(question_text = 'Pleasure',answer_text,NULL), '+') AS NUMERIC) AS pleasure,
	SAFE_CAST(STRING_AGG(IF(question_text = 'Privacy',answer_text,NULL), '+') AS NUMERIC) AS privacy,
	SAFE_CAST(STRING_AGG(IF(question_text = 'Respect',answer_text,NULL), '+') AS NUMERIC) AS `respect`,
	SAFE_CAST(STRING_AGG(IF(question_text = 'Safety',answer_text,NULL), '+') AS NUMERIC) AS safety,
	SAFE_CAST(STRING_AGG(IF(question_text = 'Satisfaction',answer_text,NULL), '+') AS NUMERIC) AS satisfaction,
	SAFE_CAST(STRING_AGG(IF(question_text = 'Transparency',answer_text,NULL), '+') AS NUMERIC) AS transparency,
	SAFE_CAST(STRING_AGG(IF(question_text = 'Trust',answer_text,NULL), '+') AS NUMERIC) AS trust,
	SAFE_CAST(STRING_AGG(IF(question_text = 'Uniqueness',answer_text,NULL), '+') AS NUMERIC) AS uniqueness,
	
	/* Extra columns helping to calculate the RT-Score - not used in Datascore table*/
	SUM(IF(section_level_1 = 'Exterior Cleanliness',pts,0)) AS pts_exterior_cleanliness,
	SUM(IF(section_level_1 = 'Interior Presentation',pts,0)) AS pts_interior_presentation,
	SUM(IF(section_level_1 = 'Employees Presentation',pts,0)) AS pts_employees_presentation,
	SUM(IF(section_level_1 = 'Customer Service',pts,0)) AS pts_customer_service,
	SUM(IF(section_level_1 = 'Fitting Room',pts,0)) AS pts_fitting_room,
	SUM(IF(section_level_1 = 'Cashier',pts,0)) AS pts_cashier,
	SUM(IF(section_level_1 = 'Refund',pts,0)) AS pts_refund,
	SUM(IF(section_level_1 = 'Exterior Cleanliness',pts_of,0)) AS pts_of_exterior_cleanliness,
	SUM(IF(section_level_1 = 'Interior Presentation',pts_of,0)) AS pts_of_interior_presentation,
	SUM(IF(section_level_1 = 'Employees Presentation',pts_of,0)) AS pts_of_employees_presentation,
	SUM(IF(section_level_1 = 'Customer Service',pts_of,0)) AS pts_of_customer_service,
	SUM(IF(section_level_1 = 'Fitting Room',pts_of,0)) AS pts_of_fitting_room,
	SUM(IF(section_level_1 = 'Cashier',pts_of,0)) AS pts_of_cashier,
	SUM(IF(section_level_1 = 'Refund',pts_of,0)) AS pts_of_refund,
	
	/* Extra columns helping to calculate the Last Columns - not used in Datascore table*/
	SUM(IF(section_level_1 = 'Overall Rating',pts,0)) AS pts_overall_rating,
	SUM(IF(section_level_1 = 'Fashion Stylist',pts,0)) AS pts_fashion_stylist,
	SUM(IF(section_level_1 = 'Mobile App',pts,0)) AS pts_mobile_app,
	SUM(IF(section_level_1 = 'GWR Emotions Index',pts,0)) AS pts_emotions_index,
	SUM(IF(section_level_1 = 'NPS',pts,0)) AS pts_nps,
	SUM(IF(section_level_1 = 'Overall Rating',pts_of,0)) AS pts_of_overall_rating,
	SUM(IF(section_level_1 = 'Fashion Stylist',pts_of,0)) AS pts_of_fashion_stylist,
	SUM(IF(section_level_1 = 'Mobile App',pts_of,0)) AS pts_of_mobile_app,
	SUM(IF(section_level_1 = 'GWR Emotions Index',pts_of,0)) AS pts_of_emotions_index,
	SUM(IF(section_level_1 = 'NPS',pts_of,0)) AS pts_of_nps

FROM `voreldata.BQ_RawData` AS RD
LEFT JOIN `voreldata.SRC_LocConfig` AS LC
ON RD.loc_id = LC.loc_id
WHERE instance_id IS NOT NULL
GROUP BY 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,42,43,44,45,46,47
ORDER BY instance_id;

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Create temporary BQ_RtScore table necessary for following BQ_DataScore table calculations 

CREATE TEMP TABLE BQ_RtScore AS
SELECT
	instance_id,
	ROUND(IFNULL(pct_exterior_cleanliness,0),4) AS pct_exterior_cleanliness,
	ROUND(IFNULL(pct_interior_presentation,0),4) AS pct_interior_presentation,
	ROUND(IFNULL(pct_employees_presentation,0),4) AS pct_employees_presentation,
	ROUND(IFNULL(pct_customer_service,0),4) AS pct_customer_service,
	ROUND(IFNULL(pct_fitting_room,0),4) AS pct_fitting_room,
	ROUND(IFNULL(pct_cashier,0),4) AS pct_cashier,
	ROUND(IFNULL(pct_refund,0),4) AS pct_refund,
	ROUND(IFNULL(total_exterior_cleanliness,0),4) AS total_exterior_cleanliness,
	ROUND(IFNULL(total_interior_presentation,0),4) AS total_interior_presentation,
	ROUND(IFNULL(total_employees_presentation,0),4) AS total_employees_presentation,
	ROUND(IFNULL(total_customer_service,0),4) AS total_customer_service,
	ROUND(IFNULL(total_fitting_room,0),4) AS total_fitting_room,
	ROUND(IFNULL(total_cashier,0),4) AS total_cashier,
	ROUND(IFNULL(total_refund,0),4) AS total_refund,
	ROUND(CAST(SAFE_DIVIDE(
		IFNULL(total_exterior_cleanliness,0)+IFNULL(total_interior_presentation,0)+IFNULL(total_employees_presentation,0)+IFNULL(total_customer_service,0)+IFNULL(total_fitting_room,0)+IFNULL(total_cashier,0)+IFNULL(total_refund,0),
		IFNULL(exterior_cleanliness,0)+IFNULL(interior_presentation,0)+IFNULL(employees_presentation,0)+IFNULL(customer_service,0)+IFNULL(fitting_room,0)+IFNULL(cashier,0)+IFNULL(refund,0)) AS NUMERIC),4) AS total
FROM (
	SELECT
		A.instance_id,
		C.exterior_cleanliness,
		C.interior_presentation,
		C.employees_presentation,
		C.customer_service,
		C.fitting_room,
		C.cashier,
		C.refund,
		CAST(SAFE_DIVIDE(SAFE_DIVIDE(A.pts_exterior_cleanliness,A.pts_of_exterior_cleanliness)*C.exterior_cleanliness,C.exterior_cleanliness) AS NUMERIC) AS pct_exterior_cleanliness,
		CAST(SAFE_DIVIDE(SAFE_DIVIDE(A.pts_interior_presentation,A.pts_of_interior_presentation)*C.interior_presentation,C.interior_presentation) AS NUMERIC) AS pct_interior_presentation,
		CAST(SAFE_DIVIDE(SAFE_DIVIDE(A.pts_employees_presentation,A.pts_of_employees_presentation)*C.employees_presentation,C.employees_presentation) AS NUMERIC) AS pct_employees_presentation,
		CAST(SAFE_DIVIDE(SAFE_DIVIDE(A.pts_customer_service,A.pts_of_customer_service)*C.customer_service,C.customer_service) AS NUMERIC) AS pct_customer_service,
		CAST(SAFE_DIVIDE(SAFE_DIVIDE(A.pts_fitting_room,A.pts_of_fitting_room)*C.fitting_room,C.fitting_room) AS NUMERIC) AS pct_fitting_room,
		CAST(SAFE_DIVIDE(SAFE_DIVIDE(A.pts_cashier,A.pts_of_cashier)*C.cashier,C.cashier) AS NUMERIC) AS pct_cashier,
		CAST(SAFE_DIVIDE(SAFE_DIVIDE(A.pts_refund,A.pts_of_refund)*C.refund,C.refund) AS NUMERIC) AS pct_refund,		
		CAST(SAFE_DIVIDE(A.pts_exterior_cleanliness,A.pts_of_exterior_cleanliness)*C.exterior_cleanliness AS NUMERIC) AS total_exterior_cleanliness,
		CAST(SAFE_DIVIDE(A.pts_interior_presentation,A.pts_of_interior_presentation)*C.interior_presentation AS NUMERIC) AS total_interior_presentation,
		CAST(SAFE_DIVIDE(A.pts_employees_presentation,A.pts_of_employees_presentation)*C.employees_presentation AS NUMERIC) AS total_employees_presentation,
		CAST(SAFE_DIVIDE(A.pts_customer_service,A.pts_of_customer_service)*C.customer_service AS NUMERIC) AS total_customer_service,
		CAST(SAFE_DIVIDE(A.pts_fitting_room,A.pts_of_fitting_room)*C.fitting_room AS NUMERIC) AS total_fitting_room,
		CAST(SAFE_DIVIDE(A.pts_cashier,A.pts_of_cashier)*C.cashier AS NUMERIC) AS total_cashier,
		CAST(SAFE_DIVIDE(A.pts_refund,A.pts_of_refund)*C.refund AS NUMERIC) AS total_refund
	FROM BQ_Agg AS A
	LEFT JOIN `voreldata.SRC_Config` AS C
	ON A.variable_1 = C.country
	AND A.variable_3 = C.type
	AND A.from_date = C.from_date) AS RT_SCORE
ORDER BY instance_id;

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Create final BQ_DataScore table with all calculations included

CREATE TABLE `voreldata.BQ_DataScore` AS
SELECT
	DS.custome_properties_1,
	DS.custome_properties_2,
	DS.custome_properties_3,
	DS.custome_properties_4,
	DS.custome_properties_5,
	DS.loc_id,
	DS.location_name,
	DS.address_1,
	DS.address_2,
	DS.city,
	DS.county,
	DS.state,
	DS.postal_code,
	DS.country_code,
	DS.instance_id,
	DS.client_name,
	DS.industry_1,
	DS.industry_2,
	DS.industry_3,
	DS.survey_title,
	DS.survey_family,
	DS.question_category_1,
	DS.question_category_2,
	DS.question_category_3,
	DS.sales_asc_name,
	DS.shopper_login,
	DS.shopper_name,
	DS.campaign,
	DS.year_month,
	DS.year,
	DS.month,
	DS.date,
	DS.time,
	DS.quarter,
	DS.hour_by_1_hour,
	DS.hour_by_2_hours,
	DS.hour_by_3_hours,
	DS.hour_by_4_hours,
	DS.hour_by_6_hours,
	DS.sum_pts,
	DS.sum_pts_of,
	DS.score,
	DS.nps,
	DS.nps_category,
	DS.average_ei,
	IF(DS.average_ei IS NULL,NULL,IF(DS.average_ei<5,'Dissatisfied',IF(DS.average_ei<7,'Indifferent',IF(DS.average_ei<9,'Satisfied','Engaged')))) AS ei,
	DS.accessibility,
	DS.attractiveness,
	DS.authenticity,
	DS.comfort,
	DS.courteousy,
	DS.helpfullness,
	DS.knowledgeveness,
	DS.passion,
	DS.pleasure,
	DS.privacy,
	DS.`respect`,
	DS.safety,
	DS.satisfaction,
	DS.transparency,
	DS.trust,
	DS.uniqueness,
	DS.variable_1,
	DS.variable_2,
	DS.variable_3,
	DS.quarter_report,
	DS.client,
	DS.exterior_cleanliness,
	DS.interior_presentation,
	DS.employees_presentation,
	DS.customer_service,
	DS.fitting_room,
	DS.cashier,
	DS.refund,
	DS.overall_rating,
	DS.fashion_stylist,
	DS.mobile_app,
	DS.emotions_index,
	DS.nps_br_nps
FROM (
	SELECT
		A.*,
		RS.total AS score,
		IF(A.nps<7,'Detractors',IF(A.nps<9,'Passives','Promoters')) AS nps_category,
		ROUND(CAST(SAFE_DIVIDE((
			IFNULL(A.accessibility,0)+
			IFNULL(A.attractiveness,0)+
			IFNULL(A.authenticity,0)+
			IFNULL(A.comfort,0)+
			IFNULL(A.courteousy,0)+
			IFNULL(A.helpfullness,0)+
			IFNULL(A.knowledgeveness,0)+
			IFNULL(A.passion,0)+
			IFNULL(A.pleasure,0)+
			IFNULL(A.privacy,0)+
			IFNULL(A.`respect`,0)+
			IFNULL(A.safety,0)+
			IFNULL(A.satisfaction,0)+
			IFNULL(A.transparency,0)+
			IFNULL(A.trust,0)+
			IFNULL(A.uniqueness,0)
		),(
			IF(A.accessibility IS NULL,0,1)+
			IF(A.attractiveness IS NULL,0,1)+
			IF(A.authenticity IS NULL,0,1)+
			IF(A.comfort IS NULL,0,1)+
			IF(A.courteousy IS NULL,0,1)+
			IF(A.helpfullness IS NULL,0,1)+
			IF(A.knowledgeveness IS NULL,0,1)+
			IF(A.passion IS NULL,0,1)+
			IF(A.pleasure IS NULL,0,1)+
			IF(A.privacy IS NULL,0,1)+
			IF(A.`respect` IS NULL,0,1)+
			IF(A.safety IS NULL,0,1)+
			IF(A.satisfaction IS NULL,0,1)+
			IF(A.transparency IS NULL,0,1)+
			IF(A.trust IS NULL,0,1)+
			IF(A.uniqueness IS NULL,0,1)
		)) AS NUMERIC),2) AS average_ei,
		RS.pct_exterior_cleanliness AS exterior_cleanliness,
		RS.pct_interior_presentation AS interior_presentation,
		RS.pct_employees_presentation AS employees_presentation,
		RS.pct_customer_service AS customer_service,
		RS.pct_fitting_room AS fitting_room,
		RS.pct_cashier AS cashier,
		RS.pct_refund AS refund,
		CAST(SAFE_DIVIDE(A.pts_overall_rating,A.pts_of_overall_rating) AS NUMERIC) AS overall_rating,
		CAST(SAFE_DIVIDE(A.pts_fashion_stylist,A.pts_of_fashion_stylist) AS NUMERIC) AS fashion_stylist,
		CAST(SAFE_DIVIDE(A.pts_mobile_app,A.pts_of_mobile_app) AS NUMERIC) AS mobile_app,
		CAST(SAFE_DIVIDE(A.pts_emotions_index,A.pts_of_emotions_index) AS NUMERIC) AS emotions_index,
		CAST(SAFE_DIVIDE(A.pts_nps,A.pts_of_nps) AS NUMERIC) AS nps_br_nps
	FROM BQ_Agg AS A
	LEFT JOIN BQ_RtScore AS RS
	ON A.instance_id = RS.instance_id) AS DS
ORDER BY DS.instance_id;

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------- RA TABLE -----------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Check if table BQ_Ra already esists, if yes -> Drop the table

IF (SELECT COUNT(1) FROM voreldata.__TABLES__ WHERE table_id='BQ_Ra') != 0 THEN
  DROP TABLE `voreldata.BQ_Ra`;
END IF;

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Create initial aggregation for BQ_Ra table calculations 

CREATE TEMP TABLE BQ_RaAgg AS
SELECT *
FROM (
  SELECT
    RD.instance_id,
    RD.campaign,
    RD.country_code,
    RD.section_level_1,
    RD.question_text,
    SUM(RD.pts) AS pts,
    COUNT(RD.pts) OVER (PARTITION BY RD.campaign,RD.country_code,RD.section_level_1,RD.question_text) AS count_pts,
    SUM(RD.pts) OVER (PARTITION BY RD.campaign,RD.country_code,RD.section_level_1,RD.question_text) AS sum_pts,
    AVG(DS.score) AS score,
    AVG(DS.nps) AS nps,
	AVG(DS.average_ei) AS average_ei
  FROM `voreldata.BQ_RawData` AS RD
  LEFT JOIN `voreldata.BQ_DataScore` AS DS
  ON RD.instance_id=DS.instance_id
  GROUP BY RD.instance_id,RD.campaign,RD.country_code,RD.section_level_1,RD.question_text,RD.pts) AS EF
WHERE sum_pts > 0
ORDER BY instance_id;

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Create final BQ_Ra table with all calculations included

CREATE TABLE `voreldata.BQ_Ra` AS
SELECT 
  campaign,
  country_code,
  section_level_1,
  question_text,
  CAST(neg AS INT64) AS neg,
  CAST(applicability AS INT64) AS applicability,
  CAST(ef AS NUMERIC) AS ef,
  CAST(IF(IS_NAN(s_vs_q),NULL,s_vs_q) AS NUMERIC) AS s_vs_q,
  CAST(IF(IS_NAN(nps_vs_q),NULL,nps_vs_q) AS NUMERIC) AS nps_vs_q,
  CAST(IF(IS_NAN(ei_vs_q),NULL,ei_vs_q) AS NUMERIC) AS ei_vs_q
FROM (
  SELECT 
    campaign,
    country_code,
    section_level_1,
    question_text,
    AVG(count_pts)-AVG(sum_pts) AS neg,
    AVG(count_pts) AS applicability,
    ROUND(SAFE_DIVIDE(AVG(count_pts)-AVG(sum_pts),AVG(count_pts)),2) AS ef,
    ROUND(CORR(pts,score),2) AS s_vs_q,
    ROUND(CORR(pts,nps),2) AS nps_vs_q,
	ROUND(CORR(pts,average_ei),2) AS ei_vs_q
  FROM BQ_RaAgg
  GROUP BY campaign,country_code,section_level_1,question_text
  ORDER BY campaign,country_code,section_level_1,question_text) AS RA
WHERE neg > 0;

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
END;