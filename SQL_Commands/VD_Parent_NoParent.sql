DECLARE @PromptLegacy smallint = 0;

SELECT  
	d.ShortDescription,
	d.MonthSortCode,
	c.RegionID,
	c.CountryID,
	m.MetricID,
	m.MetricName,
	m.Target,
	[In] = SUM(f.[In]),
	Total = CASE WHEN m.MetricID = 10004 THEN AVG(f.Total) ELSE SUM(f.Total) END,
	Value =
		CASE WHEN m.MetricID IN (10003,10005,10013,10015,10016,10017)
			THEN SUM(f.Value)
			ELSE CAST(SUM(f.[In]) AS FLOAT) / CASE WHEN m.MetricID = 10004 THEN AVG(f.Total) ELSE SUM(f.Total) END
		END
FROM [VD].[dbo].[VD_Month12m] d
CROSS JOIN [VR].[dbo].[VR_Dashboard_Country_Dim] c
CROSS JOIN [VR].[dbo].[VR_Dashboard_Metric_Dim] m
LEFT JOIN [VR].[dbo].[Dashboard_Data_Fact] f
	ON f.MonthDateTime = d.ReportingMonth
	AND f.CountryID = c.CountryID
	AND f.MetricID = m.MetricID
	AND CASE WHEN @PromptLegacy = 0 THEN f.LegacyFlag ELSE 0 END = 0
-- Union automatic for Country users / otherwise will be excluded								
LEFT JOIN [VR].[dbo].[MetricDataInput] inp 
	ON inp.CountryCD = c.CountryID
	AND inp.MetricID = m.MetricID
	AND d.ReportingMonth between inp.ValidFrom and isnull(inp.ValidTo,GETDATE())
-- Joining comments for all fields												
LEFT JOIN [VR].[dbo].[PackMonthly] com
	ON c.CountryID = com.CountryID
	AND m.MetricID = com.MetricID
	AND d.ReportingMonth = com.MonthDate												
WHERE m.MetricID IN (10000) 
GROUP BY
	d.ShortDescription,
	d.MonthSortCode,
	c.RegionID,
	c.RegionName,
	c.ClusterCode,
	c.ClusterName,
	c.ClusterSortOrder,
	c.CountryID,
	c.CountryName,
	c.Flag,
	m.MetricID,
	m.MetricName,
	m.DisplaySortKey,
	m.ValueType,
	m.Target,
	m.TgtDisplay,
	m.MetricDetailsInd,
	com.Comment,
	f.MonthDateTime,
	inp.DataInputName
