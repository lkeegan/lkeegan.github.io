---
title: Projects
layout: default
---

{% for section in site.data.projects %}

## {{ section.title }}

{{ section.description }}:

{% for item in section.items -%}
- [{{ item.title }}]({{ item.url }}) ({{ item.year }})
  - {{item.desc}}
  - [Source code]({{ item.code }}) \[_{{item.stack}}_\]
{% endfor %}

{% endfor %}
