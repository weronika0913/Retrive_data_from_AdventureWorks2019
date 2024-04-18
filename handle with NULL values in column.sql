-- handle with NULL values in column
SELECT 
	LOWER(SUBSTRING(FirstName,1,1) +
	SUBSTRING(MiddleName,1,1) +
	SUBSTRING(LastName,1,1)) AS CorrectInitials
FROM 
	dbo.Employee

SELECT 
	LOWER(SUBSTRING(COALESCE(FirstName,''),1,1) +
	SUBSTRING(COALESCE(MiddleName,''),1,1) +
	SUBSTRING(COALESCE(LastName,''),1,1)) AS CorrectInitials
FROM 
	dbo.Employee


	-- checking total weight for each category including NULL category
SELECT 
    COALESCE(CONVERT(VARCHAR,ProductSubCategoryID), 'Unknown') AS ProductSubCategoryID,
	SUM(ISNULL(Weight, 0)) AS TotalWeight
FROM 
    Production.Product
GROUP BY 
