-- Query Task
SELECT * FROM products;

-- Display the name and price of the cheapest product in the entire table.
SELECT name, price FROM products WHERE price = (SELECT MIN(price) FROM products);

-- Find the average price of products that belong to the 'Home & Kitchen' or 'Fitness' category.
SELECT ROUND(AVG(price),2) FROM products WHERE category IN ('Home & Kitchen','Fitness');

-- Show product names and stock quantity where the product is available, stock is more than 50, and price is not equal to 299.
SELECT name, stock_quantity FROM products WHERE is_available = TRUE AND stock_quantity>50 AND price!=299; 

-- Find the most expensive product in each category(name and price).
SELECT category, MAX(price)  AS Max_price FROM products GROUP BY category;

-- Show all unique categories in Uppercase, sorted in descending order.
SELECT DISTINCT UPPER(category) AS Category_upper FROM products ORDER BY Category_upper DESC; 
