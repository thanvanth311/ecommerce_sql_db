SELECT 
    users.name, 
    orders.id, 
    orders.order_date, 
    orders.status, 
    orders.total_amount
FROM users
INNER JOIN orders ON users.id = orders.user_id;


SELECT products.name,SUM(order_items.quantity) AS total_sold
FROM products
INNER JOIN order_items ON products.id = order_items.product_id
GROUP BY products.name
ORDER BY total_sold DESC;


SELECT SUM(amount) as total_revenue
FROM payments
WHERE payment_status = 'completed';


SELECT name,stock_quantity
FROM products 
WHERE stock_quantity < 50
ORDER BY stock_quantity ASC;


ROLLBACK;
BEGIN;
INSERT INTO orders (id, user_id, status, total_amount) 
VALUES (99, 11, 'delivered', 18500.00);
INSERT INTO order_items (order_id, product_id, quantity, price_at_purchase) 
VALUES (99, 4, 1, 18500.00);
UPDATE products SET stock_quantity = stock_quantity - 1 
WHERE id = 4;
COMMIT;


BEGIN;

INSERT INTO orders (id, user_id, status, total_amount) 
VALUES (100, 1, 'cancelled', 4500.00);

INSERT INTO payments (order_id, amount, payment_status, payment_method) 
VALUES (100, 4500.00, 'failed', 'Credit Card');

ROLLBACK;


