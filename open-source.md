---
title: Open source
image: projects.jpg
layout: default
---

## Open source contributions

Whenever possible I like to contribute bug fixes and improvements back to the open source libraries that I use. Here are some of my contributions:

{% assign items = site.data.open-source | sort: "end_year" | reverse %}
{% for item in items %}
- [{{ item.project }}]({{ item.url }}) ({% if item.start_year == item.end_year %}{{ item.end_year }}{% else %}{{ item.start_year }}-{{ item.end_year }}{% endif %})
  - [{{ item.desc }}]({{ item.code }}) {%- for tag in item.tags %} `{{tag}}`{:.tag} {%- endfor %}
{% endfor %}
