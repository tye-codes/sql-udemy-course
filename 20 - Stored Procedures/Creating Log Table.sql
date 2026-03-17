-- Log table to practice trigger
CREATE TABLE  Sales.EmployeeLogs (
	LogID INT IDENTITY(1,1) PRIMARY KEY,
	EmployeeID INT,
	LogMessage VARCHAR(25),
	LogDate Date
);