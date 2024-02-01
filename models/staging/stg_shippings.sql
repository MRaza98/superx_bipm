WITH source AS 

    (SELECT * FROM {{ source('prod', 'shippings') }})

SELECT

    CAST(id AS STRING) AS shipping_id
    , CAST(order_id AS STRING) AS order_id
    , CAST(timestamp AS TIMESTAMP) AS shipping_timestamp
    , CAST(retailer_id AS STRING) AS retailer_id

FROM source