---
title: About me
layout: default
---

<section class="hero" aria-labelledby="hero-title">
  <div class="hero-copy">
    <p class="eyebrow">Research software engineer</p>
    <p class="hero-lede">I am a research software engineer in the <a href="https://ssc.uni-heidelberg.de">Scientific Software Center</a> of the <a href="https://www.uni-heidelberg.de/en">University of Heidelberg</a> where I work with researchers from all disciplines on a variety of software development projects.</p>
    <p class="hero-lede">I also give talks and courses on software development best practices for researchers and scientists.</p>
    <div class="hero-actions">
      <a class="button" href="{{ '/projects.html' | relative_url }}">Explore projects <span aria-hidden="true">↗</span></a>
      <a class="quiet-link" href="{{ '/teaching.html' | relative_url }}">Talks &amp; teaching <span aria-hidden="true">↗</span></a>
      <a class="quiet-link" href="{{ '/open-source.html' | relative_url }}">Open source <span aria-hidden="true">↗</span></a>
    </div>
  </div>
  <figure class="portrait">
    <img src="{{ '/imgs/photo.jpg' | relative_url }}" alt="Portrait of Liam Keegan" width="300" height="418" />
  </figure>
</section>

<section class="home-section" aria-labelledby="selected-work">
  <div class="section-heading">
    <div>
      <p class="eyebrow" id="selected-work">Selected projects</p>
    </div>
    <a class="quiet-link" href="{{ '/projects.html' | relative_url }}">All projects <span aria-hidden="true">↗</span></a>
  </div>
  <div class="featured-grid">
    {% assign featured_projects = site.data.projects | where: 'featured', true %}
    {% for project in featured_projects %}
      <article class="featured-project">
        <p class="project-kicker">{% if project.start_year == project.end_year %}{{ project.end_year }}{% else %}{{ project.start_year }}–{{ project.end_year }}{% endif %}</p>
        <h3><a href="{{ project.url }}">{{ project.title }}</a></h3>
        <p>{{ project.desc }}</p>
        <a class="project-source" href="{{ project.code }}">View source <span aria-hidden="true">↗</span></a>
      </article>
    {% endfor %}
  </div>
</section>

<section class="home-section about-section" aria-labelledby="about-heading">
  <div>
    <p class="eyebrow">Background</p>
    <h2 id="about-heading">From particle physics to research software</h2>
  </div>
  <div class="about-copy">
    <p>I develop research software in C++, Python, and on the web. I also give <a href="{{ '/teaching.html' | relative_url }}">talks and courses</a> on software development for researchers and <a href="{{ '/open-source.html' | relative_url }}">contribute to open source</a> projects.</p>
    <p>Previously, in the <a href="https://www.cos.uni-heidelberg.de/en/research-groups/modelling-of-biological-processes">Department for Modelling of Biological Processes</a>, I developed <a href="https://spatial-model-editor.github.io/">Spatial Model Editor</a>, a tool for editing and simulating spatial models of biochemical reactions. At the <a href="https://bluebrain.epfl.ch/">Blue Brain Project</a>, I added symbolic math features to the <a href="https://github.com/BlueBrain/nmodl">NMODL compiler</a> to speed up brain tissue simulations; the work is described in these <a href="https://arxiv.org/pdf/1905.02241.pdf">conference proceedings</a>.</p>
    <p>Before that I worked as a theoretical particle physicist at ETH Zurich, CERN, and other research institutes, using supercomputers to simulate quantum field theories. My <a href="{{ '/physics.html' | relative_url }}">physics page</a> collects publications and talks from that work.</p>
  </div>
</section>
