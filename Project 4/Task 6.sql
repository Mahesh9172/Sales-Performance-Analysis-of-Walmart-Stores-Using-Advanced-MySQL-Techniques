							/* Monthly Sales Distribution by Gender */ 
-- Walmart wants to understand the sales distribution between male and female customers on a monthly basis.

	USE walmartsales_Dataset;
SELECT 
    MONTHNAME(date) AS Month,
    YEAR(date) AS Year,
    gender,
    ROUND(SUM(Total), 2) AS Total_Sales
FROM
    walmartsales
GROUP BY MONTHNAME(date) , YEAR(date) , gender
ORDER BY MONTHNAME(date) , YEAR(date);