					/* Analyzing Sales Trends by Day of the Week */
-- Walmart wants to analyze the sales patterns to determine which day of the week brings the highest sales.

	USE walmartsales_Dataset;
SELECT 
    DAYNAME(Date) AS Day_Of_Week, 
    ROUND(SUM(Total), 2) AS Sales
FROM
    walmartsales
GROUP BY Day_Of_Week
ORDER BY Sales DESC;