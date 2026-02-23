/* ISNULL COALESCE
NULLIF(val1, val2) if values are equal the output is null otherwise value 1
IS NULL(VALUE, REPLACEMENT_VALUE)
IS NOT NULL
*/

-- COALESCE(val1, val2, val3,...valn) think of it as a waterfall, 
--val is 2 if 1 is null, val is 3 if 1 and 2 are null
SELECT
CustomerID,
FirstName + ' ' + COALESCE(LastName, '') AS FullName,
COALESCE(Score, 0) + 10 AS Score
FROM Sales.Customers

--ISNULL() returns true if value is NULL
Select
LastName ISNULL
FROM Sales.Customers

--NULLIFF() 
SELECT
OrderID,
Sales,
Quantity,
Sales/NULLIF(Quantity, 0) AS Price
FROM Sales.Orders

--antijoints using null
SELECT
c.*,
o.OrderID
FROM Sales.Customers c
LEFT JOIN Sales.Orders o
ON c.CustomerID = o.CustomerID
WHERE o.CustomerID IS NULL