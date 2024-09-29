SELECT 'address' AS table_name, COUNT(*) AS record_count FROM address
UNION ALL
SELECT 'customer', COUNT(*) FROM customer
UNION ALL
SELECT 'area', COUNT(*) FROM area
UNION ALL
SELECT 'role', COUNT(*) FROM role
UNION ALL
SELECT 'employee', COUNT(*) FROM employee
UNION ALL
SELECT 'customer_order', COUNT(*) FROM customer_order
UNION ALL
SELECT 'restaurant_table', COUNT(*) FROM restaurant_table
UNION ALL
SELECT 'reservation', COUNT(*) FROM reservation
UNION ALL
SELECT 'status', COUNT(*) FROM status
UNION ALL
SELECT 'category', COUNT(*) FROM category
UNION ALL
SELECT 'product', COUNT(*) FROM product
UNION ALL
SELECT 'report', COUNT(*) FROM report
UNION ALL
SELECT 'supplier', COUNT(*) FROM supplier
UNION ALL
SELECT 'material', COUNT(*) FROM material
UNION ALL
SELECT 'supplier_order', COUNT(*) FROM supplier_order
UNION ALL
SELECT 'product_has_material', COUNT(*) FROM product_has_material
UNION ALL
SELECT 'product_has_supplier', COUNT(*) FROM product_has_supplier
UNION ALL
SELECT 'material_has_supplier', COUNT(*) FROM material_has_supplier
UNION ALL
SELECT 'supplier_order_has_material', COUNT(*) FROM supplier_order_has_material
UNION ALL
SELECT 'customer_order_has_product', COUNT(*) FROM customer_order_has_product
UNION ALL
SELECT 'supplier_order_has_product', COUNT(*) FROM supplier_order_has_product;