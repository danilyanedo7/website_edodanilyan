---
# An instance of the Tag Cloud widget.
# Docs: https://wowchemy.com/docs/page-builder/
widget: tag_cloud

# This file represents a page section.
headless: true
active: true

# Order that this section appears on the page.
weight: 90

title: Popular Topics
subtitle: 'A living map of the subjects that keep showing up in my work'

content:
  # Choose the taxonomy from `config.toml` to display (e.g. tags, categories)
  taxonomy: tags
  # Choose how many tags you would like to display (0 = all tags)
  count: 14
design:
  columns: '1'
  # Minimum and maximum font sizes (1.0 = 100%).
  font_size_min: 0.85
  font_size_max: 1.65
  spacing:
    # Customize the section spacing. Order is top, right, bottom, left.
    padding: ["52px", "0", "58px", "0"]
---
