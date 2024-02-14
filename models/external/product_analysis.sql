WITH orders AS (SELECT * FROM {{ ref('fct_orders') }}),

products AS (SELECT * FROM {{ ref('dim_products') }}),

orders_revenue_per_product AS (

    SELECT

        product_id,
        order_currency,
        order_states,
        DATE_TRUNC(order_time, DAY) AS order_dates,
        DATE_TRUNC(order_time, MONTH) AS order_month,
        COUNT(*) AS n_orders,
        SUM(price) AS amount,
        SUM(eur_price) AS eur_amount

    FROM orders
    GROUP BY 1, 2, 3, 4, 5

),

final AS (

    SELECT
        orders_revenue_per_product.*,
        products.product_name,
        products.product_type

    FROM orders_revenue_per_product
    LEFT JOIN products ON
        orders_revenue_per_product.product_id = products.product_id
        AND orders_revenue_per_product.order_date
        BETWEEN products.valid_from AND products.valid_to

)

SELECT * FROM final
