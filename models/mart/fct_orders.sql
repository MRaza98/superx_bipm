
WITH orders AS 

    (SELECT * FROM {{ ref('stg_orders') }})

, order_items AS

    (SELECT * FROM {{ ref('stg_order_items') }})

SELECT

    order_line_id
    , order_id
    , order_items.order_time
    , price
    , quantity
    , order_currency
    , retailer_id
    , order_state
    , employee_id

FROM order_items
LEFT JOIN orders USING (order_id)


