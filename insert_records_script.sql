-- 1. address
INSERT INTO address (country, city, street) VALUES
('USA', 'New York', '5th Avenue'),
('Canada', 'Toronto', 'Queen Street'),
('Mexico', 'Mexico City', 'Paseo de la Reforma'),
('Spain', 'Madrid', 'Gran Vía'),
('Argentina', 'Buenos Aires', 'Avenida de Mayo'),
('Italy', 'Rome', 'Via Roma'),
('France', 'Paris', 'Champs-Élysées'),
('Germany', 'Berlin', 'Unter den Linden'),
('UK', 'London', 'Oxford Street'),
('Brazil', 'São Paulo', 'Avenida Paulista');

-- 2. area
INSERT INTO area (name) VALUES
('Kitchen'),
('Dining'),
('Bar'),
('Office'),
('Storage');

-- 3. role
INSERT INTO role (name, area_id) VALUES
('Chef', 1),
('Waiter', 2),
('Bartender', 3),
('Manager', 4),
('Cleaner', 5);

-- 4. customer
INSERT INTO customer (firstname, lastname, phone, email, address_id) VALUES
('John', 'Doe', '123-456-7890', 'john.doe@example.com', 1),
('Jane', 'Smith', '234-567-8901', 'jane.smith@example.com', 2),
('Carlos', 'Fernandez', '345-678-9012', 'carlos.fernandez@example.com', 3),
('Maria', 'Gonzalez', '456-789-0123', 'maria.gonzalez@example.com', 4),
('Liam', 'Brown', '567-890-1234', 'liam.brown@example.com', 5);

-- 5. employee
INSERT INTO employee (name, phone, email, role_id) VALUES
('Alice', '678-901-2345', 'alice@example.com', 1),
('Bob', '789-012-3456', 'bob@example.com', 2),
('Charlie', '890-123-4567', 'charlie@example.com', 3),
('David', '901-234-5678', 'david@example.com', 4),
('Eva', '012-345-6789', 'eva@example.com', 5);

-- 6. status
INSERT INTO status (value) VALUES
('Pending'),
('Confirmed'),
('Completed'),
('Canceled'),
('In Progress');

-- 7. customer_order
INSERT INTO customer_order (customer_id, employee_id, created_date, status_id, price) VALUES
(1, 1, '2024-09-25', 2, 59.99),
(2, 2, '2024-09-26', 2, 99.99),
(3, 3, '2024-09-27', 1, 45.50),
(4, 4, '2024-09-28', 1, 89.99),
(5, 5, '2024-09-29', 3, 129.99);

-- 8. restaurant_table
INSERT INTO restaurant_table (id) VALUES
(1),
(2),
(3),
(4),
(5);

-- 9. reservation
INSERT INTO reservation (description, customer_ID, restaurant_table_id, status_id) VALUES
('Dinner reservation for two', 1, 1, 3),
('Business meeting', 2, 2, 3),
('Family gathering', 3, 3, 4),
('Birthday party', 4, 4, 1),
('Anniversary celebration', 5, 5, 2);

-- 10. category
INSERT INTO category (name) VALUES
('Appetizers'),
('Main Course'),
('Desserts'),
('Beverages'),
('Salads');

-- 11. product
INSERT INTO product (name, description, unit_price, stock, category_id) VALUES
('Caesar Salad', 'Fresh romaine lettuce with Caesar dressing', 12.99, 20, 5),
('Grilled Chicken Sandwich', 'Grilled chicken breast with lettuce and tomato', 14.99, 15, 2),
('Cheesecake', 'A dessert made with a soft fresh cheese, eggs, and sugar', 6.99, 25, 3),
('Fresh Lemonade', 'Freshly squeezed lemonade', 3.99, 30, 4),
('Bruschetta', 'Toasted bread topped with tomatoes and basil', 5.99, 10, 1);

-- 12. material
INSERT INTO material (name, stock) VALUES
('Tomatoes', 100),
('Lettuce', 150),
('Chicken', 80),
('Cheese', 60),
('Bread', 90);

-- 13. product_has_material
INSERT INTO product_has_material (product_id, material_id) VALUES
(1, 1),
(1, 2),
(2, 3),
(3, 4),
(4, 5);

-- 14. supplier
INSERT INTO supplier (name, phone, email, address_id) VALUES
('Gourmet Goods Co.', '111-222-3333', 'info@gourmetgoods.com', 6),
('Fresh Finds Inc.', '222-333-4444', 'contact@freshfinds.com', 7),
('Epicurean Essentials', '333-444-5555', 'support@epicureanessentials.com', 8),
('Taste Buds Supply', '444-555-6666', 'hello@tastebudssupply.com', 9),
('Harvest Haven', '555-666-7777', 'sales@harvesthaven.com', 10);

-- 15. material_has_supplier
INSERT INTO material_has_supplier (material_id, supplier_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

-- 16. supplier_order
INSERT INTO supplier_order (price, created_date, employee_id, supplier_id, status_id) VALUES
(150.00, '2024-09-20', 1, 1, 1),
(250.00, '2024-09-21', 2, 2, 2),
(200.00, '2024-09-22', 3, 3, 4),
(350.00, '2024-09-23', 4, 4, 4),
(300.00, '2024-09-24', 5, 5, 5);

-- 17. supplier_order_has_material
INSERT INTO supplier_order_has_material (supplier_order_id, material_id, quantity) VALUES
(1, 1, 10),
(2, 2, 20),
(3, 3, 15),
(4, 4, 40),
(5, 5, 30);

-- 18. customer_order_has_product
INSERT INTO customer_order_has_product (customer_order_id, product_id, quantity) VALUES
(1, 1, 2),
(2, 2, 3),
(3, 3, 1),
(4, 4, 4),
(5, 5, 5);

-- 19. supplier_order_has_product
INSERT INTO supplier_order_has_product (supplier_order_id, product_id, quantity) VALUES
(1, 1, 10),
(2, 2, 15);

-- 20. product_has_supplier
INSERT INTO product_has_supplier (product_id, supplier_id) VALUES
(1, 1),
(2, 2);

-- 21. report
INSERT INTO report (file, employee_id) VALUES
(NULL, 1),
(NULL, 2),
(NULL, 3),
(NULL, 4),
(NULL, 5);