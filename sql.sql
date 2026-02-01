CREATE DATABASE omniretail;
USE omniretail;


ALTER TABLE invoice
MODIFY COLUMN Revenue DECIMAL(12,2);

SELECT Revenue
FROM invoice
WHERE Revenue IS NOT NULL
  AND Revenue NOT REGEXP '^-?[0-9]+(\\.[0-9]+)?$'
LIMIT 10;

ALTER TABLE invoice
ADD COLUMN Revenue_num DECIMAL(12,2);

UPDATE invoice
SET Revenue_num =
    CASE
        WHEN Revenue REGEXP '^-?[0-9]+(\\.[0-9]+)?$'
        THEN CAST(Revenue AS DECIMAL(12,2))
        ELSE NULL
    END
WHERE Invoice IS NOT NULL;

SELECT Price
FROM invoice
LIMIT 10;

ALTER TABLE invoice
ADD COLUMN Price_num DECIMAL(10,2);

UPDATE invoice
SET Price_num =
    CAST(
        REGEXP_REPLACE(Price, '[^0-9.]', '')
        AS DECIMAL(10,2)
    );


SELECT Price, Price_num
FROM invoice
LIMIT 10;


UPDATE invoice
SET Revenue_num = Quantity * Price_num;

SELECT
    COUNT(*) AS total_rows,
    COUNT(Revenue_num) AS numeric_rows,
    ROUND(SUM(Revenue_num), 2) AS total_revenue
FROM invoice;

SELECT
    `Transaction type`,
    ROUND(SUM(Revenue_num), 2) AS revenue
FROM invoice
GROUP BY `Transaction type`;



# total revenue and total orders?

SELECT
    COUNT(DISTINCT Invoice) AS total_orders,
    ROUND(SUM(Revenue_num), 2) AS total_revenue
FROM invoice
WHERE `Transaction type` = 'Sale';

# Monthly Revenue Trend
SELECT
    `Year-Month`,
    ROUND(SUM(Revenue_num), 2) AS monthly_revenue
FROM invoice
WHERE `Transaction type` = 'Sale'
GROUP BY `Year-Month`
ORDER BY `Year-Month`;

# Top 10 Products by Revenue

SELECT
    Description,
    ROUND(SUM(Revenue_num), 2) AS product_revenue
FROM invoice
WHERE `Transaction type` = 'Sale'
GROUP BY Description
ORDER BY product_revenue DESC
LIMIT 10;

# Top Customers by Revenue
SELECT
    `Customer ID`,
    ROUND(SUM(Revenue_num), 2) AS customer_revenue,
    COUNT(DISTINCT Invoice) AS total_orders
FROM invoice
WHERE `Transaction type` = 'Sale'
  AND `Customer ID` IS NOT NULL
GROUP BY `Customer ID`
ORDER BY customer_revenue DESC
LIMIT 10;

# Repeat vs One-Time Customers
SELECT
    CASE
        WHEN order_count = 1 THEN 'One-Time'
        ELSE 'Repeat'
    END AS customer_type,
    COUNT(*) AS customer_count
FROM (
    SELECT
        `Customer ID`,
        COUNT(DISTINCT Invoice) AS order_count
    FROM invoice
    WHERE `Transaction type` = 'Sale'
      AND `Customer ID` IS NOT NULL
    GROUP BY `Customer ID`
) t
GROUP BY customer_type;

# Return Impact (Revenue Loss)
SELECT
    ROUND(ABS(SUM(Revenue_num)), 2) AS return_revenue_loss
FROM invoice
WHERE `Transaction type` = 'Return';



# Country-wise Revenue

SELECT
    Country,
    ROUND(SUM(Revenue_num), 2) AS country_revenue
FROM invoice
WHERE `Transaction type` = 'Sale'
GROUP BY Country
ORDER BY country_revenue DESC;

# Average Order Value (AOV)
SELECT
    ROUND(
        SUM(Revenue_num) / COUNT(DISTINCT Invoice),
        2
    ) AS avg_order_value
FROM invoice
WHERE `Transaction type` = 'Sale';




















