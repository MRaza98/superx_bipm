WITH shippings AS 

    (SELECT * FROM {{ ref('stg_shippings') }})

SELECT

    shipping_id
    , order_id
    , shipping_timestamp
    , retailer_id

FROM shippings