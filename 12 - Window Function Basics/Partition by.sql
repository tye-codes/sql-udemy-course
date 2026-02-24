-- Find total sales across all orders
SELECT
	OrderID,
	OrderDate,
	SUM(Sales) OVER() totalsales
FROM Sales.Orders

-- Find total sales for each product
SELECT
	OrderID,
	OrderDate,
	ProductID,
	SUM(Sales) OVER(PARTITION BY ProductID) totalsales
FROM Sales.Orders

-- Find the total sales across all orders
-- Find total sales for each product
SELECT
	OrderID,
	OrderDate,
	ProductID,
	SUM(Sales) OVER() TotalSales,
	SUM(Sales) OVER(PARTITION BY ProductID) totalSalesByProduct
FROM Sales.Orders

-- Find the total sales across all orders
-- Find total sales for each product
-- Find the total sales for each combination of product and order status
SELECT
	OrderID,
	OrderDate,
	ProductID,
	SUM(Sales) OVER() TotalSales,
	SUM(Sales) OVER(PARTITION BY ProductID) totalSalesByProduct,
	SUM(Sales) OVER(PARTITION BY ProductID, OrderStatus) SalesByproductsAndStatus
FROM Sales.Orders

