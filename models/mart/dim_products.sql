

WITH base AS 

    (SELECT * FROM {{ ref('stg_materials') }})

SELECT 
    product_id
    , product_name
    , product_type
    , product_description
FROM base