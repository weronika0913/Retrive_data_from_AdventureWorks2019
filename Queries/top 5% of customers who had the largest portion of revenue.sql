--customers with total spend for the current year and the 5% of identified customers who generate the largest share of revenue
SELECT 
	CustomerID,
	TotalSpending,
	CustomerRank
FROM
	(SELECT 
		CustomerID,
		CAST(SUM(TotalDue) AS DECIMAL (18,2))AS TotalSpending,
		RANK() OVER (ORDER BY SUM(TotalDue) DESC) AS CustomerRank

	FROM	
		Sales.SalesOrderHeader
	WHERE
		YEAR(OrderDate) = 2014
	GROUP BY 
		CustomerID) AS TotalSpending
WHERE CustomerRank <=
		(SELECT
			CEILING(0.05 * COUNT(DISTINCT(CustomerID)))
		FROM 
			Sales.SalesOrderHeader
		WHERE 
			YEAR(OrderDate) = 2014)
