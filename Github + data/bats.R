#bat species seen over 2 nights on the southern plot


install.packages("RColorBrewer")
library(RColorBrewer)
color_palette <- brewer.pal(n = n_distinct(S_Nplotbats$species), name = "Set3")

#create graph

S_Nplot_data <- read.csv("data_occurence/S_Nplot_data.csv")
S_Nplotbats <- S_Nplot_data %>% 
  filter(order %in% "chiroptera")

total_organisms <- S_Nplotbats %>%
  group_by(species) %>%
  summarise(total_organisms = sum(organismQuantity))

S_Nplotbats <- S_Nplotbats %>%
  left_join(total_organisms, by = "species")

quartz()

ggplot(S_Nplotbats, aes(x = factor(plot), y = total_organisms, fill = factor(species))) +
  geom_bar(stat = "identity", position = "dodge") +
  scale_fill_manual(values = color_palette) +
  labs(title = "Bat species in Southern and Northern plots over 2 days",
       x = "plot",
       y = "Organism Quantity (n)",
       fill = "class") +
  scale_y_continuous(
    labels = scales::comma_format(),
    breaks = seq(0, max(S_Nplotbats$total_organisms), by = 1),
    name = "Individuals"
  ) +
  coord_cartesian(ylim = c(0, max(S_Nplotbats$total_organisms, na.rm = TRUE) + 2)) +  # Adjust the limit
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 360, hjust = 1, vjust = 0.5))

#Creating a presence/absence graph

# Filter for only bat species
quartz()

ggplot(S_Nplotbats, aes(x = plot, y = factor(species, levels = unique(species)), fill = species)) +
  geom_tile(color = "white", size = 0.5) +
  scale_fill_manual(values = color_palette) +  # Set the color palette
  labs(
    title = "Presence-Absence of Bat Species in Northern and Southern Plots",
    x = "Plot Type",
    y = "Species",
    fill = "Presence/Absence"
  ) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 0, hjust = 0.5),
        legend.position = "bottom",
        legend.title = element_blank(),
        legend.text = element_text(size = 8))

