WITH date_spine AS (
    SELECT DISTINCT
        store_date
    FROM {{ ref('stg_fact') }}
),

transformed AS (
    SELECT
        TO_NUMBER(TO_CHAR(store_date, 'YYYYMMDD'))  AS date_key,
        store_date                                   AS full_date,
        YEAR(store_date)                             AS year,
        QUARTER(store_date)                          AS quarter,
        MONTH(store_date)                            AS month,
        MONTHNAME(store_date)                        AS month_name,
        WEEK(store_date)                             AS week_of_year,
        DAYOFWEEK(store_date)                        AS day_of_week,
        DAYNAME(store_date)                          AS day_name,
        DAYOFYEAR(store_date)                        AS day_of_year,
        CASE WHEN DAYOFWEEK(store_date) IN (1, 7)
             THEN TRUE ELSE FALSE END                AS is_weekend
    FROM date_spine
)

SELECT * FROM transformed