
WITH source AS 

    (SELECT * FROM {{ source('prod', 'retailers') }})

, seed AS

    (SELECT * FROM {{ ref('retailer_category_mapping') }})

, base AS (

SELECT

    CAST(id AS INT) AS retailer_id
    , CAST(state AS STRING) AS retailer_state
    , CAST(name as STRING) AS retailer_name
    , CAST(category AS STRING) AS retailer_category
    , CAST(currency AS STRING) AS retailer_currency

FROM source

)

SELECT
    * EXCEPT (retailer_category)
FROM base
JOIN seed USING (retailer_category)