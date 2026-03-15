-- Generate a series of numbers from 1-20

WITH Series AS (
-- Anchor Query
	SELECT
		1 AS MyNumber
UNION ALL
	SELECT		
		MyNumber + 1
	FROM Series
	WHERE MyNumber < 20
)

SELECT
	*
FROM Series
OPTION (MAXRECURSION 100);

-- Show Employee hierarchy by displaying each employee's level with the one


WITH CTE_Emp_Hierarchy AS
(
-- Anchor Query
	SELECT
		EmployeeID,
		FirstName,
		ManagerID,
		1 AS Level
	FROM Sales.Employees
	WHERE ManagerID IS NULL
UNION ALL
	SELECT
		e.EmployeeID,
		e.FirstName,
		e.ManagerID,
		level + 1
	FROM Sales.Employees AS e
	INNER JOIN CTE_Emp_Hierarchy ceh -- Referencing the CTE is what creates the loop.
	ON e.ManagerID = ceh.EmployeeID
)

-- Main Query
SELECT
*
FROM CTE_Emp_Hierarchy