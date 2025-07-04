# DSA-Incubator_Hub-Project-Documentation
Taking you on a journey of data analysis through the Incubator Hub
## 📑 Case Scenario I
Question 1: Which product category had the highest sales?

''' 
SELECT 
    "Product Category", 
    SUM(Sales) AS Total_Sales
FROM 
    kms_sales
GROUP BY 
    "Product Category"
ORDER BY 
    Total_Sales DESC 
'''
