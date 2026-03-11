-- FROM in subqueries	
-- Find the products that have a price higher than the average price of all products
SELECT 
	*
FROM(
--Subquery
	SELECT
		ProductID,
		Price,
		AVG(Price) OVER() Average
	FROM Sales.Products)t
WHERE Price>Average

-- Rank customers on total amount of sales
SELECT
	*,
	RANK() OVER (ORDER BY TotalSales DESC) CustomerRank
FROM(
	SELECT
		CustomerID,
		SUM(Sales) TotalSales
	FROM Sales.Orders
	GROUP BY CustomerID)t