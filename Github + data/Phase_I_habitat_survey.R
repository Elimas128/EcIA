library(ggplot2)
library(dplyr)

#phase I habitat survey 

#percentage of habitats in need of conservation, calculations based on the total % of habitat cover of the plot

conservS <- read.csv("habitat types/habitats_conservation_needed_south.csv")
speciesupS <- read.csv("habitat types/habitat_importspecies_support_south.csv")
conservN <- read.csv("habitat types/habitats_conservation_needed_north.csv")
speciesupN <- read.csv("habitat types/habitat_importspecies_support_north.csv")
head(conservN)

# Creation of pie chart using ggplot2

# for conservS

quartz()

pie_chart <- ggplot(conservS, aes(x = "", y = Percentage_conservation_action_needed, fill = HABITAT.TYPE)) +
  geom_bar(stat = "identity", width = 1, color = "white") +
  coord_polar(theta = "y") +
  theme_minimal() +
  scale_fill_brewer(palette = "Set3") +
  geom_text(
    aes(label = paste0(Percentage_conservation_action_needed, "%")), 
    position = position_stack(vjust = 0.5),
    size = 3,
    check_overlap = TRUE  # This helps in avoiding label overlap
  ) +
  guides(fill = guide_legend(title = "Habitat Type")) +
  ggtitle("% Habitats with conservation action needed in Southern Plot") +
  theme(
    axis.line = element_blank(),  # Remove axis lines
    axis.text = element_blank(),  # Remove axis text
    axis.title = element_blank(), # Remove axis titles
    axis.ticks = element_blank(), # Remove axis ticks
    panel.grid = element_blank(), # Remove panel grid
    panel.border = element_blank() # Remove panel border
  )

print(pie_chart)


# for conservN 


quartz()

pie_chart <- ggplot(conservN, aes(x = "", y = Percentage_conservation_action_needed, fill = HABITAT.TYPE)) +
  geom_bar(stat = "identity", width = 1, color = "white") +
  coord_polar(theta = "y") +
  theme_minimal() +
  scale_fill_brewer(palette = "Set3") +
  geom_text(
    aes(label = paste0(Percentage_conservation_action_needed, "%")), 
    position = position_stack(vjust = 0.5),
    size = 3,
    check_overlap = TRUE  # This helps in avoiding label overlap
  ) +
  guides(fill = guide_legend(title = "Habitat Type")) +
  ggtitle("% Habitats with conservation action needed in Northern Plot") +
  theme(
    axis.line = element_blank(),  # Remove axis lines
    axis.text = element_blank(),  # Remove axis text
    axis.title = element_blank(), # Remove axis titles
    axis.ticks = element_blank(), # Remove axis ticks
    panel.grid = element_blank(), # Remove panel grid
    panel.border = element_blank() # Remove panel border
  )

print(pie_chart)

# for speciesupS

quartz()

pie_chart <- ggplot(speciesupS, aes(x = "", y = important_for_species, fill = HABITAT.TYPE)) +
  geom_bar(stat = "identity", width = 1, color = "white") +
  coord_polar(theta = "y") +
  theme_minimal() +
  scale_fill_brewer(palette = "Set3") +
  geom_text(
    aes(label = paste0(important_for_species, "%")), 
    position = position_stack(vjust = 0.5),
    size = 3,
    check_overlap = TRUE  # This helps in avoiding label overlap
  ) +
  guides(fill = guide_legend(title = "Habitat Type")) +
  ggtitle("% Habitats importnat for supporting species in Southern Plot") +
  theme(
    axis.line = element_blank(),  # Remove axis lines
    axis.text = element_blank(),  # Remove axis text
    axis.title = element_blank(), # Remove axis titles
    axis.ticks = element_blank(), # Remove axis ticks
    panel.grid = element_blank(), # Remove panel grid
    panel.border = element_blank() # Remove panel border
  )
  
# Display the pie chart
print(pie_chart)

# for speciesupN

quartz()

pie_chart <- ggplot(speciesupN, aes(x = "", y = important_for_species, fill = HABITAT.TYPE)) +
  geom_bar(stat = "identity", width = 1, color = "white") +
  coord_polar(theta = "y") +
  theme_minimal() +
  scale_fill_brewer(palette = "Set3") +
  geom_text(
    aes(label = paste0(important_for_species, "%")), 
    position = position_stack(vjust = 0.2),
    size = 3,
    check_overlap = TRUE  # This helps in avoiding label overlap
  ) +
  guides(fill = guide_legend(title = "Habitat Type")) +
  ggtitle("% Habitats importnat for supporting species in Northern Plot") +
  theme(
    axis.line = element_blank(),  # Remove axis lines
    axis.text = element_blank(),  # Remove axis text
    axis.title = element_blank(), # Remove axis titles
    axis.ticks = element_blank(), # Remove axis ticks
    panel.grid = element_blank(), # Remove panel grid
    panel.border = element_blank() # Remove panel border
  )

print(pie_chart)

