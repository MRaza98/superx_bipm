{% snapshot snapshot_materials %}

-- dbt recommended strategy is to use timestamp
-- assuming here that the timestamp column is the column
-- which updates when any material info changes

{{ 
    config(
        target_database = 'data-warehousing-402518',
        target_schema = 'snapshots',
        unique_key = 'id',
        
        strategy = 'timestamp',
        updated_at = 'timestamp'
    )

}}

SELECT * FROM {{ source('prod', 'materials') }}

{% endsnapshot %}