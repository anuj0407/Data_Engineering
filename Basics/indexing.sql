SELECT * FROM products;

CREATE INDEX idx_products_price ON products(price);

CREATE INDEX idx_products_lower_name ON products(LOWER(product_name));

CREATE INDEX idx_products_cat_price ON products(category, price);

-- See all indexes for a specific table
SELECT indexname, indexdef 
FROM pg_indexes 
WHERE tablename = 'products';