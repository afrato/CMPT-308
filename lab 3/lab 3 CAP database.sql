<<<<<<< HEAD
-- 1. List the ordno and dollars of all orders.
=======
-- List the ordno and dollars of all orders.
>>>>>>> 4b84c3cdc987117a1e227c85d0a71a5732709dfe
SELECT ordno, dollars
FROM orders;
-- 2. List the name and city of agents named Smith.
SELECT name, city
FROM agents
WHERE name = 'Smith';
-- 3. List the pid, name, and priceUSD of products with quantity more than 208,000.
SELECT pid, name, priceUSD
FROM products
WHERE quantity> 208000;
-- 4. List the name and cities of customers in Dallas.
SELECT name, city
FROM customers
WHERE city = 'Dallas';
-- 5. List the names of agents not in New York and not in Tokyo
SELECT name
FROM agents
WHERE city <> 'New York'
AND city <> 'Tokyo';
-- 6. List all data for products not in Dallas or Duluth that cost US$1 or more.
SELECT *
FROM products
WHERE city NOT IN('Dallas','Duluth')
AND priceUSD >= 1;
-- 7. List all data for orders in January or March
SELECT *
FROM orders
WHERE mon IN('jan','mar');
-- 8. List all data for orders in February less than US$500.
SELECT *
FROM orders
WHERE mon ='feb'
AND dollars < 500;
<<<<<<< HEAD
-- 9. List all orders from the customer whose cid is C005
=======
-- List all orders from the customer whose cid is C005
>>>>>>> 4b84c3cdc987117a1e227c85d0a71a5732709dfe
SELECT ordno
FROM orders
WHERE cid = 'C005';