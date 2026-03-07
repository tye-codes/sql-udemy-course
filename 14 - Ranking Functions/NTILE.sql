
SELECT
	OrderID,
	Sales,
	NTILE(1) OVER (ORDER BY Sales DESC) OneBucket,
	NTILE(2) OVER (ORDER BY Sales DESC) TwoBucket,
	NTILE(3) OVER (ORDER BY Sales DESC) ThreeBucket,
	NTILE(4) OVER (ORDER BY Sales DESC) FourBucket
FROM Sales.Orders

-- Segment all orers into 3 categories high, medium, low
SELECT
	*,
	CASE WHEN Buckets = 1 THEN 'HIGH'
		WHEN Buckets = 2 THEN 'MEDIUM'
		WHEN Buckets = 3 THEN 'LOW'
	END SalesSegmentations
FROM (
	SELECT
		OrderID,
		Sales,
		NTILE(3) OVER (ORDER BY Sales DESC) Buckets
	FROM Sales.Orders
)t
