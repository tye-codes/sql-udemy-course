Aggregate Functions:
Count(*) counts the amount of rows
Sum(*) sums the content of the rows
Avg(*) averages the content of the rows
Max(*) finds the max of the content of the rows
Min(*) finds the min of the content of the rows


Window Functions:
performs calculations on specific subsets of datawithout losing the level of details of rows.
It contains Aggregate, Rank and Value Functions.


Syntax Window Functons:
Window functon -> Over clause
eg
AVG(Sales) OVER (PARTITION BY Category ORDER BY  OrderDate ROWS UNBOUNDED PRECEDING)

FUNCTION: AVG(), SUM() etc... can be aggregates, ranks and value functions.
OVER: needed to tell sql we are using window functions 
PARTITION BY: sets the key/group for which the function is operated on. Can be partitioned by multiple columns.
ORDER BY: works the same as outside a window function.
RANK: sets numeric rank to each row based on conditions set
FRAMING: set by rows in this example, sets a range on the data to be worked within. The frame is how many data points are acted upon by the window function


