-- =====================================================================
-- 06 SUBQUERIES, CTEs, WINDOW FUNCTIONS, SET OPERATORS
-- =====================================================================

-- ---------- Subquery in WHERE ----------
SELECT name, price FROM products
WHERE price > (SELECT AVG(price) FROM products);

SELECT first_name FROM customers
WHERE customer_id IN (SELECT customer_id FROM orders WHERE status = 'delivered');

-- EXISTS: often faster than IN for large tables
SELECT first_name FROM customers c
WHERE EXISTS (SELECT 1 FROM orders o WHERE o.customer_id = c.customer_id);

SELECT first_name FROM customers c
WHERE NOT EXISTS (SELECT 1 FROM orders o WHERE o.customer_id = c.customer_id);

-- ANY / ALL
SELECT name, price FROM products WHERE price > ALL (SELECT price FROM products WHERE category_id = 2);

-- ---------- Subquery in SELECT (scalar) and FROM (derived table) ----------
SELECT c.first_name,
       (SELECT COUNT(*) FROM orders o WHERE o.customer_id = c.customer_id) AS order_count
FROM customers c;

SELECT t.customer_id, t.total
FROM (
    SELECT o.customer_id, SUM(oi.quantity * oi.unit_price) AS total
    FROM orders o JOIN order_items oi USING (order_id)
    GROUP BY o.customer_id
) AS t
WHERE t.total > 100000;

-- ---------- CTE (WITH): readable named subqueries ----------
WITH order_totals AS (
    SELECT o.order_id, o.customer_id, SUM(oi.quantity * oi.unit_price) AS total
    FROM orders o JOIN order_items oi USING (order_id)
    WHERE o.status <> 'cancelled'
    GROUP BY o.order_id, o.customer_id
),
customer_totals AS (
    SELECT customer_id, SUM(total) AS lifetime_value, COUNT(*) AS orders
    FROM order_totals
    GROUP BY customer_id
)
SELECT c.first_name, ct.orders, ct.lifetime_value
FROM customer_totals ct
JOIN customers c USING (customer_id)
ORDER BY ct.lifetime_value DESC;

-- RECURSIVE CTE: numbers 1..10, also used for trees (org charts, categories)
WITH RECURSIVE nums AS (
    SELECT 1 AS n
    UNION ALL
    SELECT n + 1 FROM nums WHERE n < 10
)
SELECT * FROM nums;

-- ---------- WINDOW FUNCTIONS: calculate across rows WITHOUT collapsing them ----------
-- Syntax: function() OVER (PARTITION BY ... ORDER BY ...)

SELECT name, category_id, price,
       ROW_NUMBER() OVER (PARTITION BY category_id ORDER BY price DESC) AS row_num,
       RANK()       OVER (PARTITION BY category_id ORDER BY price DESC) AS rnk,
       DENSE_RANK() OVER (ORDER BY price DESC)                          AS dense_rnk,
       AVG(price)   OVER (PARTITION BY category_id)                     AS category_avg,
       price - AVG(price) OVER (PARTITION BY category_id)               AS diff_from_avg
FROM products;

-- Top product per category (classic interview question)
SELECT * FROM (
    SELECT name, category_id, price,
           ROW_NUMBER() OVER (PARTITION BY category_id ORDER BY price DESC) AS rn
    FROM products
) x WHERE rn = 1;

-- Running total and previous/next row
SELECT order_id, order_date,
       SUM(order_id) OVER (ORDER BY order_date)           AS running_sum,
       LAG(order_date)  OVER (ORDER BY order_date)        AS previous_order_date,
       LEAD(order_date) OVER (ORDER BY order_date)        AS next_order_date
FROM orders;

SELECT NTILE(4) OVER (ORDER BY price) AS quartile, name, price FROM products;

-- ---------- SET OPERATORS ----------
SELECT city FROM customers WHERE country = 'Uganda'
UNION                                      -- combine, remove duplicates (UNION ALL keeps them)
SELECT city FROM customers WHERE country = 'Kenya';

SELECT customer_id FROM customers
EXCEPT                                     -- in first, not in second
SELECT customer_id FROM orders;

SELECT customer_id FROM customers WHERE country = 'Uganda'
INTERSECT                                  -- in both
SELECT customer_id FROM orders;
