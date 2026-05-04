SELECT
    exchange_id AS exchange_key,
    name AS exchange_name,
    country AS exchange_country
FROM {{ source('RAW', 'DIM_EXCHANGE') }}