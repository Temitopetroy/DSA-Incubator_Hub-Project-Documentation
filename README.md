# DSA-Incubator_Hub-Project-Documentation
Taking you on a journey of data analysis through the Incubator Hub

## SALES AND ORDER DATA ANALYSIS FOR KULTRA MEGA STORES

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

  ![1  Product Category](https://github.com/user-attachments/assets/450481c9-85a7-46ca-8e17-84b896b2afc2)

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
```
- RESULT

![2  Top #3](https://github.com/user-attachments/assets/ad97c8e2-d6c4-4795-b89c-746f52e0ae70)

``` SQL
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
- RESULT



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
- RESULT

![4  Management Advise](https://github.com/user-attachments/assets/51f0c0e7-fc8f-48b8-a46b-395663bbf341)

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
- RESULT

![5  Most Shipping](https://github.com/user-attachments/assets/b202e4d5-ad03-4614-914d-3de03ce25f46)

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
- RESULT

![6  Valuable Customer](https://github.com/user-attachments/assets/4fe9cb21-0847-4a64-b147-8412e471d3a5)

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
- RESULT

![7  Small Business](https://github.com/user-attachments/assets/dc8cd2e4-ff1f-4620-88ac-6d6b0ceb715c)

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
- RESULT

![8  Corporate Customer](https://github.com/user-attachments/assets/76c86255-dec2-48f9-a8e9-5624809c4fdf)

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
- RESULT

![9  Consumer Profitable](https://github.com/user-attachments/assets/0524d339-0fbc-413f-a304-0a12141ff32b)

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

