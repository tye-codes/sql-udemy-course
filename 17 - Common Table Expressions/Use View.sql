-- Find the running total of sales for each month
SELECT
	OrderMonth,
	TotalSales,
	SUM(TotalSales) OVER (ORDER BY OrderMonth) AS RunningTotal
FROM V_Monthly_Summary


-- see CREATE VIEW.sql
