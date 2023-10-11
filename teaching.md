---
title: Teaching
layout: default
---

{% for section in site.data.teaching %}

## {{ section.title }}

{{ section.description }}:

{% for item in section.items -%}
- {{ item.title }} ({{ item.year }})
{% for link in item.links -%}[{{ link[0] }}]({{ link[1] }}){:.tag} {% endfor %}
{% endfor %}

{% endfor %}
