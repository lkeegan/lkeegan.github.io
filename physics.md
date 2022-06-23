---
title: Physics
layout: default
---

## Research publications

My publications are listed in the
[INSPIRE High-Energy Physics Literature Database](http://inspirehep.net/search?p=exactauthor%3AL.Keegan.1),
which also contains links to full-text pdf versions.

## Slides from Talks

Slides from some of the conference talks and seminars that I have given:

{% for item in site.data.physics %}
- {{ item.event }}. _{{ item.location }}. {{ item.year }}_
  - [{{ item.title }}]({{ item.url }})
{% endfor %}

## Teaching

I was the tutor for the 2017 Autumn semester course &#8220;Introduction to
Lattice QCD&#8221; at ETH Zurich. The exercises, along with sample C++ codes
to do the lattice field theory simulations and jupyter python notebooks where
the resulting data are analysed and plotted, are
[available on github](https://github.com/lkeegan/LQCD).
