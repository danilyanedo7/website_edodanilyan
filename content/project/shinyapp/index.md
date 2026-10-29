---
title: "Shinyapp for biologist: apps and usage tutorial"
summary: ""
authors: [admin]
tags: [r, data visualization]
categories: []
date: 2024-10-11T16:07:33+07:00

external_link: ""

image:
  caption: ""
  focal_point: ""
  preview_only: false


url_code: "https://github.com/danilyanedo7/shinyapp_species_distribution"
url_pdf: ""
url_slides: ""
url_video: ""


slides: ""
---

Welcome! This is my first R Shiny project, a simple app for mapping species observation data.

You upload a CSV with one row per observation (species name, site, abundance, latitude/longitude, conservation status, and habitat type), or tick a box to try it with built-in dummy data on Javan wildlife. The app then plots each observation as a circle on a `leaflet` map, centered on coordinates you choose, with a popup showing the species, site, abundance, conservation status, and habitat type on click.

You can explore the code and try it yourself here:  
[GitHub Repo](https://github.com/danilyanedo7/shinyapp_species_distribution)

It's still a work in progress, built mainly so field researchers and students can visualize their own biodiversity data without writing any code.

---

### Why I Built This

I built the app to test a simple way of mapping biodiversity records without requiring users to write code. It remains a work in progress, and I continue to refine it as I learn more about Shiny and spatial data.

---

### Feedback

If you try the app, I’d be glad to hear what worked and where you ran into problems.
