--extracting total sales by product category for each month
SELECT 
	DISTINCT(MONTH(SOH.OrderDate)) AS Month,
	PC.Name,
	CAST(SUM(SOD.UnitPrice) OVER(PARTITION BY PC.Name,MONTH(SOH.OrderDate)) AS DECIMAL (18,2)) AS TotalSalesPerCategory
FROM 
	Sales.SalesOrderDetail AS SOD
LEFT JOIN
	Production.Product AS P
ON SOD.ProductID = P.ProductID
LEFT JOIN 
	Sales.SalesOrderHeader AS SOH
ON SOD.SalesOrderID = SOH.SalesOrderID
LEFT JOIN 
	Production.ProductSubCategory AS PSC
ON P.ProductSubcategoryID = PSC.ProductSubcategoryID
LEFT JOIN
	Production.ProductCategory AS PC
ON PC.ProductCategoryID = PSC.ProductCategoryID
ORDER BY 
	Month ASC,
	PC.Name DESC
