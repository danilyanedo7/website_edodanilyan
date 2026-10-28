# Understanding data distribution: complete analysis
#
# Run this script from the directory that contains it. It requires the
# tidyverse and palmerpenguins packages, writes figures to figures/, and
# prints the R session information at the end.
#
# Install the packages once if needed:
# install.packages(c("tidyverse", "palmerpenguins"))

## ----analysis-setup, include=FALSE--------------------------------------------
library(tidyverse)
library(palmerpenguins)

dir.create("figures", showWarnings = FALSE, recursive = TRUE)

species_colours <- c(
  "Adelie" = "#374E55",
  "Chinstrap" = "#DF8F44",
  "Gentoo" = "#00A1D5"
)

sex_colours <- c(
  "female" = "#B24745",
  "male" = "#374E55"
)

theme_penguin <- theme_minimal(base_size = 12) +
  theme(
    plot.background = element_rect(fill = "white", colour = NA),
    panel.background = element_rect(fill = "white", colour = NA),
    panel.grid.minor = element_blank(),
    panel.grid.major.x = element_blank(),
    plot.title.position = "plot",
    plot.caption.position = "plot",
    plot.title = element_text(face = "bold"),
    strip.text = element_text(face = "bold"),
    legend.position = "bottom"
  )


## ----opening-average----------------------------------------------------------
overall_mean <- penguins |>
  summarise(
    usable_n = sum(!is.na(body_mass_g)),
    mean_body_mass_g = mean(body_mass_g, na.rm = TRUE)
  )

knitr::kable(overall_mean, digits = 2)




## ----load-packages------------------------------------------------------------
library(tidyverse)
library(palmerpenguins)


## ----inspect-data-------------------------------------------------------------
relevant_penguins <- penguins |>
  select(species, body_mass_g, sex, flipper_length_mm)

relevant_penguins |>
  slice_head(n = 6) |>
  knitr::kable()


## ----missing-values-----------------------------------------------------------
missing_relevant <- relevant_penguins |>
  summarise(across(everything(), ~ sum(is.na(.x)))) |>
  pivot_longer(
    everything(),
    names_to = "variable",
    values_to = "missing_n"
  )

knitr::kable(missing_relevant)


## ----body-mass-data-----------------------------------------------------------
penguin_mass <- penguins |>
  filter(!is.na(body_mass_g))

penguin_mass |>
  summarise(usable_n = n()) |>
  knitr::kable()


## ----individual-observations, echo=c(1, 2)------------------------------------
set.seed(20261023)

p_individual <- ggplot(
  penguin_mass,
  aes(x = body_mass_g, y = 0)
) +
  geom_jitter(
    height = 0.16,
    width = 0,
    size = 1.8,
    alpha = 0.55,
    colour = "#374E55"
  ) +
  geom_vline(
    xintercept = overall_mean$mean_body_mass_g,
    colour = "#B24745",
    linewidth = 0.8,
    linetype = "dashed"
  ) +
  annotate(
    "text",
    x = overall_mean$mean_body_mass_g,
    y = 0.25,
    label = "Mean = 4,202 g",
    colour = "#B24745",
    hjust = -0.05,
    size = 3.5
  ) +
  scale_x_continuous(
    limits = c(2500, 6500),
    breaks = seq(2500, 6500, by = 500),
    labels = scales::label_comma()
  ) +
  scale_y_continuous(NULL, breaks = NULL) +
  labs(
    title = "Individual body-mass observations",
    x = "Body mass (g)",
    caption = "Each point is one recorded penguin; the dashed line is the pooled mean."
  ) +
  theme_penguin

ggsave(
  "figures/individual-body-mass.svg",
  p_individual,
  width = 8,
  height = 3.8,
  bg = "white"
)




## ----pooled-histogram, echo=1-------------------------------------------------
p_histogram <- ggplot(penguin_mass, aes(x = body_mass_g)) +
  geom_histogram(
    binwidth = 250,
    boundary = 0,
    closed = "left",
    fill = "#374E55",
    colour = "white",
    linewidth = 0.35
  ) +
  geom_vline(
    xintercept = overall_mean$mean_body_mass_g,
    colour = "#B24745",
    linewidth = 0.8,
    linetype = "dashed"
  ) +
  coord_cartesian(xlim = c(2500, 6500)) +
  scale_x_continuous(
    breaks = seq(2500, 6500, by = 500),
    labels = scales::label_comma()
  ) +
  scale_y_continuous(expand = expansion(mult = c(0, 0.08))) +
  labs(
    title = "Body mass across all three species",
    subtitle = "250 g bins with boundaries at multiples of 250 g",
    x = "Body mass (g)",
    y = "Number of penguins",
    caption = "The dashed line marks the pooled mean. n = 342."
  ) +
  theme_penguin

ggsave(
  "figures/pooled-histogram.svg",
  p_histogram,
  width = 8,
  height = 5,
  bg = "white"
)

ggsave(
  "featured.png",
  p_histogram + theme(legend.position = "none"),
  width = 8,
  height = 4.5,
  dpi = 200,
  bg = "white"
)




## ----compare-bin-widths, echo=1:3---------------------------------------------
bin_widths <- tibble(
  bin_width = c(100, 250, 500),
  panel = factor(
    c("100 g bins", "250 g bins", "500 g bins"),
    levels = c("100 g bins", "250 g bins", "500 g bins")
  )
)

mass_bins <- tidyr::expand_grid(
  penguin_mass |> select(body_mass_g),
  bin_widths
) |>
  mutate(
    bin_left = floor(body_mass_g / bin_width) * bin_width
  ) |>
  count(panel, bin_width, bin_left, name = "count")

p_bin_widths <- ggplot(mass_bins) +
  geom_rect(
    aes(
      xmin = bin_left,
      xmax = bin_left + bin_width,
      ymin = 0,
      ymax = count
    ),
    fill = "#374E55",
    colour = "white",
    linewidth = 0.25
  ) +
  facet_wrap(~ panel, ncol = 1) +
  coord_cartesian(xlim = c(2500, 6500)) +
  scale_x_continuous(
    breaks = seq(2500, 6500, by = 500),
    labels = scales::label_comma()
  ) +
  scale_y_continuous(expand = expansion(mult = c(0, 0.08))) +
  labs(
    title = "The apparent shape changes with bin width",
    x = "Body mass (g)",
    y = "Number of penguins",
    caption = "The observations and axis limits are identical in all three panels."
  ) +
  theme_penguin

ggsave(
  "figures/bin-width-comparison.svg",
  p_bin_widths,
  width = 8,
  height = 8.5,
  bg = "white"
)




## ----pooled-summary-----------------------------------------------------------
pooled_summary <- penguin_mass |>
  summarise(
    usable_n = n(),
    mean_g = mean(body_mass_g),
    median_g = median(body_mass_g),
    sd_g = sd(body_mass_g),
    q1_g = quantile(body_mass_g, 0.25),
    q3_g = quantile(body_mass_g, 0.75),
    iqr_g = IQR(body_mass_g),
    min_g = min(body_mass_g),
    max_g = max(body_mass_g)
  )

knitr::kable(pooled_summary, digits = 1)


## ----species-histograms, echo=1-----------------------------------------------
p_species_histograms <- ggplot(
  penguin_mass,
  aes(x = body_mass_g, fill = species)
) +
  geom_histogram(
    binwidth = 250,
    boundary = 0,
    closed = "left",
    colour = "white",
    linewidth = 0.35,
    show.legend = FALSE
  ) +
  facet_wrap(~ species, ncol = 1) +
  coord_cartesian(xlim = c(2500, 6500), ylim = c(0, 32)) +
  scale_x_continuous(
    breaks = seq(2500, 6500, by = 500),
    labels = scales::label_comma()
  ) +
  scale_y_continuous(expand = expansion(mult = c(0, 0.08))) +
  scale_fill_manual(values = species_colours) +
  labs(
    title = "Body-mass distributions differ by species",
    subtitle = "Matching 250 g bins and fixed axes",
    x = "Body mass (g)",
    y = "Number of penguins",
    caption = "Usable n: Adélie 151, Chinstrap 68, Gentoo 123."
  ) +
  theme_penguin

ggsave(
  "figures/body-mass-by-species.svg",
  p_species_histograms,
  width = 8,
  height = 8.5,
  bg = "white"
)




## ----species-summary----------------------------------------------------------
species_summary <- penguin_mass |>
  group_by(species) |>
  summarise(
    usable_n = n(),
    mean_g = mean(body_mass_g),
    median_g = median(body_mass_g),
    sd_g = sd(body_mass_g),
    q1_g = quantile(body_mass_g, 0.25),
    q3_g = quantile(body_mass_g, 0.75),
    iqr_g = IQR(body_mass_g),
    .groups = "drop"
  )

knitr::kable(species_summary, digits = 1)


## ----adelie-chinstrap-summary-------------------------------------------------
adelie_chinstrap_summary <- species_summary |>
  filter(species %in% c("Adelie", "Chinstrap"))

knitr::kable(adelie_chinstrap_summary, digits = 1)


## ----adelie-chinstrap-plot, echo=1:2------------------------------------------
adelie_chinstrap <- penguin_mass |>
  filter(species %in% c("Adelie", "Chinstrap"))

p_adelie_chinstrap <- ggplot(
  adelie_chinstrap,
  aes(x = body_mass_g, fill = species)
) +
  geom_histogram(
    binwidth = 200,
    boundary = 0,
    closed = "left",
    colour = "white",
    linewidth = 0.35,
    show.legend = FALSE
  ) +
  facet_wrap(~ species, ncol = 1) +
  coord_cartesian(xlim = c(2500, 5000), ylim = c(0, 28)) +
  scale_x_continuous(
    breaks = seq(2500, 5000, by = 500),
    labels = scales::label_comma()
  ) +
  scale_y_continuous(expand = expansion(mult = c(0, 0.08))) +
  scale_fill_manual(values = species_colours) +
  labs(
    title = "Adélie and Chinstrap have similar centers",
    subtitle = "Matching 200 g bins and fixed axes",
    x = "Body mass (g)",
    y = "Number of penguins",
    caption = "Adélie n = 151; Chinstrap n = 68."
  ) +
  theme_penguin

ggsave(
  "figures/adelie-chinstrap-comparison.svg",
  p_adelie_chinstrap,
  width = 8,
  height = 6.5,
  bg = "white"
)




## ----adelie-missingness-------------------------------------------------------
adelie_missingness <- penguins |>
  filter(species == "Adelie") |>
  summarise(
    total_rows = n(),
    missing_body_mass = sum(is.na(body_mass_g)),
    missing_sex = sum(is.na(sex)),
    usable_for_comparison = sum(
      !is.na(body_mass_g) & !is.na(sex)
    )
  )

knitr::kable(adelie_missingness)


## ----adelie-sex-summary-------------------------------------------------------
adelie_sex <- penguins |>
  filter(
    species == "Adelie",
    !is.na(body_mass_g),
    !is.na(sex)
  )

adelie_sex_summary <- adelie_sex |>
  group_by(sex) |>
  summarise(
    usable_n = n(),
    mean_g = mean(body_mass_g),
    median_g = median(body_mass_g),
    min_g = min(body_mass_g),
    max_g = max(body_mass_g),
    .groups = "drop"
  )

knitr::kable(adelie_sex_summary, digits = 1)


## ----adelie-sex-plot, echo=c(1, 2)--------------------------------------------
set.seed(20261023)

p_adelie_sex <- ggplot(
  adelie_sex,
  aes(x = body_mass_g, y = sex, colour = sex)
) +
  geom_jitter(
    height = 0.12,
    width = 0,
    alpha = 0.55,
    size = 1.8,
    show.legend = FALSE
  ) +
  stat_summary(
    fun = median,
    geom = "point",
    shape = 23,
    size = 3.8,
    fill = "white",
    stroke = 1,
    show.legend = FALSE
  ) +
  scale_colour_manual(values = sex_colours) +
  scale_x_continuous(
    limits = c(2750, 4900),
    breaks = seq(3000, 4750, by = 250),
    labels = scales::label_comma()
  ) +
  labs(
    title = "Adélie body mass by recorded sex",
    subtitle = "White diamonds mark group medians",
    x = "Body mass (g)",
    y = NULL,
    caption = "Female n = 73; male n = 73."
  ) +
  theme_penguin

ggsave(
  "figures/adelie-body-mass-by-sex.svg",
  p_adelie_sex,
  width = 8,
  height = 4.5,
  bg = "white"
)




## ----unusual-values-plot, echo=c(1, 2)----------------------------------------
set.seed(20261023)

p_unusual <- ggplot(
  penguin_mass,
  aes(x = species, y = body_mass_g, colour = species)
) +
  geom_boxplot(
    width = 0.28,
    outlier.shape = NA,
    fill = "white",
    linewidth = 0.65,
    show.legend = FALSE
  ) +
  geom_jitter(
    width = 0.14,
    height = 0,
    alpha = 0.45,
    size = 1.5,
    show.legend = FALSE
  ) +
  scale_colour_manual(values = species_colours) +
  scale_y_continuous(
    breaks = seq(2500, 6500, by = 500),
    labels = scales::label_comma()
  ) +
  labs(
    title = "Judge unusual values within relevant groups",
    x = NULL,
    y = "Body mass (g)",
    caption = "Boxes span the middle 50%; whiskers use the 1.5 × IQR convention."
  ) +
  theme_penguin

ggsave(
  "figures/unusual-values-by-species.svg",
  p_unusual,
  width = 8,
  height = 5.5,
  bg = "white"
)




## ----high-mass-count----------------------------------------------------------
high_mass_by_species <- penguin_mass |>
  filter(body_mass_g >= 5500) |>
  count(species, name = "n_at_least_5500_g")

knitr::kable(high_mass_by_species)


## ----boxplot-rule-------------------------------------------------------------
species_boxplot_flags <- penguin_mass |>
  group_by(species) |>
  mutate(
    q1_g = quantile(body_mass_g, 0.25),
    q3_g = quantile(body_mass_g, 0.75),
    iqr_g = q3_g - q1_g
  ) |>
  filter(
    body_mass_g < q1_g - 1.5 * iqr_g |
      body_mass_g > q3_g + 1.5 * iqr_g
  ) |>
  select(species, body_mass_g)

knitr::kable(species_boxplot_flags)




## ----flipper-worked-answer----------------------------------------------------
flipper_data <- penguins |>
  filter(!is.na(flipper_length_mm))

flipper_summary <- flipper_data |>
  group_by(species) |>
  summarise(
    usable_n = n(),
    mean_mm = mean(flipper_length_mm),
    median_mm = median(flipper_length_mm),
    sd_mm = sd(flipper_length_mm),
    q1_mm = quantile(flipper_length_mm, 0.25),
    q3_mm = quantile(flipper_length_mm, 0.75),
    iqr_mm = IQR(flipper_length_mm),
    .groups = "drop"
  )

knitr::kable(flipper_summary, digits = 1)


## ----flipper-worked-plot, echo=c(1, 2)----------------------------------------
set.seed(20261023)

p_flipper <- ggplot(
  flipper_data,
  aes(x = species, y = flipper_length_mm, colour = species)
) +
  geom_boxplot(
    width = 0.28,
    outlier.shape = NA,
    fill = "white",
    linewidth = 0.65,
    show.legend = FALSE
  ) +
  geom_jitter(
    width = 0.14,
    height = 0,
    alpha = 0.45,
    size = 1.5,
    show.legend = FALSE
  ) +
  scale_colour_manual(values = species_colours) +
  scale_y_continuous(breaks = seq(170, 235, by = 10)) +
  labs(
    title = "Flipper length by species",
    x = NULL,
    y = "Flipper length (mm)",
    caption = "Usable n: Adélie 151, Chinstrap 68, Gentoo 123."
  ) +
  theme_penguin

ggsave(
  "figures/flipper-length-by-species.svg",
  p_flipper,
  width = 8,
  height = 5.5,
  bg = "white"
)




## ----session-info, include=FALSE----------------------------------------------
sessionInfo()
