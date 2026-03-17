-- FIND THE TOTAL NUMBER OF CUSTOMERS AND AVERAGER SCORE FOR US CUSTOMERS
-- Turn the query into a stored procedure

ALTER PROCEDURE GetCustomerSummary @Country NVARCHAR(50) = 'USA'--setup parameter with USA as default
AS 
BEGIN

DECLARE @TotalCustomers INT, @AvgScore FLOAT; --setting up data type for variables

	SELECT
		@TotalCustomers = COUNT(*),
		@AvgScore = AVG(Score)
	FROM Sales.Customers
	WHERE Country = @COUNTRY;

	PRINT 'Total Customers for ' + @Country + ':' + CAST(@TotalCustomers AS NVARCHAR);
	PRINT 'Average Score for ' + @Country + ':' + CAST(@AvgScore AS NVARCHAR);

	SELECT
		COUNT(OrderID) TotalOrders,
		SUM(Sales) TotalSales
	FROM Sales.Orders o
	JOIN Sales.Customers c
	ON c.CustomerID = o.CustomerID
	WHERE c.Country = @Country;
END
GO

-- Execute Stored Procedure
EXEC GetCustomerSummary @Country = 'Germany' --cll parameter

-- Find the total nr of orders and total sales
