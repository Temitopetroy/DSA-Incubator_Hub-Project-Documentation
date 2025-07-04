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
- Result:
  
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
Question 4: Advise the management of KMS on what to do to increase the revenue from the bottom 10 customers.
``` SQL
SELECT TOP 10
    Customer_Name, 
    SUM(Sales) AS Total_Sales
FROM 
    kms_sale
GROUP BY 
    Customer_Name
ORDER BY 
    Total_Sales ASC
```

Question 5: KMS incurred the most shipping cost using which shipping method?
``` SQL
SELECT TOP 1
    "Ship_Mode", 
    SUM (Shipping_Cost) AS Estimated_Shipping_Cost
FROM 
    kms_sale
GROUP BY 
    "Ship_Mode"
ORDER BY 
    Estimated_Shipping_Cost DESC
```   

Case Scenario II
Question 6: Who are the most valuable customers, and what products or services do they typically purchase?
``` SQL
SELECT TOP 10
    Customer_Name, Product_Category, Sales
FROM
    kms_sale
ORDER BY
    Sales DESC
```
Question 7: Which small business customer had the highest sales?
``` SQL
SELECT TOP 1
    Customer_Name, Sales 
FROM 
    kms_sale
WHERE 
    Customer_Segment = 'Small Business'
ORDER BY 
    Sales DESC
```

Question 8: Which Corporate Customer placed the most number of orders in 2009 – 2012?
``` SQL
SELECT top 1
    "Customer_Name", 
    COUNT("Order_ID") AS Order_Count
FROM 
    kms_sale
WHERE 
    "Customer_Segment" = 'Corporate'
    AND YEAR(Order_Date) BETWEEN 2009 AND 2012
GROUP BY 
    "Customer_Name"
ORDER BY 
    Order_Count DESC
```

Question 9: Which consumer customer was the most profitable one?
```SQL
SELECT tOP 1
    "Customer_Name", 
    SUM(Profit) AS Total_Profit
FROM 
    kms_sale
WHERE 
    "Customer_Segment" = 'Consumer'
GROUP BY 
    "Customer_Name"
ORDER BY 
    Total_Profit DESC
```

Question 10: Which customer returned items, and what segment do they belong to?
``` SQL
SELECT DISTINCT
    "Customer_Name", 
    "Customer_Segment"
FROM 
    kms_sale AS KMS
INNER JOIN Order_Status AS ORS ON ORS.Order_ID = KMS.Order_ID
```

Question 11: If the delivery truck is the most economical but the slowest shipping method and Express Air is the fastest but the most expensive one, do you think the company appropriately spent shipping costs based on the Order Priority? Explain your answer.
``` SQL
SELECT 
    "Order_Priority",
    "Ship_Mode",
    COUNT(*) AS Order_Count,
    SUM(Sales - Profit) AS Estimated_Shipping_Cost
FROM 
    kms_sale
GROUP BY 
    Order_Priority, Ship_Mode
ORDER BY 
    Order_Priority, Ship_Mode;
```

