{% macro replace_null_with_infinity(column_name) %}

    COALESCE({{ column_name }}, '9999-12-31 00:00:00')

{% endmacro %}