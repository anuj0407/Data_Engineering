SELECT * FROM Products;
CREATE PROCEDURE add_product(
    p_name VARCHAR,
    p_sku CHAR(8),
    p_price NUMERIC,
    p_qty INT,
    p_category TEXT
)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO products(product_name, sku_code, product_price, stock_quantity, category)
    VALUES (p_name, p_sku, p_price, p_qty, p_category);

    RAISE NOTICE 'Product added successfully!';
END;
$$;

call add_product('bottle','bol1234',234.00,45,'Fitness');