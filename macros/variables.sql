{% macro jinja_variable_test() %}
  {% set name = 'khaled' %}
  {{log("hello "~ name ,info=true)}} -- jinja var
  {{ log("hello ya "~ var("var", "This is replacement , var didnt set and no default in project yml" ), info=True) }}
{% endmacro %}