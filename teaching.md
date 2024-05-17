---
title: Teaching
image: teaching.jpg
layout: default
---

{% for section in site.data.teaching %}

## {{ section.title }}

{{ section.description }}:

{%- for item in section.items %}
- [{{ item.title }}]({{ item.link }}) ({{ item.year }})
{%- for bullet in item.bullets %}
  - {{ bullet }}
{%- endfor %}
{%- endfor %}

{% endfor %}
