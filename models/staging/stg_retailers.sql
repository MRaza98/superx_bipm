
WITH source AS 

    (SELECT * FROM {{ source('prod', 'retailers') }})

, seed AS

    (SELECT * FROM {{ ref('retailer_category') }})

, base AS (

SELECT

    CAST(id AS INT) AS retailer_id
    , CAST(state AS STRING) AS retailer_state
    , CAST(name as TIMESTAMP) AS retailer_name
    , CAST(category AS INT) AS retailer_category
    , CAST(currency AS INT) AS retailer_currency

FROM source

)

SELECT
    * EXCEPT (retailer_category)
    , seed.consolidated_category
FROM base
JOIN seed ON seed.category = base.retailer_category