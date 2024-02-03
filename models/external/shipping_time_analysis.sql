
WITH shippings AS 

    (SELECT * FROM {{ ref('fct_shippings') }})

, orders AS

    (SELECT * FROM {{ ref('fct_orders') }})

, retailers AS (

    (SELECT * FROM {{ ref('dim_retailers') }})

)

SELECT DISTINCT
    order_id
    , shipping_id
    , orders.retailer_id
    , retailer_country
    , DATE_DIFF(shipping_date, order_date, DAY) AS days_to_ship
FROM orders
JOIN shippings USING (order_id)
JOIN retailers ON orders.retailer_id = retailers.retailer_id
