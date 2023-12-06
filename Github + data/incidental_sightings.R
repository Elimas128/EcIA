#incidental sightings in N ans S

incidental_sightings <- read.csv("data_occurence/incidental_sightings.csv")

#plot

quartz()

ggplot(incidental_sightings, aes(x = factor(plot), y = organism_number, fill = factor(Taxon))) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(title = "Incidental sightings Taxon",
       x = "Taxon",
       y = "Organism Quantity (n)",
       fill = "class") +
  scale_y_continuous(
    labels = scales::comma_format(),
    breaks = seq(0, max(incidental_sightings$organism_number), by = 1),
    name = "Individuals"
  ) +
  coord_cartesian(ylim = c(0, max(incidental_sightings$organism_number, na.rm = TRUE) + 2)) +  # Adjust the limit
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 360, hjust = 1, vjust = 0.5))

