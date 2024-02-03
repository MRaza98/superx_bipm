
WITH orders AS 

    (SELECT * FROM {{ ref('stg_orders') }})

, order_items AS

    (SELECT * FROM {{ ref('stg_order_items') }})

, exchange_rates AS 

    (SELECT * FROM {{ ref('exchange_rates') }})

, consolidating_currencies AS (

    SELECT
        *
        , ROUND(price * factor, 2) AS EUR_price
    FROM order_items
    LEFT JOIN exchange_rates ON exchange_rates.currency_from = order_items.order_currency

)

SELECT

    order_line_id
    , order_id
    , consolidating_currencies.order_time
    , CAST(consolidating_currencies.order_time AS DATE) AS order_date
    , price
    , EUR_price
    , quantity
    , product_id
    , order_currency
    , retailer_id
    , order_state
    , employee_id

FROM consolidating_currencies
LEFT JOIN orders USING (order_id)


