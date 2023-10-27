

{% set my_cool_string = 'this is jinja' %}

{{ my_cool_string }}

{% set my_list = ['first_value', 'second_value']%}

{{ my_list[0] }}

{% for value in my_list %}

    This is a value: {{ value }}

{%- endfor -%}




{% set temperature = 17 %}

{% if temperature > 18 %}
Drink a Coke
{% else %}
Drink maybe a hot chocolate, but that is up to you.
{% endif %}



{% set my_dict = {
    'key1' : 'val1'
    , 'key2' : 'val2'
}%}

{{ my_dict }}