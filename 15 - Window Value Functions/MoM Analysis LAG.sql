-- year to year and month to month analysis using lead and lag
SELECT
	*,
	CurrentMonthSales - PreviousMonthSales AS MoM_Change,
	ROUND(CAST((CurrentMonthSales - PreviousMonthSales) AS FLOAT)/PreviousMonthSales * 100, 1) AS MoM_Percentage
FROM(

	SELECT
		MONTH(OrderDate) OrderMonth,
		SUM(Sales) CurrentMonthSales,
		LAG(SUM(Sales)) OVER (ORDER BY MONTH(OrderDate)) PreviousMonthSales
	FROM Sales.Orders
	GROUP BY
		MONTH(OrderDate)
	)t