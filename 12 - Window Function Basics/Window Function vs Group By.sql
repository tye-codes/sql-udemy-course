USE SalesDB

--Find the total sales across all orders
SELECT
	SUM(Sales) TotalSales
FROM Sales.Orders

-- Find the total sales for each product
SELECT
	productID,
	SUM(Sales) TotalSales
FROM Sales.Orders
GROUP BY ProductID

/* Find the total sales for each product
Additionally provide details such as order ID, orderdate*/
SELECT
	ProductID,
	OrderID,
	OrderDate,
	--window function initiation
	SUM(Sales) OVER(PARTITION BY ProductID) TotalSalesByProduct 
FROM Sales.Orders