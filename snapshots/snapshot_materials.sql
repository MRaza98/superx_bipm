-- {% snapshot snapshot_materials %}

-- {{ 
--     config(
--         target_database = 'data-warehousing-402518',
--         target_schema = 'snapshots',
--         unique_key = 'id',
        
--         strategy = 'check',
--         check_cols = ['name', 'description', 'type'])

-- }}

-- SELECT * FROM {{ source('source', 'materials') }}

-- {{% endsnapshot %}}