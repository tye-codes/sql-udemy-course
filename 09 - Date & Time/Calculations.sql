--DATEADD(PART, INTERVAL, DATE)
-- DATEDIFF(PART, START_DATE, END_DATE)

Select
OrderDate,
ShipDate,
-- adds or subtracts time away from date
DATEADD(year, 2, OrderDate) AS TwoYearslater,
-- finds difference between two dates
DATEDIFF(day, OrderDate, ShipDate) AS DATEDIFF
FROM Sales.Orders


