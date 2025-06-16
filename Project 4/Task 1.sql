				/* Task 1: Identifying the Top Branch by Sales Growth Rate */

-- PART 1: Walmart wants to identify which branch has exhibited the highest sales growth over time. 

-- SALE GROWTH FORMULA IS ((Current Period Sales - Prior Period Sales) / Prior Period Sales) 

	USE walmartsales_Dataset;
SELECT 
  branch, 
  date, 
  Total AS Sale, 
  ROUND(
    (
      Total - LAG(Total) OVER (
        PARTITION BY Branch 
        ORDER BY 
          Date
      )
    ) / LAG(Total) OVER (
      PARTITION BY Branch 
      ORDER BY 
        Date
    ), 
    2
  ) AS Sales_Growth_Percentage 
FROM 
  walmartsales 
ORDER BY 
  Sales_Growth_Percentage DESC
  limit 5;

-- PART 2 : Analyze the total sales for each branch 

	USE walmartsales_Dataset;
SELECT 
    Branch, Round(SUM(Total),2) AS Total_Sales
FROM
    walmartsales
GROUP BY Branch
ORDER BY Total_Sales DESC;

-- PART 3 Compare the growth rate across months to find the top performer. 

-- SALE GROWTH FORMULA IS ((Current Period Sales - Prior Period Sales) / Prior Period Sales) 
   
   USE walmartsales_Dataset;
SELECT 
  branch, 
  Monthname(date) AS Month, 
  Total AS Sale, 
  ROUND(
    (
      Total - LAG(Total) OVER (
        PARTITION BY Branch 
        ORDER BY 
          MONTH(Date)
      )
    ) / LAG(Total) OVER (
      PARTITION BY Branch 
      ORDER BY 
        Date
    ), 
    2
  ) AS Sales_Growth_Percentage 
FROM 
  walmartsales 
ORDER BY 
  Sales_Growth_Percentage DESC
  limit 5;


 
