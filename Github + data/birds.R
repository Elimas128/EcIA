
#creating a histogram for birds fiund in the Southern plot 

Splot_data_filtered <- Splot_data %>% filter(class == "Aves")
color_palette <- brewer.pal(n = n_distinct(Splot_data_filtered$species), name = "Set3")


# Calculate total organisms for each order
total_organisms <- Splot_data_filtered %>%
  group_by(scientificName) %>%
  summarise(total_organisms = sum(organismQuantity))


# Merge total_organisms with S_Nplotmammals
Splot_data_filtered <- Splot_data_filtered %>%
  left_join(total_organisms, by = "scientificName")

quartz()

ggplot(Splot_data_filtered, aes(x = factor(family), y = total_organisms, fill = factor(scientificName))) +
  geom_bar(stat = "identity", position = "dodge") +
  scale_fill_manual(values = color_palette) +
  labs(title = "Bird species in Southern plot",
       x = "order",
       y = "Organism Quantity (n)",
       fill = "Species") +
  scale_y_continuous(
    labels = scales::comma_format(),
    breaks = seq(0, max(Splot_data_filtered$total_organisms), by = 1),
    name = "Individuals"
  ) +
  coord_cartesian(ylim = c(0, max(Splot_data_filtered$total_organisms, na.rm = TRUE) + 5)) +  # Adjust the limit
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5))


#creating a histogram for birds found in the Northern plot 

Nplot_data_filtered <- Nplot_data %>% filter(class == "Aves")

# Calculate total organisms for each scientificName
total_organisms <- Nplot_data_filtered %>%
  group_by(scientificName) %>%
  summarise(total_organisms = sum(organismQuantity))

# Merge total_organisms with Nplot_data_filtered
Nplot_data_filtered <- Nplot_data_filtered %>%
  left_join(total_organisms, by = "scientificName")

quartz()

ggplot(Nplot_data_filtered, aes(x = factor(family), y = total_organisms, fill = factor(scientificName))) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(title = "Bird species in Northern plot",
       x = "order",
       y = "Organism Quantity (n)",
       fill = "Species") +
  scale_y_continuous(
    labels = scales::comma_format(),
    breaks = seq(0, max(Nplot_data_filtered$total_organisms), by = 5),
    name = "Individuals"
  ) +
  coord_cartesian(ylim = c(0, max(Nplot_data_filtered$total_organisms, na.rm = TRUE) + 5)) +  # Adjust the limit
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5))




