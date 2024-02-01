{% snapshot snapshot_stg_materials %}

{{ 
    config(
        target_database = 'data-warehousing-402518',
        target_schema = 'staging',
        unique_key = 'id',
        
        strategy = 'timestamp',
        updated_at = 'timestamp'
    )

}}

SELECT * FROM {{ source('prod', 'materials') }}

{% endsnapshot %}