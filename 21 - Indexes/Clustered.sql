-- CREATE [CLUSTERED| NONCLUSTERED] INDEX index_name ON table_name (col1, col 2,...)
--			default is nonclustered index

/*
SELECT
*
INTO Sales.DBCustomers
FROM Sales.Customers
*/

DROP INDEX idx_DBCustomers_CustomerID ON Sales.DBCustomers

CREATE CLUSTERED INDEX idx_DBCustomers_FirstName 
ON Sales.DBCustomers (FirstName)

DROP INDEX idx_DBCustomers_FirstName ON Sales.DBCustomers

CREATE CLUSTERED INDEX idx_DBCustomers_CustomerID 
ON Sales.DBCustomers (CustomerID)

DROP INDEX idx_DBCustomers_LastName ON Sales.DBCustomers

CREATE NONCLUSTERED INDEX idx_DBCustomers_LastName
ON Sales.DBCustomers(LastName)

/*
============
COMPOSITE INDEX
============
*/
SELECT
*
FROM Sales.DBCustomers
WHERE Country = 'USA' AND Score > 500

DROP INDEX idx_DBCustomers_CountryScore ON Sales.DBCustomers

-- The index will be used if the WHERE clause calls correctly from left to right the parameters. 
CREATE INDEX idx_DBCustomers_CountryScore
ON Sales.DBCustomers(Country, Score)