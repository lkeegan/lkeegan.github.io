---
title: Open source
image: projects.jpg
layout: default
---

## Open source contributions

Whenever possible I like to contribute bug fixes and improvements back to the open source libraries that I use. Here are some of my contributions:

{%- for item in site.data.open-source %}
- [{{ item.project }}]({{ item.url }}) ({{ item.year }})
  - [{{ item.desc }}]({{ item.code }})
{%- endfor %}
