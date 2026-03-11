-- Show the details of orders made by customers in Germany
SELECT
	*
FROM Sales.Orders o
WHERE EXISTS (
	SELECT
		1 --Select 1 because this part doesn't matter and just helps with efficiency
	FROM Sales.Customers c
	WHERE Country = 'Germany'
	AND o.CustomerID = c.CustomerID)
