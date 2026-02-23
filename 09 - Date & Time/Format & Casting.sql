-- Format is also one
SELECT
CreationTime,
-- changes data type while specifying a format
Convert(DATE, CreationTime) AS [DateTime to Date Convert],
-- chages data type and loses formatting 
CAST(CreationTime AS DATE) AS [Datetime to Date]

FROM Sales.Orders