# Shopify Data Science Challenge

## Question 1:

Given some sample data, write a program to answer the following: [click here to access the required data set](https://docs.google.com/spreadsheets/d/16i38oonuX1y1g7C_UAmiK9GkY7cS-64DfiDMNiR41LM/edit#gid=0).

 
 On Shopify, we have exactly 100 sneaker shops, and each of these shops sells only one model of shoe. We want to do some analysis of the average order value (AOV). When we look at orders data over a 30 day window, we naively calculate an AOV of $3145.13. Given that we know these shops are selling sneakers, a relatively affordable item, something seems wrong with our analysis. 

1. Think about what could be going wrong with our calculation. Think about a better way to evaluate this data. <br>
> **Ans:**	Incorrect AOV calculation is most likely due to use of count() function in calculation of total numbers of items. count() function will only count the number of rows, we need to use sum() function to get the total number of items. 

2. What metric would you report for this dataset? <br>
> **Ans:**	To get the accurate AOV we need to get total number of orders and total number of items and then get AOV by dividing them.

```python
total_order_amount = df['order_amount'].sum()
total_items = df['total_items'].sum()
aov = total_order_amount / total_items

print("Average Order Value: $%.2f"% (aov))

```
3. What is its value? <br>
> **Ans:** $357.92

**Code is in Question_1.ipynb**

## Question 2: 

For this question you’ll need to use SQL. [Follow this link](https://www.w3schools.com/SQL/TRYSQL.ASP?FILENAME=TRYSQL_SELECT_ALL) to access the data set required for the challenge. Please use queries to answer the following questions. Paste your queries along with your final numerical answers below.

1. How many orders were shipped by Speedy Express in total?<br>
>**Ans:** 54 <br>

Query -
```SQL
SELECT count(*) AS Orders 
FROM Orders
JOIN Shippers
ON Orders.ShipperID == Shippers.ShipperID
WHERE ShipperName =="Speedy Express"
```

2. What is the last name of the employee with the most orders?<br>
>**Ans:** Peacock

Query - 
```SQL
SELECT LastName FROM Orders
LEFT JOIN Employees
ON Orders.EmployeeID == Employees.EmployeeID
GROUP BY Orders.EmployeeID
ORDER BY Count(*) DESC
LIMIT 1
```
3. What product was ordered the most by customers in Germany?<br>
>**Ans:** <br>
Product Name : Camembert Pierrot <br>
Product ID : 60


Query -
```SQL
SELECT Products.ProductID, Products.ProductName, (COUNT(*) * OrderDetails.Quantity) AS TotalOrders 
FROM Orders, OrderDetails
JOIN Customers 
ON Orders.CustomerID == Customers.CustomerID
JOIN Products 
ON OrderDetails.ProductID == Products.ProductID
WHERE Country =="Germany"
GROUP BY Products.ProductId
ORDER BY TotalOrders DESC
LIMIT 1

```

**Code can be found in Question_2.sql**