-- Show all customer details and find the total orders from each customer
SELECT
	*,
(SELECT COUNT(*) FROM Sales.Orders o WHERE o.CustomerID = c.CustomerID) TotalSales
FROM Sales.Customers c
--need to name the tables so we can reference them. Need to have a common column generally the primary key