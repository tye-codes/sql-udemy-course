-- Show all customer details and find the total orders of each customer
SELECT
	c.*,
	o.TotalOrders
FROM Sales.Customers c
	LEFT JOIN (
	--Subquery
		SELECT
			CustomerID,
			COUNT(*) TotalOrders
		FROM Sales.Orders
		GROUP BY CustomerID) o
	ON c.CustomerID = o.CustomerID
