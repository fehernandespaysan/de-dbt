WITH stores AS (
    SELECT * FROM {{ ref('stg_stores') }}
),

transformed AS (
    SELECT
        store_id,
        store_type,
        store_size,
        CASE
            WHEN store_type = 'A' THEN 'Large'
            WHEN store_type = 'B' THEN 'Medium'
            WHEN store_type = 'C' THEN 'Small'
            ELSE 'Unknown'
        END                         AS store_size_category,
        CURRENT_TIMESTAMP()         AS dbt_updated_at
    FROM stores
)

SELECT * FROM transformed