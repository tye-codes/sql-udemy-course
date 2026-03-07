-- Rank orders based on sales highest to lowest using
SELECT
	OrderID,
	ProductID,
	Sales,
	ROW_NUMBER() OVER(ORDER BY Sales DESC) SalesRank_Row,
	RANK() OVER(ORDER BY Sales DESC) SalesRank,
	DENSE_RANK() OVER(ORDER BY Sales DESC) SalesDenseRank
FROM Sales.Orders
