-- Find the average shipping duration in days for each month
-- DATEDIFF learning

SELECT
	MONTH(OrderDate) AS OrderDate,
	AVG(DATEDIFF(DAY, OrderDate, ShipDate)) AvgShip
FROM Sales.Orders
GROUP BY MONTH(OrderDate)

-- Time gap analysis
-- Find the number of days between each order and the previous order
SELECT
	OrderID,
	OrderDate CurrentOrderDate,
	LAG(OrderDate) OVER (ORDER BY OrderDate) PreviousOrderDate,
	DATEDIFF(DAY, LAG(OrderDate) OVER (ORDER BY OrderDate), OrderDate) DaysBetweenOrders
FROM Sales.Orders