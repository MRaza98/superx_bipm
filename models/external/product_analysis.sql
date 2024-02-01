
WITH orders AS 

    (SELECT * FROM {{ ref('fct_orders') }})

, products AS 

    (SELECT * FROM {{ ref('dim_products') }})

, orders_revenue_per_product AS (

    SELECT

        product_id
        , order_currency
        , DATE_TRUNC(order_time, MONTH) AS order_month
        , order_state
        , COUNT(*) AS n_orders
        , SUM(price) AS amount

    FROM orders
    GROUP BY 1, 2, 3, 4

)

, final AS (

    SELECT
        orders_revenue_per_product.*
        , product_name
        , product_type
    
    FROM orders_revenue_per_product
    LEFT JOIN products USING (product_id)

)

SELECT * FROM final