CREATE PROCEDURE sp_get_products_by_category(IN p_category VARCHAR(50))
SELECT 
    product_id,
    product_name,
    price,
    category
FROM products
WHERE category = p_category;


CALL sp_get_products_by_category('Điện thoại');