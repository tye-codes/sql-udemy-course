IF OBJECT_ID('Sales.V_Monthly_Summary', 'V') IS NOT NULL
	DROP VIEW Sales.V_Monthly_Summary; -- Allows for updates to the view to be enacted
GO

CREATE VIEW Sales.V_Monthly_Summary AS
(
	SELECT
		DATETRUNC(month, OrderDate) OrderMonth,
		SUM(Sales) TotalSales,
		COUNT(OrderID) TotalOrders,
		SUM(Quantity) TotalQuantities
	FROM Sales.Orders
	GROUP BY DATETRUNC(month, OrderDate)
)