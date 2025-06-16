						/* Identifying Repeat Customers. */
-- Walmart needs to identify customers who made repeat purchases within a specific time frame (e.g., within 30 days).
 
	USE walmartsales_Dataset;
SELECT DISTINCT
    t1.Customer_ID
FROM
    walmartsales t1
        JOIN
    walmartsales t2 ON t1.Customer_ID = t2.Customer_ID
WHERE
    t1.date < t2.date
        AND t2.date <= t1.date + INTERVAL 30 DAY
ORDER BY Customer_ID;
  
  -- OR WITH WINDOW FUNCTION

	USE walmartsales_Dataset;
with ranked_purchases AS (
SELECT 
   Customer_ID ,
    date,
    LAG(date) OVER (PARTITION BY Customer_ID ORDER BY date) AS prev_date
FROM 
	walmartsales 
)
SELECT DISTINCT 
	Customer_ID 
FROM 
	ranked_purchases
WHERE 
  date <= prev_date + INTERVAL 30 DAY
  AND prev_date IS NOT NULL;


