
WITH source AS 

    (SELECT * FROM {{ source('prod', 'order_items') }})

, base AS (

    SELECT

        CAST(id AS INT) AS order_line_id
        , CAST(price AS NUMERIC) AS price
        , CAST(currency AS STRING) AS currency
        , CAST(order_id AS INT) AS order_id
        , CAST(quantity AS INT) AS quantity
        , CAST(timestamp AS TIMESTAMP) AS order_time
        , CAST(material_id AS STRING) AS product_id

    FROM source
)

-- Temporary table to determine the currency for each order_id
, currency_cte AS (

  SELECT 

    order_id
    , MAX(currency) AS order_currency

  FROM 
    base
  GROUP BY 
    1

)

, consolidated_currency AS (

    SELECT
        base.* EXCEPT (currency)
        , order_currency

    FROM base
    LEFT JOIN currency_cte USING (order_id)

)

SELECT * FROM consolidated_currency


