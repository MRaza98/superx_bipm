
WITH source AS 

    (SELECT * FROM {{ source('source', 'orders') }})

SELECT

    CAST(id AS INT) AS order_id
    , CAST(state AS STRING) AS order_state
    , CAST(timestamp as TIMESTAMP) AS order_timestamp
    , CAST(employee_id AS INT) AS employee_id
    , CAST(retailer_id AS INT) AS retailer_id

FROM source



