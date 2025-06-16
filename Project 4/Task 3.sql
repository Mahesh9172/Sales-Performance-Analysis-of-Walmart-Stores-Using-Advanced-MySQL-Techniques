				/* Analyzing Customer Segmentation Based on Spending */
                
-- PART 1 Walmart wants to segment customers based on their average spending behavior. 

	USE walmartsales_Dataset;
SELECT 
    Customer_ID, 
    ROUND(AVG(Total),2) AS Average_Spending
FROM
    walmartsales
GROUP BY Customer_ID
ORDER BY Customer_ID;

-- PART 2 Classify customers into three tiers: High, Medium, and Low spenders based on their total purchase amounts.*/
  
	USE walmartsales_Dataset; 
SELECT 
    Customer_ID,
    ROUND(SUM(Total),2) AS Total_Spending,
    CASE
        WHEN SUM(Total) < 20000 THEN 'Low Spender'
        WHEN SUM(Total) BETWEEN 20000 AND 21000 THEN 'Medium Spender'
        ELSE 'High Spender'
    END AS spending_tier
FROM
    walmartsales
GROUP BY Customer_ID
ORDER BY Customer_ID;
