
WITH base AS 

    (SELECT * FROM {{ ref('stg_retailers') }})

SELECT
-- using consolidated for reporting and default id for the join logic later on
    consolidated_retailer_id
    , retailer_id
    , retailer_state
    , retailer_name
    , retailer_region
    , retailer_category_consolidated AS retailer_category
    , retailer_country_consolidated AS retailer_country
    , DATE_TRUNC(valid_from, DAY) AS valid_from
    , DATE_TRUNC(valid_to, DAY) AS valid_to

FROM base