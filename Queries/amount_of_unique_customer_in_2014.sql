-- amount of unique customer in 2014 year
WITH UniqueCustomers AS (
    SELECT 
        CustomerID,
        ROW_NUMBER() OVER (PARTITION BY CustomerID ORDER BY OrderDate) AS RowNum
    FROM Sales.SalesOrderHeader
    WHERE YEAR(OrderDate) = 2014
)
SELECT COUNT(CustomerID) AS NumberOfUniqueCustomers
FROM UniqueCustomers
WHERE RowNum = 1;
