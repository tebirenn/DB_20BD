INSERT INTO customer(full_name, timestamp, delivery_address) values('Saudabekov Alan','2021-09-23 16:46:09','Nurly 340');
INSERT INTO orders values(1, 1, 1000, true);
INSERT INTO products values(1, 'apple','aport apples straight from Almaty', 600.00);
INSERT INTO order_items values(1, 1, 2);

UPDATE customer SET delivery_address='Sairan 1' WHERE id=1;
UPDATE orders SET total_sum=1200 where customer_id=1;
UPDATE products SET price=650.00 where name='apple';
UPDATE order_items SET quantity=3 where order_code=1;

DELETE FROM order_items WHERE order_code=1;
DELETE FROM products WHERE name='apple';
DELETE FROM orders WHERE code=1;
DELETE FROM customer WHERE id=1;
