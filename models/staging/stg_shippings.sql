WITH source AS 

    (SELECT * FROM {{ source('prod', 'shippings') }})

SELECT

    CAST(id AS INT) AS shipping_id
    , CAST(order_id AS INT) AS order_id
    , CAST(timestamp AS TIMESTAMP) AS shipping_timestamp
    , CAST(retailer_id AS STRING) AS retailer_id

FROM source