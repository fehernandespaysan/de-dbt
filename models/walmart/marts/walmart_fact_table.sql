WITH department AS (
    SELECT * FROM {{ ref('stg_department') }}
),

fact AS (
    SELECT * FROM {{ ref('stg_fact') }}
),

stores AS (
    SELECT * FROM {{ ref('walmart_store_dim') }}
),

dates AS (
    SELECT * FROM {{ ref('walmart_date_dim') }}
),

joined AS (
    SELECT
        d.store_id,
        d.dept_id,
        d.store_date,
        dt.date_key,
        d.weekly_sales,
        d.isholiday                         AS is_holiday,
        f.temperature,
        f.fuel_price,
        f.markdown1,
        f.markdown2,
        f.markdown3,
        f.markdown4,
        f.markdown5,
        f.cpi,
        f.unemployment,
        s.store_type,
        s.store_size,
        s.store_size_category,
        CURRENT_TIMESTAMP()                 AS dbt_loaded_at
    FROM department d
    LEFT JOIN fact f
        ON d.store_id = f.store_id
        AND d.store_date = f.store_date
    LEFT JOIN stores s
        ON d.store_id = s.store_id
    LEFT JOIN dates dt
        ON d.store_date = dt.full_date
)

SELECT * FROM joined