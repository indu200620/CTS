SELECT *
FROM
(
SELECT
ProductID,
MONTH(OrderDate) AS SalesMonth,
Quantity
FROM Sales
) SourceData

PIVOT
(
SUM(Quantity)
FOR SalesMonth IN
(
[1],[2],[3],[4]
)
) AS PivotResult;

SELECT *
FROM PivotResult

UNPIVOT
(
Quantity
FOR SalesMonth IN
(
[1],[2],[3],[4]
)
) AS UnpivotResult;