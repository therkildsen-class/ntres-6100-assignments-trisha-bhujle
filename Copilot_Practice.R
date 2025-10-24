library(tidyverse)

view(mtcars)

mtcars_6cyl <- mtcars |>
  filter(cyl == 6)
view(mtcars_6cyl)

mtcars_4cyl <- mtcars |>
  filter(cyl == 4)
view(mtcars_4cyl)

install.packages("palmerpenguins")
library(palmerpenguins)

# Explore penguin dataset
view(penguins)

# Visualize the length by species
ggplot(data = penguins) +
  geom_boxplot(mapping = aes(x = species, y = bill_length_mm, color = species))

# What is the relationship between body mass and flipper length in penguins? 
ggplot(data = penguins) +
  geom_point(mapping = aes(x = flipper_length_mm, y = body_mass_g, color = species)) +
  labs(title = "Body Mass vs Flipper Length in Penguins",
       x = "Flipper Length (mm)",
       y = "Body Mass (g)") +
  theme_minimal()

library(gapminder)
library(knitr)
library(janitor)

head(gapminder) |> kable()

gapminder_clean <- gapminder |> 
  clean_names()
view(gapminder_clean)

# Create a plot of gdp per capita vs. year for each country. Use for loops and ggsave.
unique_countries <- unique(gapminder_clean$country)

for (country in unique_countries) {
  country_data <- gapminder_clean |> 
    filter(country == !!country)
  
  p <- ggplot(data = country_data) +
    geom_line(mapping = aes(x = year, y = gdp_percap), color = "blue") +
    geom_point(mapping = aes(x = year, y = gdp_percap), color = "red") +
    labs(title = paste("GDP per Capita Over Time in", country),
         x = "Year",
         y = "GDP per Capita") +
    theme_minimal()
  
  ggsave(filename = paste0("gdp_per_capita_", gsub(" ", "_", country), ".png"), plot = p)
}




