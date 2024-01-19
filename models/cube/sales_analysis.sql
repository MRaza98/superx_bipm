
WITH orders AS 

    (SELECT * FROM ref{{ fct_orders }})

, retailers AS 

    (SELECT * FROM ref{{ dim_retailers }})

, orders_revenue_per_retailer AS (

    SELECT

        retailer_id
        , retailer_name
        , order_currency
        , DATE_TRUNC(order_time, MONTH) AS order_month
        , COUNT(DISTINCT order_id) AS n_orders
        , COUNT(order_line_id) AS n_items
        , COUNT(order_line_id) / COUNT(DISTINCT order_id)
        , SUM(price) AS amount
        , 

    FROM orders
    LEFT JOIN retailers USING (retailer_id)
    GROUP BY 1, 2, 3, 4
)