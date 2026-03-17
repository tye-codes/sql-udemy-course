-- IF ELSE to handle NULL

ALTER PROCEDURE GetCustomerSummary @Country NVARCHAR(50) = 'USA'--setup parameter with USA as default
AS 
BEGIN

DECLARE @TotalCustomers INT, @AvgScore FLOAT; --setting up data type for variables

--Step 1: Prepare and Cleanup Data
IF EXISTS (SELECT 1 FROM Sales.Customers WHERE Score IS NULL AND Country = @Country)
BEGIN
	PRINT ('Updating NULL Scores to 0');
	UPDATE Sales.Customers
	SET  Score = 0
	WHERE Score IS NULL AND Country = @Country;
END

ELSE
BEGIN
	PRINT('No NULL Scores found')
END;

--Generating reports
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
EXEC GetCustomerSummary @Country = 'USA' --cll parameter

-- Find the total nr of orders and total sales
