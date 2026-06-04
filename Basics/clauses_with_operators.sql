SELECT * FROM products;
-- clauses with operators
-- comaprision operator (=, != , >,<, <= ,>=)
SELECT * FROM products WHERE category != 'Electronics';

SELECT * FROM products WHERE PRICE > 1000;

-- logical operator(AND, OR, NOT)
SELECT * FROM products WHERE PRICE < 1000 AND category = 'Electronics';

-- range(BETWEEN)
SELECT * FROM products WHERE price BETWEEN 400 AND 1000;

-- set(IN)
SELECT * FROM products WHERE category IN ('Electronics','Home & Kitchen','Fitness');

-- pattern(LIKE)
SELECT * FROM products WHERE sku_code LIKE 'W%';

SELECT * FROM products WHERE sku_code LIKE '%123%';

SELECT * FROM products WHERE sku_code LIKE '_B%';



