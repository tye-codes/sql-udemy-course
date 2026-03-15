-- Provide a view that combines orders, products, customers and employees
-- This can be called to make a table with all relevant data without having to code the joins
CREATE VIEW Sales.V_Order_Details AS(
	SELECT
		o.OrderID,
		o.OrderDate,
		p.Product,
		p.Category,
		COALESCE(c.FirstName, '') + ' ' + COALESCE(c.LastName, '') CustomerName, 
		c. Country CustomerCountry,
		COALESCE(e.FirstName, '') + ' ' + COALESCE(e.LastName, '') SalesName, 
		e.Department,
		o.Sales,
		o.Quantity
	FROM Sales.Orders o
	LEFT JOIN Sales.Products p
	ON p.ProductID = o.ProductID
	LEFT JOIN Sales.Customers c
	ON c.CustomerID = o.CustomerID
	LEFT JOIN Sales.Employees e
	ON e.EmployeeID = o.SalesPersonID
)