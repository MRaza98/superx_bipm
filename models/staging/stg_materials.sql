
WITH source AS 

    (SELECT * FROM {{ ref('snapshot_materials') }})

SELECT

    CAST(id AS STRING) AS product_id
    , CAST(ean AS STRING) AS ean
    , CAST(name AS STRING) AS product_name
    , CAST(type AS STRING) AS product_type
    , CAST(timestamp AS TIMESTAMP) AS product_timestamp
    , CAST(description AS STRING) AS product_description
    , CAST(dbt_valid_from AS TIMESTAMP) AS valid_from
    , CAST({{ replace_null_with_infinity('dbt_valid_to') }} AS TIMESTAMP) AS valid_to

FROM source
