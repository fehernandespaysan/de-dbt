 WITH source AS (
      SELECT * FROM {{ source('raw', 'stores_raw') }}
  ),

  cleaned AS (
      SELECT
          store AS store_id,
          type AS store_type,
          size AS store_size
      FROM source
  )

  SELECT * FROM cleaned