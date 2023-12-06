# mammals

S_Nplot_data <- read.csv("data_occurence/S_Nplot_data.csv")
S_Nplotmammals <- S_Nplot_data %>% 
  filter(order %in% c("artiodactyla", "Rodentia", "Lagomorpha","Eulipotyphla"), !is.na(organismQuantity))

# Calculate total organisms for each order
total_organisms <- S_Nplotmammals %>%
  group_by(species) %>%
  summarise(total_organisms = sum(organismQuantity))


# Merge total_organisms with S_Nplotmammals
S_Nplotmammals <- S_Nplotmammals %>%
  left_join(total_organisms, by = "species")



quartz()

ggplot(S_Nplotmammals, aes(x = factor(plot), y = total_organisms, fill = factor(species))) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(title = "Mammal species in Southern and Northern plots",
       x = "plot",
       y = "Organism Quantity (n)",
       fill = "class") +
  scale_y_continuous(
    labels = scales::comma_format(),
    breaks = seq(0, max(S_Nplotmammals$total_organisms), by = 1),
    name = "Individuals"
  ) +
  coord_cartesian(ylim = c(0, max(S_Nplotmammals$total_organisms, na.rm = TRUE) + 2)) +  # Adjust the limit
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 360, hjust = 1, vjust = 0.5))

