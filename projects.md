---
title: Projects
image: projects.jpg
layout: default
---

## Projects

Some open source projects I have worked on:

{% assign items = site.data.projects | sort: "end_year" | reverse %}
{% for item in items %}
- [{{ item.title }}]({{ item.url }}) ({% if item.start_year == item.end_year %}{{ item.end_year }}{% else %}{{ item.start_year }}-{{ item.end_year }}{% endif %})
  - {{item.desc}}
  - [Source code]({{ item.code }}) {%- for tag in item.tags %} `{{tag}}`{:.tag} {%- endfor %}
{% endfor %}
