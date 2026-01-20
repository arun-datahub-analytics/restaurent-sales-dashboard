Create database restaurent_db;
use restaurent_db;
#TABLE 1
CREATE TABLE orders (
    Order_id VARCHAR(10),
    Order_date DATE,
    Order_time TIME,
    Order_type VARCHAR(20),
    Customer_id VARCHAR(10),
    Restaurant_location VARCHAR(50),
    Customer_rating INT);
    #TABLE2
    CREATE TABLE order_items (
    Order_id VARCHAR(10),
    Item_id VARCHAR(10),
    Quantity INT,
    Price DECIMAL(10,2));
   #TABLE3 
    CREATE TABLE menu (
    Item_id VARCHAR(10),
    Item_name VARCHAR(100),
    Category VARCHAR(50),
    Cost_price DECIMAL(10,2));
    #TABLE4
    CREATE TABLE customers (
    Customer_id VARCHAR(10),
    Customer_name VARCHAR(50),
    Visit_count INT);
    
##USING table data import wizard to import all data into 4 tables

# 1.TOTAL ORDERS
SELECT COUNT(*) AS total_orders
FROM orders;

# 2.Online  vs dine in orders
SELECT order_type, COUNT(*) AS order_count
FROM orders
GROUP BY order_type;

# 3.Top selling items 
SELECT m.item_name, SUM(oi.quantity) AS total_sold
FROM order_items oi
JOIN menu m
ON oi.item_id = m.item_id
GROUP BY m.item_name
ORDER BY total_sold DESC
LIMIT 5;

# 4.Revenue by restaurant location
SELECT o.restaurant_location,
SUM(oi.quantity * oi.price) AS total_revenue
FROM orders o
JOIN order_items oi
ON o.order_id = oi.order_id
GROUP BY o.restaurant_location
ORDER BY total_revenue DESC;

# 5.High value orders
SELECT oi.order_id,
SUM(oi.quantity * oi.price) AS order_value
FROM order_items oi
GROUP BY oi.order_id
HAVING order_value > 500
ORDER BY order_value DESC;