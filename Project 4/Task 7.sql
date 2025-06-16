					/* Best Product Line by Customer Type. */
-- Walmart wants to know which product lines are preferred by different customer types(Member vs. Normal).

	USE walmartsales_Dataset;
SELECT 
    Product_line,
    Customer_type,
    COUNT(Customer_type) AS Total_Customer
FROM
    walmartsales
GROUP BY Product_line , Customer_type
ORDER BY Product_line;