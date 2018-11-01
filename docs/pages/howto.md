---
layout: default
title: How-to guides
permalink: /howto/
tags: nav
---

<div class="container">
  <div id="how-to-intro">
    <p></p>
    <h2><img src="../assets/images/logo_pepatac_black.png" alt="PEPATAC" class="img-fluid" style="max-height:30px; margin-top:-15px; margin-bottom:-5px"> how-to guides</h2>
    <p>Would you like to learn more about how to do some specific steps? Check out the guides listed here and see if we can help you along.  Are you trying to do something not listed here and would like some help? <a href="{{ "/contact/" | prepend: site.baseurl }}">Reach out to us here</a>.</p>
  </div>
</div>
<hr>
<div class="container">
  <h2 id="how-to-content"><strong>How-to guides</strong> (<i>in progress</i>)</h2>
  <p></p>
  <ul>
  {% assign sorted = site.pages | sort:"title" %}
  {% for page in sorted %}
  {% if page.tags contains 'howto' %}
  {% unless page.tags contains 'draft' %}
    <li><a href="{{ page.url | prepend: site.baseurl }}">{{ page.title }}</a><span style="color:gray; font-size:0.75em"> {{ page.date | date: "%Y %B" }}.</span></li>
  {% endunless %}
  {% endif %}
  {% endfor %}
  </ul>
</div>