-- Show the name and price of all products.
SELECT name, price FROM products;

-- Show all products where the category is 'Electronics'.
SELECT * FROM products WHERE category = 'Electronics';

-- Group products by category. Show each category once.
SELECT category FROM products GROUP BY category;

-- Show categories that have more than 1 product.
SELECT category, COUNT(*) FROM products GROUP BY category HAVING COUNT(*)>1;

-- Show all products sorted by price in ascending order.
SELECT * FROM products ORDER BY price;

-- Show only the first 3 products from the table.
SELECT * FROM products LIMIT 3;

-- Show product name as "Item_Name" and price as "Item_Price".
SELECT name AS Item_Name , price AS Item_Price FROM products;

-- Show all the unique categories from the products.
SELECT DISTINCT category FROM products;