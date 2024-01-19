
WITH base AS 

    (SELECT * FROM {{ ref('stg_retailers') }})

SELECT

    consolidated_retailer_id AS retailer_id
    , retailer_state
    , retailer_name
    , retailer_region
    , retailer_category_consolidated AS retailer_category
    , retailer_country_consolidated AS retailer_country

FROM base