
WITH source AS 

    (SELECT * FROM {{ source('prod', 'retailers') }})

, retailer_category_mapping AS

    (SELECT * FROM {{ ref('retailer_category_mapping') }})

, retailer_country_mapping AS

    (SELECT * FROM {{ ref('retailer_country_mapping') }})

, base AS (

SELECT

    CAST(id AS INT) AS retailer_id
    , CAST(state AS STRING) AS retailer_state
    , CAST(name as STRING) AS retailer_name
    , CAST(category AS STRING) AS retailer_category
    , CAST(currency AS STRING) AS retailer_currency
    , CAST(address AS STRING) AS retailer_address

FROM source

)

, id_refined AS (

    SELECT
        *
        , CASE WHEN retailer_id = 101 THEN 83 ELSE retailer_id END AS consolidated_retailer_id
    FROM base

) 

, address_refined AS (

    SELECT
        *
        , TRIM(REGEXP_EXTRACT(retailer_address, r'[^,]+$')) AS retailer_country
        , TRIM(REGEXP_EXTRACT(retailer_address, r'([^,]+),[^,]+$')) AS retailer_region
    FROM id_refined
    
)

SELECT
    * EXCEPT (retailer_category, retailer_country)
FROM address_refined
JOIN retailer_category_mapping USING (retailer_category)
JOIN retailer_country_mapping USING(retailer_country)