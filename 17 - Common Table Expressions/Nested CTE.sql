-- Step three is the nested CTE

--Step 1: Find the total sales per customer

WITH CTE_Total_Sales AS(
	SELECT
		CustomerID,
		SUM(Sales) AS TotalSales
	FROM Sales.Orders
	GROUP BY CustomerID
)
--Step 2: Find the last order date for each customer
,CTE_last_Order AS(
	SELECT
		CustomerID,
		MAX(OrderDate) AS Last_Order
	FROM Sales.Orders
	GROUP BY CustomerID
)
--Step 3: Rank customers on Total Sales Per Customer
,CTE_Customer_Rank AS(
	SELECT
	CustomerID,
	TotalSales,
	RANK() OVER (ORDER BY TotalSales DESC) AS CustomerRank
	FROM CTE_Total_Sales
)
--Step 4: Segment Customers based on their total sales
,CTE_Customer_Segments AS(
	SELECT
		CustomerID,
		CASE WHEN TotalSales > 100 THEN 'High'
			WHEN TotalSales > 80 THEN 'Medium'
			ELSE 'Low'
		END CustomerSegments
	FROM CTE_Total_Sales
)
--Main Query
SELECT
	c.CustomerID,
	c.FirstName,
	c.LastName,
	cts.TotalSales,
	clo.Last_Order,
	ccr.CustomerRank,
	ccs.CustomerSegments
FROM Sales.Customers c
LEFT JOIN CTE_Total_Sales cts
ON cts.CustomerID = c.CustomerID
LEFT JOIN CTE_Last_Order clo
ON clo.CustomerID = c.CustomerID
LEFT JOIN CTE_Customer_Rank ccr
ON ccr.CustomerID = c.CustomerID
LEFT JOIN CTE_Customer_Segments ccs
ON ccs.CustomerID = c.CustomerID