SELECT * FROM products;

-- case (like if and else in other programmings)
SELECT name, price,
CASE WHEN (price>1000) THEN 'Expensive'
WHEN (price BETWEEN 500 AND 1000) THEN 'Moderate'
ELSE 'Cheap'
END AS price_tag FROM products;

-- FOR ADDING THIS PRICE TAG IN ORIGINAL TABLE
ALTER TABLE products 
ADD COLUMN price_tag TEXT;

UPDATE products
SET price_tag =
CASE 
WHEN (price>1000) THEN 'Expensive'
WHEN (price BETWEEN 500 AND 1000) THEN 'Moderate'
ELSE 'Cheap'
END;

SELECT * FROM products;

-- for stock avaialability 
SELECT name, 
CASE WHEN is_available THEN 'In Stock'
ELSE 'Out of Stock'
END AS stock_availablity FROM products;

-- for stock status
SELECT name, 
CASE WHEN (stock_quantity > 100) THEN 'High Stock'
WHEN (stock_quantity BETWEEN 30 AND 100) THEN 'Medium Stock'
ELSE 'Low Stock'
END AS stock_level FROM products;
