 -- 1. What is the total amount each customer spent at the restaurant?
    
   SELECT customer_id, SUM(price) AS amount_spent
   FROM sales
   LEFT JOIN menu ON sales.product_id = menu.product_id 
   GROUP BY customer_id;
    
-- The best client is A with 170 spent, followed by B with 90 and then C with 70. 

-- 2. How many days has each customer visited the restaurant?

SELECT customer_id, COUNT(DISTINCT(order_date)) AS n_of_visits
FROM sales 
GROUP BY customer_id;

-- Customer A and B visited 3 times, while customer C twice. 

-- 3. What was the firt item from the menu pruchased by the each customer? 

-- SELECT MIN(order_date) AS primera_venta FROM sales

SELECT customer_id, product_name, order_date
FROM sales 
LEFT JOIN menu ON sales.product_id = menu.product_id 
WHERE order_date = "2024-03-01"
GROUP BY customer_id, product_name;

-- Customer A’s first order was spaghetti and ravioli
-- Customer B’s first order was ravioli
-- Customer C’s first order was spaguetti and ravioli

-- 4. What is the most purchased item on the menu and how many times was it purchased by all customers? 

SELECT MAX(product_name) AS name, sales.product_id, COUNT(sales.product_id) AS times_ordered
FROM sales
LEFT JOIN menu ON sales.product_id = menu.product_id
GROUP BY product_id
LIMIT 1;

-- The most purchased product is spaghetti which was ordered 6 times, then ravioli and canelloni both 3 times. 

-- 5. Which item was the most popular for each customer?

SELECT customer_id, product_name, COUNT(product_name) AS times_ordered
FROM sales
LEFT JOIN menu ON sales.product_id = menu.product_id
GROUP BY customer_id, product_name
ORDER BY customer_id, times_ordered DESC; 

-- The most popular product for each customer was: spaghetti for A and also C, and in the case of B this customer ordered the same number of time each one of the options on the menu. 

-- 6. Which item was purchased first by the customer after they became a member?

-- How much members does Marco have? 
SELECT COUNT(customer_id) -- 2 members
FROM members

-- Who are they? 

SELECT customer_id -- A and B
FROM members;

-- When member A has became member?

SELECT join_date, customer_id -- A 03-06 and B 03-08
FROM members;

-- Customer A
SELECT customer_id, order_date, product_name
FROM sales
LEFT JOIN menu ON sales.product_id = menu.product_id
WHERE customer_id = "A" AND order_date > "2024-03-06"
ORDER BY order_date
LIMIT 1;

-- Customer B
SELECT customer_id, order_date, product_name
FROM sales
LEFT JOIN menu ON sales.product_id = menu.product_id
WHERE customer_id = "B" AND order_date > "2024-03-08"
ORDER BY order_date
LIMIT 1; 
-- Customer B hasn’t ordered yet (after becoming a member).

-- In case we want to know all both members at same time: 

SELECT m.customer_id, m.join_date, s.order_date, s.product_id, menu.product_name
FROM members m
INNER JOIN sales s ON m.customer_id = s.customer_id
INNER JOIN menu ON s.product_id = menu.product_id
WHERE s.order_date > m.join_date
ORDER BY m.customer_id, s.order_date;

-- Only customer A is shown because that one is the only one that has ordered after becoming a member. 

-- 7. Which item was purchased just before the customer became a member?

SELECT customer_id, order_date, product_name
FROM sales
LEFT JOIN menu ON sales.product_id = menu.product_id
WHERE customer_id = "A" AND order_date < "2024-03-06"
ORDER BY order_date;

-- The last menu item ordered by customer A was spaghetti and ravioli.

SELECT customer_id, order_date, product_name
FROM sales
LEFT JOIN menu ON sales.product_id = menu.product_id
WHERE customer_id = "B" AND order_date < "2024-03-08"
ORDER BY order_date DESC
LIMIT 1;

-- The las menu item ordered by customer B was canelloni.

SELECT m.customer_id, m.join_date, s.order_date, s.product_id, menu.product_name
FROM members m
INNER JOIN sales s ON m.customer_id = s.customer_id -- with this inner join performed between the tables members and sales, I can retrieved the sales of each customer before the join date
INNER JOIN menu ON s.product_id = menu.product_id 
WHERE s.order_date < m.join_date
ORDER BY m.customer_id, s.order_date;

-- 8. What are the total items and amount spent by the customers before they became members?

SELECT m.customer_id, m.join_date, COUNT(product_name) AS total_items, SUM(price) AS total_spent
FROM members m
LEFT JOIN sales s ON m.customer_id = s.customer_id 
LEFT JOIN menu ON s.product_id = menu.product_id
WHERE s.order_date < m.join_date
GROUP BY m.customer_id, m.join_date
ORDER BY m.customer_id;

-- Client A and client B spent both 90 but A ordered 4 items from the menu while B only 3 (all that before becoming members).

-- 9. If each $1 spent equals to 10 points and canelloni has a 2X times multiplier, how many points would each client have? 

SELECT customer_id AS "Client", SUM(CASE WHEN product_name = "canelloni" THEN 20 * price ELSE 10 * price END) AS "Total points"
FROM sales
LEFT JOIN menu ON sales.product_id = menu.product_id 
GROUP BY customer_id

-- Total points for clientes A are 2500, 1300 for B and 700 for C customers. 

-- 10. Recreate the table with customer_id, order_date, product_name, price, member (YES or NO)

SELECT s.customer_id, s.order_date, menu.product_name, menu.price,
CASE
	WHEN s.order_date >= "2024-03-06" AND join_date IS NOT NULL THEN "YES"
    WHEN s.order_date >= "2024-03-08" AND join_date IS NOT NULL THEN "YES"
		ELSE "NO"
END AS "¿Member?"
FROM sales s
LEFT JOIN menu ON s.product_id = menu.product_id
LEFT JOIN members m ON s.customer_id = m.customer_id
ORDER BY s.customer_id;

-- 11. Ranking of customer products for members only. 

WITH cte AS
	(SELECT s.customer_id, s.order_date, menu.product_name, menu.price,
CASE
	WHEN s.order_date >= "2024-03-06" AND join_date IS NOT NULL THEN "YES"
    WHEN s.order_date >= "2024-03-08" AND join_date IS NOT NULL THEN "YES"
		ELSE "NO"
END AS member
FROM sales s
LEFT JOIN menu ON s.product_id = menu.product_id
LEFT JOIN members m ON s.customer_id = m.customer_id
ORDER BY s.customer_id)
SELECT *,
	CASE 
		WHEN member = "NO" THEN NULL
        ELSE RANK() OVER w
	END AS ranking
FROM cte
WINDOW w AS (PARTITION BY s.customer_id, member ORDER BY s.order_date);
