
WITH orders AS 

    (SELECT * FROM {{ ref('fct_orders') }})

, retailers AS 

    (SELECT * FROM {{ ref('dim_retailers') }})

, orders_revenue_per_retailer AS (

    SELECT

        retailer_id
        , order_currency
        , DATE_TRUNC(order_time, MONTH) AS order_month
        , COUNT(DISTINCT order_id) AS n_orders
        , COUNT(order_line_id) AS n_items
        , SUM(price) AS amount

    FROM orders
    GROUP BY 1, 2, 3

)

, final AS (

    SELECT
        orders_revenue_per_retailer.*
        , retailer_name
        , retailer_category
        , retailer_country
        , retailer_region
        , retailer_state
    
    FROM orders_revenue_per_retailer
    LEFT JOIN retailers USING (retailer_id)

)

SELECT * FROM final