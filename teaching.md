---
title: Teaching
layout: default
---

{% for section in site.data.teaching %}

## {{ section.title }}

{{ section.description }}:

{% for item in section.items %}

- {{ item.title }} ({{ item.year }}): [slides]({{ item.slides }}), [code]({{ item.code }})

{% endfor %}

{% endfor %}
