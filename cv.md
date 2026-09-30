---
title: CV
layout: default
---

## Brief CV

{% for item in site.data.cv -%}
- {{ item.year }}:
  - {{ item.position }}
  - [{{ item.organization }}]({{ item.url }}), _{{ item.location }}_
{% endfor %}

## Full CV

- Download my [CV in pdf format](docs/CV-Liam-Keegan.pdf).
