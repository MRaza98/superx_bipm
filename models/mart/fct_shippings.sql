WITH shippings AS 

    (SELECT * FROM {{ ref('stg_shippings') }})

SELECT

    shipping_id
    , order_id
    , shipping_timestamp
    , CAST(shipping_timestamp AS DATE) AS shipping_date
    , retailer_id

FROM shippings