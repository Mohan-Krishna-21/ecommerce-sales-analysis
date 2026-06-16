-- Superstore Sales Analysis
-- 6 business questions answered using SQL

-- =====================================================
-- Q1: Which category generates the most revenue and profit?
-- =====================================================
SELECT 
    category, 
    SUM(sales) AS total_sales, 
    SUM(profit) AS total_profit
FROM superstore
GROUP BY category
ORDER BY total_sales DESC;


-- =====================================================
-- Q2: Which region has the highest sales and most losses?
-- =====================================================
SELECT 
    region, 
    SUM(sales) AS total_sales, 
    SUM(profit) AS total_profit,
    CASE 
        WHEN SUM(profit) < 0 THEN 'Loss'
        ELSE 'Profit'
    END AS profit_status
FROM superstore
GROUP BY region 
ORDER BY total_profit ASC;


-- =====================================================
-- Q3: How does discount level impact profit?
-- =====================================================
SELECT 
    CASE 
        WHEN discount = 0 THEN 'No Discount'
        WHEN discount <= 0.20 THEN 'Low Discount'
        ELSE 'High Discount'
    END AS discount_level,
    COUNT(*) AS total_orders,
    AVG(profit) AS avg_profit,
    SUM(profit) AS total_profit
FROM superstore
GROUP BY discount_level
ORDER BY avg_profit DESC;


-- =====================================================
-- Q4: Which sub-categories are consistently losing money?
-- =====================================================
SELECT 
    sub_category,
    SUM(profit) AS total_profit
FROM superstore
GROUP BY sub_category
HAVING total_profit < 0
ORDER BY total_profit ASC;


-- =====================================================
-- Q5: Which customer segment is most valuable by revenue 
--     and avg order value?
-- Note: thresholds below are based on the actual distribution 
-- of avg_profit_per_order across segments (118.9, 64.3, 35.4),
-- not arbitrary fixed numbers.
-- =====================================================
SELECT 
    segment,
    SUM(sales) AS total_sales,
    AVG(sales) AS avg_order_value,
    AVG(profit) AS avg_profit_per_order,
    CASE
        WHEN AVG(profit) >= 90 THEN 'High Value'
        WHEN AVG(profit) >= 50 THEN 'Average Value'
        ELSE 'Low Value'
    END AS customer_value
FROM superstore
GROUP BY segment
ORDER BY avg_profit_per_order DESC;


-- =====================================================
-- Q6: Which ship mode is most used and delivers the 
--     highest avg order value?
-- Note: "most used" measured by order count (COUNT(*)), 
-- not total quantity shipped, since the two metrics can 
-- lead to different conclusions about customer behavior.
-- =====================================================
SELECT 
    ship_mode,
    COUNT(*) AS total_orders,
    AVG(sales) AS avg_order_value
FROM superstore
GROUP BY ship_mode
ORDER BY total_orders DESC;

