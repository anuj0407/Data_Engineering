CREATE VIEW available_fitness_products AS
SELECT product_id, name, price, stock_quantity
FROM products
WHERE category = 'Fitness' AND is_available = TRUE;

CREATE VIEW low_stock_products AS
SELECT name, category, stock_quantity
FROM products
WHERE stock_quantity < 30;