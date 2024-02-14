
WITH orders AS 

    (SELECT * FROM {{ ref('fct_orders') }})

, retailers AS 

    (SELECT * FROM {{ ref('dim_retailers') }})

,orders_revenue_per_retailer AS (

    SELECT

        retailer_id
        , order_currency
        , DATE_TRUNC(order_time, DAY) AS order_date
        , DATE_TRUNC(order_time, MONTH) AS order_month
        , order_state
        , COUNT(DISTINCT order_id) AS n_orders
        , COUNT(order_line_id) AS n_items
        , SUM(price) AS amount
        , SUM(EUR_price) as EUR_amount

    FROM orders
    GROUP BY 1, 2, 3, 4, 5

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
    LEFT JOIN retailers ON retailers.retailer_id = orders_revenue_per_retailer.retailer_id
    AND orders_revenue_per_retailer.order_date BETWEEN retailers.valid_from AND retailers.valid_to

)

SELECT * FROM final