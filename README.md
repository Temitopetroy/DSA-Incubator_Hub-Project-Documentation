# DSA-Incubator_Hub-Project-Documentation
Taking you on a journey of data analysis through the Incubator Hub
## 📑 Case Scenario I
Question 1: Which product category had the highest sales?
        
``` SQL 
SELECT 
    "Product Category", 
    SUM(Sales) AS Total_Sales
FROM 
    kms_sales
GROUP BY 
    "Product Category"
ORDER BY 
    Total_Sales DESC 
```
Question 2: What are the Top 3 and Bottom 3 regions in terms of sales?
``` SQL
 SELECT TOP 3
    Region, 
    SUM(Sales) AS Total_Sales
FROM 
    kms_sale
GROUP BY 
    Region
ORDER BY 
    Total_Sales DESC

SQL BOTTOM 3
SELECT TOP 3
    Region, 
    SUM(Sales) AS Total_Sales
FROM 
    kms_sale
GROUP BY 
    Region
ORDER BY 
    Total_Sales ASC
```
Question 3: What were the total sales of appliances in Ontario?
``` SQL
SELECT 
    SUM(Sales) AS Ontario_Appliance_Sales
FROM 
    kms_sale
WHERE 
    (Province) = 'ontario'
    AND ("Product_Sub_Category") LIKE 'appliance'
````



       
       

