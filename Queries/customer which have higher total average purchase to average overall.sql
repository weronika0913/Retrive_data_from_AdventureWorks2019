--selecting customer which have higher total average purchase to average overall
WITH AvgOrder AS(
	Select	
		CustomerID,
		AVG(TotalDue) AS AvgOrderValue,
		AVG(TotalDue) OVER () AS OverallAvgOrderValue
	FROM 
		Sales.SalesOrderHeader
	GROUP BY	
		CustomerID,
		TotalDue
)

SELECT	
	CustomerID,
	CAST(AvgOrderValue AS DECIMAL (18,2)) AS AvgOrderValue,
	CAST(OverallAvgOrderValue AS DECIMAL (18,2)) ASOverallAvgOrderValue
FROM 
	AvgOrder
WHERE 
	AvgOrderValue > OverallAvgOrderValue
