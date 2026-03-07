-- Find average sales across all orders
-- Find average sales for each product
-- Nulls needed to be handled

SELECT 
	ProductID,
	OrderDate,
	Sales,
	AVG(Sales) OVER() OverallAverage,
	AVG(COALESCE(Sales,0)) OVER(PARTITION BY ProductID) ProductAverageSales
FROM Sales.Orders

--Find average score of customers, provide customerID and last name

SELECT
	Score,
	CustomerID,
	LastName,
	AVG(COALESCE(Score,0)) OVER() AvgScore
FROM Sales.Customers