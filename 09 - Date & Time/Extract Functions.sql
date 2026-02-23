SELECT

OrderID,
CreationTime,
--Gives number response
DATEPART(day, CreationTime) DatePart, 
-- returns string value of the date either letters or numbers
DATENAME(month, CreationTime) DateName,
-- deletes time information after what is specifice where minute is. 
-- Good for changing date to the month level only so we can use group by month for data analysis
DATETRUNC(minute, CreationTime)  DATETRUNC,
-- Updates the date to show the last day of the month
EOMONTH(CreationTime) EOMONTH



FROM Sales.Orders