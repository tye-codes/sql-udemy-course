-- Rank each order based on their sales from highest to lowest
-- Additionally provide details such as orderID and order date
SELECT
	OrderID,
	OrderDate,
	Sales,
	RANK() OVER (ORDER BY Sales DESC) RankSales
FROM Sales.Orders
