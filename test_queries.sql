-- 1. Get all products and their associated materials
SELECT p.name AS product_name, m.name AS material_name
FROM product p
JOIN product_has_material phm ON p.id = phm.product_id
JOIN material m ON phm.material_id = m.id;

-- 2. Get customer orders along with the employee who served them
SELECT c.firstname AS customer_name, c.lastname AS customer_lastname, e.name AS employee_name, co.price, s.value AS status
FROM customer_order co
JOIN customer c ON co.customer_id = c.id
JOIN employee e ON co.employee_id = e.id
JOIN status s ON co.status_id = s.id;

-- 3. List products with stock below 20 units
SELECT name, stock
FROM product
WHERE stock < 20;

-- 4. Get supplier orders with their materials and quantities
SELECT so.id AS supplier_order_id, s.name AS supplier_name, m.name AS material_name, som.quantity
FROM supplier_order so
JOIN supplier s ON so.supplier_id = s.id
JOIN supplier_order_has_material som ON so.id = som.supplier_order_id
JOIN material m ON som.material_id = m.id;

-- 5. Show confirmed reservations with customer details and assigned table
SELECT r.description, c.firstname, c.lastname, rt.id AS table_id, s.value AS status
FROM reservation r
JOIN customer c ON r.customer_id = c.id
JOIN restaurant_table rt ON r.restaurant_table_id = rt.id
JOIN status s ON r.status_id = s.id
WHERE s.value = 'Confirmed';

-- 6. Get total revenue generated from customer orders
SELECT SUM(price) AS total_revenue
FROM customer_order;

-- 7. Get list of employees by work area
SELECT e.name AS employee_name, a.name AS area_name
FROM employee e
JOIN role r ON e.role_id = r.id
JOIN area a ON r.area_id = a.id;

-- 8. Query products sold in each customer order, including the quantity
SELECT co.id AS customer_order_id, p.name AS product_name, cop.quantity
FROM customer_order co
JOIN customer_order_has_product cop ON co.id = cop.customer_order_id
JOIN product p ON cop.product_id = p.id;

-- 9. List pending supplier orders along with the employees managing them
SELECT so.id AS supplier_order_id, s.name AS supplier_name, e.name AS employee_name, st.value AS status
FROM supplier_order so
JOIN supplier s ON so.supplier_id = s.id
JOIN employee e ON so.employee_id = e.id
JOIN status st ON so.status_id = st.id
WHERE st.value = 'Pending';

-- 10. Show total material stock provided by each supplier
SELECT s.name AS supplier_name, SUM(m.stock) AS total_stock
FROM supplier s
JOIN material_has_supplier ms ON s.id = ms.supplier_id
JOIN material m ON ms.material_id = m.id
GROUP BY s.name;