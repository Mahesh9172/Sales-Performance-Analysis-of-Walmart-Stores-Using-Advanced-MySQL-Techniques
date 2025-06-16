			/*Finding the Most Profitable Product Line for Each Branch.*/
            
/* Walmart needs to determine which product line contributes the highest profit to each branch.
The profit margin should be calculated based on the difference between the gross income and cost of goods sold. */

	USE walmartsales_Dataset;
SELECT 
    branch,
    Product_line,
    SUM(gross_income - cogs) AS Total_Profit
FROM
    walmartsales
GROUP BY branch , product_line
ORDER BY branch , Total_Profit DESC;

-- or

	USE walmartsales_Dataset;
SELECT 
    branch,
    Product_line,
    Round(SUM(Total - cogs), 2) AS Total_Profit
FROM
    walmartsales
GROUP BY branch , product_line
ORDER BY branch , Total_Profit DESC;







 