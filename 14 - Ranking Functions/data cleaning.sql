-- Assigning unique identifiers

SELECT 
	ROW_NUMBER() OVER (ORDER BY OrderID, OrderDate) UniqueID,
	*
FROM Sales.OrdersArchive

-- data cleansing through finding duplicate rows and removing
SELECT
*
FROM(
	SELECT
		ROW_NUMBER() OVER (PARTITION BY OrderID ORDER BY CreationTime DESC) rn, -- duplicate rows will show >1
		*
	FROM Sales.OrdersArchive
)t WHERE rn=1