#creating a histogram for aquatic invertebrates found in the southern plot 
Splot_data <- read.csv("data_occurence/Southern_plot_occurence_data.csv")

Splot_data_filtered <- Splot_data %>%
  filter(class %in% c("Arachnida", "Insecta", "Clitellata"), !is.na(organismQuantity)) %>%
  slice(85:110)  # Exclude rows 0 to 85 which include terrestrial invertebrates 

total_organisms <- Splot_data_filtered %>%
  group_by(order) %>%
  summarise(total_organisms = sum(organismQuantity))

Splot_data_filtered <- Splot_data_filtered %>%
  left_join(total_organisms, by = "order")


quartz()

ggplot(Splot_data_filtered, aes(x = factor(class), y = total_organisms, fill = factor(order))) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(title = "Aquatic invertebrate orders found on the Southern plot",
       x = "class",
       y = "Organism Quantity (n)",
       fill = "order") +
  scale_y_continuous(
    labels = scales::comma_format(),
    breaks = seq(0, max(Splot_data_filtered$total_organisms, na.rm = TRUE), by = 1),
    name = "Individuals",
    expand = c(0, 0) 
  ) +
  coord_cartesian(ylim = c(0, max(Splot_data_filtered$total_organisms, na.rm = TRUE) + 2)) +  # Adjust the limit
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 360, hjust = 1, vjust = 0.5),
        legend.text = element_text(size = 8)) +  
  guides(fill = guide_legend(override.aes = list(size = 5)))


#creating a histogram for terrestrial invertebrates found in the Northern plot 


Nplot_data <- read.csv("data_occurence/Northern_plot_occurence_data.csv")

Nplot_data_filtered <- Nplot_data %>%
  filter(class %in% c("Arachnida", "Insecta", "Clitellata"), !is.na(organismQuantity)) %>%
  slice(85:110)  # Exclude rows 0 to 85 which include terrestrial invertebrates 

total_organisms <- Nplot_data_filtered %>%
  group_by(order) %>%
  summarise(total_organisms = sum(organismQuantity))

Nplot_data_filtered <- Nplot_data_filtered %>%
  left_join(total_organisms, by = "order")


quartz()

ggplot(Nplot_data_filtered, aes(x = factor(class), y = total_organisms, fill = factor(order))) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(title = "Aquatic invertebrate orders found on the Northern plot",
       x = "class",
       y = "Organism Quantity (n)",
       fill = "order") +
  scale_y_continuous(
    labels = scales::comma_format(),
    breaks = seq(0, max(Nplot_data_filtered$total_organisms, na.rm = TRUE), by = 1),
    name = "Individuals",
    expand = c(0, 0) 
  ) +
  coord_cartesian(ylim = c(0, max(Nplot_data_filtered$total_organisms, na.rm = TRUE) + 2)) +  # Adjust the limit
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 360, hjust = 1, vjust = 0.5),
        legend.text = element_text(size = 8)) +  
  guides(fill = guide_legend(override.aes = list(size = 5)))
