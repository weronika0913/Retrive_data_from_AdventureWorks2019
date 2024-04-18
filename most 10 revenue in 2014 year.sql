-- top 10 products with most revenue in current quarter
SELECT 
		ProductID,
		CAST(Revenue AS DECIMAL(18,2)) AS Revenue,
		Rank
FROM 
		(SELECT TOP	10
				ProductID,
				SUM(LineTotal) AS Revenue,
				RANK() OVER (ORDER BY SUM(LineTotal) DESC) AS RANK
		FROM
			Sales.SalesOrderDetail AS SOD
		JOIN 
			Sales.SalesOrderHeader AS SOH ON SOD.SalesOrderID = SOH.SalesOrderID
		WHERE 
			DATEPART(QUARTER, SOH.OrderDate) = DATEPART(QUARTER, GETDATE())
		GROUP BY
				ProductID) AS Subquery;
