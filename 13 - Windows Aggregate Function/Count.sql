-- Find the total number of Orders
-- Additionally provide details such as oder ID and order date
-- Find the total number of orders for each customer
SELECT
	OrderId,
	OrderDate,
	CustomerID,
	COUNT(*) OVER() TotalOrders,
	COUNT(*) OVER(PARTITION BY CustomerID) OrdersByCustomers
FROM Sales.Orders

-- Find the total number of Customers
-- Additionally provide all customer details
-- Find the total number of scores 
SELECT
	*,
	COUNT(*) OVER() NumberOfCustomers,
	COUNT(Score) OVER() TotalScore
FROM Sales.Customers

-- Check whether the table 'orders' contain any duplicate rows
SELECT
	COUNT(*) OVER (PARTITION BY OrderID) CheckPK --all values should be 1
FROM Sales.Orders

SELECT
*
FROM (
	SELECT
		OrderID,
		COUNT(*) OVER (PARTITION BY OrderID) CheckPK
	FROM Sales.OrdersArchive
)t WHERE CheckPK > 1