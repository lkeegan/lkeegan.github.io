---
title: Projects
layout: default
---

<div class="compact-intro">
  <h1>Projects</h1>
  <p>Here are some of the open-source projects that I have worked on.</p>
</div>

<div class="projects-layout">
  {% include technology-panel.html all_label="All projects" singular="project" plural="projects" %}

  <div class="projects-main">
    <p id="project-filter-status" class="project-filter-status" aria-live="polite" hidden></p>
    <div class="project-list">
      {% assign year_groups = site.data.projects | group_by: 'end_year' | sort: 'name' | reverse %}
      {% for year_group in year_groups %}
      {% for item in year_group.items %}
      <article class="project-entry filterable-entry" id="project-{{ item.title | slugify }}" data-title="{{ item.title | escape }}" data-tags="{{ item.tags | jsonify | escape }}">
        <div class="project-year">{% if item.start_year == item.end_year %}{{ item.end_year }}{% else %}{{ item.start_year }}–{{ item.end_year }}{% endif %}</div>
        <div class="project-details">
          <h2><a href="{{ item.url }}">{{ item.title }} <span aria-hidden="true">↗</span></a></h2>
          <div class="project-description">{{ item.desc | markdownify }}</div>
          <div class="project-meta">
            <a class="project-source" href="{{ item.code }}">Source code <span aria-hidden="true">↗</span></a>
            <ul class="project-tags" aria-label="Technologies">
              {% for tag in item.tags %}<li>{{ tag }}</li>{% endfor %}
            </ul>
          </div>
        </div>
      </article>
      {% endfor %}
      {% endfor %}
    </div>
  </div>

</div>

<script src="{{ '/js/technology-filter.js' | relative_url }}" defer></script>
