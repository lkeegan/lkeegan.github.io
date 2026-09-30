---
title: Teaching
layout: default
---

{% for section in site.data.teaching %}
<section class="archive-section">
  <div class="archive-section-heading">
    <h2>{{ section.title }}</h2>
    <p>{{ section.description }}</p>
  </div>
  <div class="archive-list">
    {% for item in section.items %}
    <article class="archive-entry">
      <div class="archive-year">{{ item.years | join: ', ' }}</div>
      <div class="archive-details">
        <h3>{{ item.title }}</h3>
        {% if item.summary %}<p>{{ item.summary }}</p>{% endif %}
        <div class="archive-meta">
          <a class="project-source" href="{{ item.link }}">{{ section.link_label }} <span aria-hidden="true">↗</span></a>
          {% if item.source %}<a class="project-source" href="{{ item.source }}">Source code <span aria-hidden="true">↗</span></a>{% endif %}
        </div>
      </div>
    </article>
    {% endfor %}
  </div>
</section>
{% endfor %}
