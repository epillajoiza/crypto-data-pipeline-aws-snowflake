{% macro get_max_loaded_date(table_ref, column_name) %}

    {% set query %}
        select max({{ column_name }}) from {{ table_ref }}
    {% endset %}

    -- Ejecutamos la query y devolvemos el valor
    {% set result = run_query(query) %}

    {% if execute %}
        {% set max_date = result.columns[0][0] %}
        {{ return(max_date) }}
    {% else %}
        {{ return(none) }}
    {% endif %}

{% endmacro %}