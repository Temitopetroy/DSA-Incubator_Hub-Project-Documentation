CREATE DATABASE KULTRA
 
 ----1 WHICH PRODUCT CATEGORY HAD THE HIGHEST SALES
SELECT TOP 1
    Product_Category, 
    SUM(Sales) AS Total_Sales
FROM 
    kms_sale
GROUP BY 
    Product_Category
ORDER BY 
    Total_Sales DESC 



----2 What are the Top 3 and Bottom 3 regions in terms of sales
SELECT TOP 3
    Region, 
    SUM(Sales) AS Total_Sales
FROM 
    kms_sale
GROUP BY 
    Region
ORDER BY 
    Total_Sales DESC


---- BOTTOM 3
SELECT TOP 3
    Region, 
    SUM(Sales) AS Total_Sales
FROM 
    kms_sale
GROUP BY 
    Region
ORDER BY 
    Total_Sales ASC



----3 What were the total sales of appliances in Ontario?
SELECT 
    SUM(Sales) AS Ontario_Appliance_Sales
FROM 
    kms_sale
WHERE 
    (Province) = 'ontario'
    AND ("Product_Sub_Category") LIKE 'appliance'



----4 Advise the management of KMS on what to do to increase revenue from the bottom 10 customers
----Customized marketing strategies, loyalty incentives, and personalized packages could help boost their revenue.
SELECT TOP 10
    Customer_Name, 
    SUM(Sales) AS Total_Sales
FROM 
    kms_sale
GROUP BY 
    Customer_Name
ORDER BY 
    Total_Sales ASC



----5 KMS incurred the most shipping cost using which shipping method?
SELECT TOP 1
    "Ship_Mode", 
    SUM(Sales - Profit) AS Estimated_Shipping_Cost
FROM 
    kms_sale
GROUP BY 
    "Ship_Mode"
ORDER BY 
    Estimated_Shipping_Cost DESC

SELECT TOP 1
    "Ship_Mode", 
    SUM (Shipping_Cost) AS Estimated_Shipping_Cost
FROM 
    kms_sale
GROUP BY 
    "Ship_Mode"
ORDER BY 
    Estimated_Shipping_Cost DESC


SELECT * FROM kms_sale


----6 Who are the most valuable customers, and what products or services do they typically purchase?
SELECT TOP 10
    Customer_Name, Product_Category
FROM
    kms_sale
ORDER BY
    Sales DESC


----7 Which small business customer had the highest sales?
SELECT TOP 1
    Customer_Name 
FROM 
    kms_sale
WHERE 
    Customer_Segment = 'Small Business'
ORDER BY 
    Sales DESC


----8 Which corporate customer placed the most number of orders from 2009 to 2012?
SELECT top 10
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


----9 Which consumer customer was the most profitable one?
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


----10 Which customer returned items, and what segment do they belong to?
SELECT 
    "Customer_Name", 
    "Customer_Segment"
FROM 
    kms_sale
WHERE 
    LOWER("Product_Name") LIKE 'return'
GROUP BY 
    "Customer_Name", "Customer_Segment";

SELECT DISTINCT
    "Customer_Name", 
    "Customer_Segment"
FROM 
    kms_sale AS KMS
INNER JOIN Order_Status AS ORS ON ORS.Order_ID = KMS.Order_ID


----11 Did KMS appropriately spend shipping costs based on Order Priority?
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

