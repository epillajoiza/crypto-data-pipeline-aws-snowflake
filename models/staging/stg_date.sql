SELECT
    CAST(date_day AS DATE) AS date_key,
    year AS calendar_year,
    month AS calendar_month,
    quarter AS calendar_quarter,
    day_name AS day_of_week
FROM {{ source('RAW', 'DIM_DATE') }}