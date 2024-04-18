--median order value of each month in the current year and selecting any months where the median order value was below a certain threshold
SELECT 
	OrderMonth,
	MedianOrderValue
FROM (SELECT 
	DISTINCT(MONTH(OrderDate)) AS OrderMonth,
	PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY TotalDue) OVER (PARTITION BY MONTH(OrderDate)) AS MedianOrderValue
FROM 
	Sales.SalesOrderHeader
WHERE 
	YEAR(OrderDate) = 2014
) AS Subquery
WHERE
	MedianOrderValue < 300
ORDER BY 
	OrderMonth
