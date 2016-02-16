-- 1. Get the cities of agents booking an order for a customer whose cid is 'c002'
SELECT city
FROM agents
WHERE aid IN (SELECT aid
              FROM orders
              WHERE cid = 'c002');
-- 2. Get the ids of products ordered through any agent who takes at least one order 
--    from a customer in Dallas,sorted by pid from highest to lowest
SELECT pid
FROM orders
WHERE aid IN (SELECT aid
                FROM orders 
                WHERE cid IN (SELECT cid
                              FROM customers
                              WHERE city = 'Dallas'))
ORDER BY pid DESC;
-- 3. Get the ids and names of customers who did not place an order through agent a01
SELECT cid, name
FROM customers
WHERE cid NOT IN (SELECT cid
                  FROM orders
                  WHERE aid = 'a01');
-- 4. Get the ids of customers who ordered both product p01 and p07.
SELECT cid
FROM customers
WHERE cid IN (SELECT cid
              FROM orders
              WHERE pid = 'p01')
AND cid IN (SELECT cid
            FROM orders
            WHERE pid = 'p07');
-- 5. Get the ids of products not ordered by any customers who placed any order through
--    agent a07 in pid order from highest to lowest.
SELECT DISTINCT pid
FROM orders
WHERE cid NOT IN (SELECT cid
                  FROM orders
                  WHERE aid = 'a07')
ORDER BY pid DESC;
-- 6. Get the name, discounts, and city for all customers who place orders
--    through agents in London or New York.
SELECT name, discount, city
FROM customers
WHERE cid IN (SELECT cid
              FROM orders
              WHERE aid IN (SELECT aid
                            FROM agents
                            WHERE city = 'London'
                            OR city = 'New York')); 
-- 7. Get all customers who have the same discount as that of any customers
--    in Dallas or London
SELECT name
FROM customers
WHERE discount IN (SELECT discount
                   FROM customers
                   WHERE city = 'Dallas'
                   OR city = 'London');
-- 8.
-- Constraints are limitations or restrictions to our database. They can be used to 
-- specify certain rules for data in a table. An advantage to using constraints in our
-- database could be to link tables together based on their primary and foreign keys.
-- Another reason we may need constraints in our database would be to create a check
-- constraint on a column or table. A good example of a check constraint could be if
-- we are identifying products by an id, we dont want to be able to ask for product
-- id's that less than or equal to 0 because they are not linked to any products.
-- A bad use for a check constraint would be to limit a products id list to only 10
-- id's. This would leave no room for expansion if our customer decides to add new
-- products to the table. The difference between these examples come from trying to
-- restrain our product values to only valid product numbers. In the first example
-- if our customer has 10 products with the id's 1-10, we are able to add an 11th
-- product with ease. In our second example though, if we wish to add a new product
-- we will have to adjust our check constraint.