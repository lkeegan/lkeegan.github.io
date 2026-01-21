---
title: Projects
image: projects.jpg
layout: default
---

## Projects

Some open source projects I have worked on:

{%- for item in site.data.projects %}
- [{{ item.title }}]({{ item.url }}) ({{ item.year }})
  - {{item.desc}}
  - [Source code]({{ item.code }}) {%- for tag in item.tags %} `{{tag}}`{:.tag} {%- endfor %}
{%- endfor %}
