-- Find female employees whose salaries are greater than the salaries of any male employees
SELECT
	EmployeeID,
	FirstName,
	Gender,
	Salary
FROM Sales.Employees
WHERE Gender = 'F'
-- ANY Subquery
AND Salary > ANY (SELECT Salary FROM Sales.Employees WHERE Gender = 'M')

-- Find female employees whose salaries are greater than all the salaries of male employees
SELECT
	EmployeeID,
	FirstName,
	Gender,
	Salary
FROM Sales.Employees
WHERE Gender = 'F'
-- ANY Subquery
AND Salary > ALL (SELECT Salary FROM Sales.Employees WHERE Gender = 'M')


