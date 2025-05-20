 -- Retrieve monthly sales revenue and the most frequently used payment method for each month.
 SELECT 
 	x.sale_month,  -- The sales month (formatted as YYYY-MM)
 	x.monthly_revenue,  -- Total sales revenue for that month
 	(
     	-- Subquery: Find the payment method that was used most frequently in the same month.
     	SELECT pm.payment_method  
     	FROM transaction_history th
     	JOIN payment_method pm 
       	ON th.payment_method_id = pm.payment_method_id  -- Join to get payment method details
     	WHERE DATE_FORMAT(th.transaction_date, '%Y-%m') = x.sale_month  -- Filter transactions to match the current month
     	GROUP BY pm.payment_method  -- Group by payment method
     	ORDER BY COUNT(*) DESC  -- Order by the count of transactions (most used first)
     	LIMIT 1  -- Retrieve only the top result (most frequently used)
 	) AS most_used_payment_method  -- Alias for the subquery result
 FROM
 (
 	-- Subquery x: Calculate total sales revenue per month.
 	SELECT 
     	DATE_FORMAT(s.sales_date, '%Y-%m') AS sale_month,  -- Format the sales date to extract the month (YYYY-MM)
     	SUM(s.total_sales_amount) AS monthly_revenue  -- Sum the total sales amount for that month
 	FROM sales s
 	GROUP BY DATE_FORMAT(s.sales_date, '%Y-%m')  -- Group the results by month
 ) AS x
 ORDER BY x.sale_month DESC;  -- Order the final results by month in descending order
 
 
 -- Retrieves shipments that were delivered after the expected delivery date, along with customer information and the delay duration.
 SELECT 
 	s.shipment_id,                   	-- Shipment identifier
 	s.order_id,                      	-- Associated order ID
 	s.shipping_date,                 	-- Date when the shipment was dispatched
 	s.delivery_date,                 	-- Expected delivery date
 	s.actual_delivery_date,          	-- Actual delivery date of the shipment
 	DATEDIFF(s.actual_delivery_date, s.delivery_date) AS delay_days,  -- Calculate delay (in days) between actual and expected delivery
 	c.customer_fname,                	-- Customer's first name
 	c.customer_lname                 	-- Customer's last name
 FROM shipments s
 JOIN orders o 
 	ON s.order_id = o.order_id       	-- Join shipments with orders to get order details
 JOIN customer c 
 	ON o.customer_id = c.customer_id  	-- Join orders with customers to retrieve customer details
 WHERE s.actual_delivery_date > s.delivery_date  -- Filter: only include shipments that were delivered late
 ORDER BY delay_days DESC;           	-- Order the results by the number of delay days in descending order

 -- Retrieve Products with Discounts and Products without Discounts    
-- Products with discounts

SELECT 
    p.product_id, -- Select product ID
    p.product_name, -- Select product name
    d.discount_percentage, -- Select discount percentage
    'With Discount' AS discount_status -- Label as 'With Discount'
FROM 
    product p
JOIN 
    discount d ON p.product_id = d.product_id -- Join discount table on product ID

UNION

-- Products without discounts
SELECT 
    p.product_id, -- Select product ID
    p.product_name, -- Select product name
    NULL AS discount_percentage, -- No discount percentage
    'Without Discount' AS discount_status -- Label as 'Without Discount'
FROM 
    product p
LEFT JOIN 
    discount d ON p.product_id = d.product_id -- Left join discount table on product ID
WHERE 
    d.product_id IS NULL -- Filter for products without discounts

ORDER BY 
    product_id; -- Order by product ID

-- Retrieve Products and Their Categories Along with Vendor Details:*/
SELECT 
    p.product_name, 
    p.category AS category_name, 
    p.description AS category_description, 
    p.price, 
    p.stock_quantity, 
    v.vendor_name, 
    v.vendor_city,
    CASE 
        WHEN p.stock_quantity < 10 THEN 'Low Stock'
        WHEN p.stock_quantity BETWEEN 10 AND 50 THEN 'Medium Stock'
        ELSE 'High Stock'
    END AS stock_status
FROM Product p
JOIN Vendor v ON p.vendor_id = v.vendor_id -- Ensuring products are linked to their respective vendors
WHERE p.price > 50.00 -- Filter for products priced above $50
  AND v.vendor_city IS NOT NULL -- Ensure vendor city information exists
ORDER BY p.price DESC, p.stock_quantity ASC -- Sort by price (descending) and stock quantity (ascending)
LIMIT 1000; -- Limit to the top 1000 rows for performance


-- Identify the product that has generated the highest revenue: (Annu Choudhary) */

SELECT p.product_name, SUM(o.total_amount) AS total_revenue
FROM product p
JOIN orders o ON p.product_id = o.customer_id
GROUP BY p.product_name
HAVING SUM(o.total_amount) = (
    SELECT MAX(total_revenue)
    FROM (
        SELECT SUM(total_amount) AS total_revenue
        FROM product p2
        JOIN orders o2 ON p2.product_id = o2.customer_id
        GROUP BY p2.product_name
    ) AS revenue_subquery
);

-- Top 5 Customers by Purchase (Last 6 Months) (Annu Choudhary)
SELECT 
    c.customer_id,
    CONCAT(c.customer_fname, ' ', c.customer_lname) AS full_name,
    c.email_id,
    SUM(o.total_amount) AS total_spent,
    GROUP_CONCAT(DISTINCT p.category SEPARATOR ', ') AS categories_purchased
FROM 
    customer c
JOIN 
    orders o ON c.customer_id = o.customer_id
JOIN 
    order_items oi ON o.order_id = oi.order_id
JOIN 
    product p ON oi.product_id = p.product_id
WHERE 
    o.order_date >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH)
GROUP BY 
    c.customer_id
ORDER BY 
    total_spent DESC
LIMIT 5;


-- Vendor Performance Dashboard (Last 30 Days)
SELECT 
    v.vendor_id,
    v.vendor_name,
    COUNT(DISTINCT oi.order_item_id) AS products_sold,
    SUM(oi.quantity * oi.price) AS total_revenue,
    ROUND(AVG(r.rating), 2) AS avg_rating
FROM 
    vendor v
JOIN 
    product p ON v.vendor_id = p.vendor_id
JOIN 
    order_items oi ON p.product_id = oi.product_id
JOIN 
    orders o ON oi.order_id = o.order_id
LEFT JOIN 
    reviews r ON p.product_id = r.product_id
WHERE 
    o.order_date >= DATE_SUB(CURDATE(), INTERVAL 30 DAY)
GROUP BY 
    v.vendor_id, v.vendor_name
ORDER BY 
    total_revenue DESC;





--  Daily Sales Trend with Category Breakdown (Last 15 Days)
  
SELECT 
    DATE(o.order_date) AS order_day,
    p.category,
    SUM(oi.quantity * oi.price) AS revenue
FROM 
    orders o
JOIN 
    order_items oi ON o.order_id = oi.order_id
JOIN 
    product p ON oi.product_id = p.product_id
WHERE 
    o.order_date >= DATE_SUB(CURDATE(), INTERVAL 15 DAY)
GROUP BY 
    order_day, p.category
ORDER BY 
    order_day DESC, revenue DESC;

    









 