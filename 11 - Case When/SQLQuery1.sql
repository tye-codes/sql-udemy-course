SELECT
	CustomerID,
	SUM(CASE
		WHEN Sales > 30 THEN 1
		ELSE 0
	END) TotalOrders,
	Count(*) TotalOrders
FROM Sales.Orders
GROUP BY CustomerID
ORDER BY CustomerID 


/*
CASE
	WHEN condition1 THEN result1
	WHEN condition2 THEN result2

	ELSE result
END 

SELECT 
Category,
SUM(Sales) AS TotalSales
FROM(
	SELECT
	OrderID,
	Sales,
	CASE
		WHEN Sales > 50 THEN 'High'
		WHEN Sales > 20 THEN 'Medium'
		ELSE 'Low'
	END Category
	FROM Sales.Orders
	)t
GROUP BY Category
ORDER BY TotalSales DESC

*/