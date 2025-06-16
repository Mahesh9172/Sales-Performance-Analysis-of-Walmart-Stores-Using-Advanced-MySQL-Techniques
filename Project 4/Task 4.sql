						/* Detecting Anomalies in Sales Transactions */
/* Walmart suspects that some transactions have unusually high or low sales compared to the average for the
product line. Identify these anomalies. */              

	USE walmartsales_Dataset;
SELECT Customer_ID, 
       Product_line, 
       Total, 
       AVG(Total) OVER (PARTITION BY Product_line) AS Average_Spending,
       Total - AVG(Total) OVER (PARTITION BY Product_line) AS Difference_From_Average
FROM walmartsales
ORDER BY Difference_From_Average DESC
limit 5;


