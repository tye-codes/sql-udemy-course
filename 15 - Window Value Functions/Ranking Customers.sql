-- Rank customers based on average days between orders
SELECT
	CustomerID,
	AVG(DaysUntilNextOrder),
	RANK() OVER (ORDER BY COALESCE(AVG(DaysUntilNextOrder), 99999)) RangAvg
FROM(
	SELECT
		OrderID,
		CustomerID,
		OrderDate CurrentOrder,
		LEAD(OrderDate) OVER (PARTITION BY CustomerID ORDER BY OrderDate) NextOrder,
		DATEDIFF(DAY, OrderDate, LEAD(OrderDate) OVER (PARTITION BY CustomerID ORDER BY OrderDate)) DaysUntilNextOrder
	FROM Sales.Orders
)t
GROUP BY CustomerID