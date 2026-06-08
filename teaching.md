---
title: Teaching
image: teaching.jpg
layout: default
---

{% for section in site.data.teaching %}

## {{ section.title }}

{{ section.description }}:

{%- assign items = section.items | sort: "years" | reverse %}
{%- for item in items %}
- [{{ item.title }}]({{ item.link }}) ({{ item.years | join: ", " }})
{%- for bullet in item.bullets %}
  - {{ bullet }}
{%- endfor %}
{%- endfor %}

{% endfor %}
