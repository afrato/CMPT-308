-- List the ordno and dollars of all orders.
SELECT ordno, dollars
FROM orders;
-- List the name and city of agents named Smith.
SELECT name, city
FROM agents
WHERE name = 'Smith';
-- List the pid, name, and priceUSD of products with quantity more than 208,000.
SELECT pid, name, priceUSD
FROM products
WHERE quantity> 208000;
-- List the name and cities of customers in Dallas.
SELECT name, city
FROM customers
WHERE city = 'Dallas';
-- List the names of agents not in New York and not in Tokyo
SELECT name
FROM agents
WHERE city <> 'New York'
AND city <> 'Tokyo';
-- List all data for products not in Dallas or Duluth that cost US$1 or more.
SELECT *
FROM products
WHERE city NOT IN('Dallas','Duluth')
AND priceUSD >= 1;
-- List all data for orders in January or March
SELECT *
FROM orders
WHERE mon IN('jan','mar');
-- List all data for orders in February less than US$500.
SELECT *
FROM orders
WHERE mon ='feb'
AND dollars < 500;
--List all orders from the customer whose cid is C005
SELECT ordno
FROM orders
WHERE cid = 'C005';