--Find the products that have a price higher than the average price of all products

SELECT
	ProductID,
	Price
FROM Sales.Products
--Subquery
WHERE Price > (SELECT AVG(Price) FROM Sales.Products)