
{% macro standardize_text(column_name) %}
    lower(trim(cast({{ column_name }} as string)))
{% endmacro %}