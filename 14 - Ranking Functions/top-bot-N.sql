-- Find the top highest sales for each product
SELECT
*
FROM (
	SELECT
		OrderID,
		ProductID,
		Sales,
		ROW_NUMBER() OVER (PARTITION BY ProductID ORDER BY Sales DESC) RankByProduct
	FROM Sales.Orders
)t WHERE RankByProduct = 1

-- Bottom N analysis 
-- Find the lowest 2 customers based on their total sales
SELECT
*
FROM (
	SELECT
		CustomerID,
		SUM(Sales) TotalSales,
		ROW_NUMBER() OVER (ORDER BY SUM(Sales) ASC) RankCustomers
	FROM Sales.Orders
	GROUP BY CustomerID
)t WHERE RankCustomers <= 2