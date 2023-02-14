SELECT 
  u.id as user_id, u.age, u.gender, u.city, u.country,
  p.id as product_id, p.cost, p.category,
  o.order_id, o.status, o.num_of_item,
  oi.created_at, oi.sale_price,

CASE
  WHEN u.age <= 16 then 'Child'
  WHEN u.age > 17 and u.age <= 30 then 'Young'
  WHEN u.age > 31 and u.age <= 50 then 'Middle Age'
  ELSE 'Old'
END AS classification_age

FROM `bigquery-public-data.thelook_ecommerce.order_items` oi
  LEFT JOIN `bigquery-public-data.thelook_ecommerce.users` u ON oi.user_id = u.id
  LEFT JOIN `bigquery-public-data.thelook_ecommerce.products` p ON oi.product_id = p.id
  LEFT JOIN `bigquery-public-data.thelook_ecommerce.orders` o ON oi.order_id = o.order_id
