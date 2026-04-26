WITH source AS (
    SELECT * FROM {{ source('raw', 'fact_raw') }}
),

cleaned AS (
    SELECT
        store AS store_id,
        date AS store_date,
        temperature,
        fuel_price,
        COALESCE(markdown1, 0) AS markdown1,
        COALESCE(markdown2, 0) AS markdown2,
        COALESCE(markdown3, 0) AS markdown3,
        COALESCE(markdown4, 0) AS markdown4,
        COALESCE(markdown5, 0) AS markdown5,
        cpi,
        unemployment,
        isholiday
    FROM source
)

SELECT * FROM cleaned