WITH CalendarCTE AS
(
SELECT
CAST('2025-01-01' AS DATE) AS CalendarDate

UNION ALL

SELECT
DATEADD(DAY,1,CalendarDate)
FROM CalendarCTE
WHERE CalendarDate < '2025-01-31'
)

SELECT *
FROM CalendarCTE;

MERGE Products AS Target
USING StagingProducts AS Source
ON Target.ProductID = Source.ProductID

WHEN MATCHED THEN
UPDATE SET
Target.Price = Source.Price

WHEN NOT MATCHED THEN
INSERT
(
ProductID,
ProductName,
Price
)
VALUES
(
Source.ProductID,
Source.ProductName,
Source.Price
);