-- Find the highest and lowest sales for each product
-- Find highest and lowest sales across all orders

SELECT
	OrderID,
	OrderDate,
	ProductID,
	MAX(Sales) OVER() HighestSales,
	MIN(Sales) OVER() LowestSales,
	MAX(Sales) OVER(PARTITION BY ProductID) HighestProductSales,
	MIN(Sales) OVER(PARTITION BY ProductID) LowestProductSales
FROM Sales.Orders

-- Find employees wo have highest salaries
SELECT
*
FROM(
	SELECT
		*,
		MAX(Salary) OVER() HighestSalary
	FROM Sales.Employees
)t WHERE Salary = HighestSalary

-- Find the deviation of each sales form the minimum and maximum sales amounts
SELECT
	OrderID,
	OrderDate,
	ProductID,
	MAX(Sales) OVER() HighestSales,
	MIN(Sales) OVER() LowestSales,
	Sales - MIN(Sales) OVER() DeviationFromMin
FROM Sales.Orders