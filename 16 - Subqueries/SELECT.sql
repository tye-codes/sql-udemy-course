-- Show the product IDs, names, prices and tot No. of orders
SELECT
	ProductId,
	Product,
	Price,
	-- Subquery
	(SELECT COUNT(*) FROM Sales.Orders) AS TotalOrders
FROM Sales.Products