-- Find the percerentage contribution of each products' sales to the total sales

SELECT
	OrderID,
	ProductID,
	Sales,
	SUM(Sales) OVER() TotalSales,
	ROUND(CAST(Sales AS Float) / SUM(Sales) OVER() * 100, 2) PercentContribution
FROM Sales.Orders

-- Find all orders where sales are higher than the average sales across all orders
-- Need to use subqueries when need to use WHEN and window functions together
SELECT
*
FROM(
	SELECT
		OrderID, 
		ProductID,
		Sales,
		AVG(Sales) OVER() AvgSales
	FROM Sales.Orders
)t WHERE Sales > AvgSales