-- Calculate moving average of sales for each product over time including only next order

SELECT
	OrderID,
	ProductID,
	OrderID,
	Sales,
	AVG(Sales) OVER(PARTITION BY ProductID) AvgByProduct,
	AVG(Sales) OVER(PARTITION BY ProductID ORDER BY OrderDate) GrowingAvg,
	AVG(Sales) OVER(PARTITION BY ProductID ORDER BY OrderDate ROWS BETWEEN CURRENT ROW AND 1 FOLLOWING) MovingAvg
FROM Sales.Orders