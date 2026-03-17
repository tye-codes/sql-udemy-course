-- FIND THE TOTAL NUMBER OF CUSTOMERS AND AVERAGER SCORE FOR US CUSTOMERS
-- Turn the query into a stored procedure

ALTER PROCEDURE GetCustomerSummary @Country NVARCHAR(50) AS
BEGIN
	SELECT
		COUNT(*) TotalCustomers,
		AVG(Score) AvgScore
	FROM Sales.Customers
	WHERE Country = @COUNTRY
END

-- Execute Stored Procedure
EXEC GetCustomerSummary @
