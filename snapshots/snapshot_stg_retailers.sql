{% snapshot snapshot_stg_retailers %}

-- dbt recommended strategy is to use timestamp
-- assuming here that the timestamp column is the column
-- which updates when any retailer info changes

{{ 
    config(
        target_database = 'data-warehousing-402518',
        target_schema = 'snapshots',
        unique_key = 'id',
        
        strategy = 'timestamp',
        updated_at = 'timestamp'
    )

}}

SELECT * FROM {{ source('prod', 'retailers') }}

{% endsnapshot %}