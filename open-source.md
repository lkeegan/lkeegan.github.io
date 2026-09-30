---
title: Open source
layout: default
---

<div class="compact-intro">
  <h1>Open source contributions</h1>
  <p>Whenever possible I contribute bug fixes and improvements back to the open-source libraries I use.</p>
</div>

<div class="projects-layout">
  {% include technology-panel.html all_label="All contributions" singular="contribution" plural="contributions" %}

  <div class="projects-main">
    <p id="project-filter-status" class="project-filter-status" aria-live="polite" hidden></p>
    <div class="archive-list">
      {% assign year_groups = site.data.open-source | group_by: 'end_year' | sort: 'name' | reverse %}
      {% for year_group in year_groups %}
      {% for item in year_group.items %}
      <article class="archive-entry filterable-entry" data-title="{{ item.project | escape }}" data-tags="{{ item.tags | jsonify | escape }}">
        <div class="archive-year">{% if item.start_year == item.end_year %}{{ item.end_year }}{% else %}{{ item.start_year }}–{{ item.end_year }}{% endif %}</div>
        <div class="archive-details">
          <h2><a href="{{ item.url }}">{{ item.project }} <span aria-hidden="true">↗</span></a></h2>
          <div class="archive-description">{{ item.desc | markdownify }}</div>
          <div class="archive-meta">
            <a class="project-source" href="{{ item.code }}">View contributions <span aria-hidden="true">↗</span></a>
            {% if item.tags %}
            <ul class="project-tags" aria-label="Technologies">
              {% for tag in item.tags %}<li>{{ tag }}</li>{% endfor %}
            </ul>
            {% endif %}
          </div>
        </div>
      </article>
      {% endfor %}
      {% endfor %}
    </div>
  </div>
</div>

<script src="{{ '/js/technology-filter.js' | relative_url }}" defer></script>
