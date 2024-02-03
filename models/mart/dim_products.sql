

WITH base AS 

    (SELECT * FROM {{ ref('stg_materials') }})

SELECT 
    product_id
    , product_name
    , product_type
    , product_description
    , DATE_TRUNC(valid_from, DAY) AS valid_from
    , DATE_TRUNC(valid_to, DAY) AS valid_to
    
FROM base