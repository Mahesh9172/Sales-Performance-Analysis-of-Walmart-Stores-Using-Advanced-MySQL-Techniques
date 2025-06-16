					/* Most Popular Payment Method by City */

-- Walmart needs to determine the most popular payment method in each city to tailor marketing strategies.

	USE walmartsales_Dataset;
SELECT 
    City, Payment, 
    COUNT(Payment) AS Total_Pay
FROM
    walmartsales
GROUP BY City , Payment
ORDER BY City DESC , Total_Pay DESC;