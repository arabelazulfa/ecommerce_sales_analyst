WITH CustomerSpending AS (
  SELECT
    user_id,
    ROUND(SUM(sale_price), 2) AS total_spent,
    COUNT(DISTINCT order_id) AS total_orders
  FROM `bigquery-public-data.thelook_ecommerce.order_items`
  WHERE status = 'Complete'
  GROUP BY user_id
)
SELECT
  user_id,
  total_spent,
  total_orders,
  CASE
    WHEN total_spent >= 500 THEN 'VIP Customer'
    WHEN total_spent Between 150 AND 499.99 THEN 'Loyal Customer'
    ELSE 'Regular Customer'
  END AS customer_tier
FROM CustomerSpending
ORDER BY total_spent DESC
LIMIT 50;
