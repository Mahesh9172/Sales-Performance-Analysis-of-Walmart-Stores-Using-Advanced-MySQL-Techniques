						/* Finding Top 5 Customers by Sales Volume */ 
-- Walmart wants to reward its top 5 customers who have generated the most sales Revenue.

	USE walmartsales_Dataset;
SELECT 
    Customer_ID, 
    ROUND(SUM(Total), 2) AS Most_Sale_Revenue
FROM
    walmartsales
GROUP BY Customer_ID
ORDER BY Most_Sale_Revenue DESC
LIMIT 5;