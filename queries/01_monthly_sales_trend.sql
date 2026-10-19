SELECT
  DATE_TRUNC(DATE(created_at), MONTH) AS month,
  ROUND(SUM(sale_price), 2) AS total_revenue,
  COUNT(DISTINCT order_id) AS total_orders
FROM `bigquery-public-data.thelook_ecommerce.order_items`
WHERE status = 'Complete'
GROUP BY 1
ORDER BY month DESC;
