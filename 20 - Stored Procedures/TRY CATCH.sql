--Try/Catch when an error occurs in try, the code inside catch executes

ALTER PROCEDURE GetCustomerSummary @Country NVARCHAR(50) = 'USA'--setup parameter with USA as default
AS 
BEGIN

	--Step 1: error handling with TRY/CATCH
	BEGIN TRY

		DECLARE @TotalCustomers INT, @AvgScore FLOAT; --setting up data type for variables

		IF EXISTS (SELECT 1 FROM Sales.Customers WHERE Score IS NULL AND Country = @Country)
		BEGIN
			PRINT ('Updating NULL Scores to 0');
			UPDATE Sales.Customers
			SET  Score = 0+1/0 -- This will cause a divide by zero error to demonstrate error handling
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

	--End of Try
	END TRY
	BEGIN CATCH
		PRINT 'An error occurred: ' + ERROR_MESSAGE();
		PRINT('Error Number: ' + CAST(ERROR_NUMBER() AS NVARCHAR));
		PRINT('Error Line: ' + CAST(ERROR_LINE() AS NVARCHAR));
	END CATCH
END
GO

-- Execute Stored Procedure
EXEC GetCustomerSummary @Country = 'USA' 


