-- Aggregation functions
-- count()
SELECT count(product_id) FROM products;

-- sum()
SELECT SUM(price) FROM products;

SELECT SUM(price) FROM products WHERE category = 'Electronics';

-- avg()
SELECT ROUND(AVG(price),2) FROM products;

-- min()
SELECT MIN(price) FROM products;

-- max()
SELECT MAX(price) FROM products;


