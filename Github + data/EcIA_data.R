library(ggplot2)
library(dplyr)


#CONSERVATION STATUS OF SPECIES 

Splot_data <- read.csv("data_occurence/Southern_plot_occurence_data.csv")
Nplot_data <- read.csv("data_occurence/Northern_plot_occurence_data.csv")
SBList_habitat <- read.csv("data_occurence/Scottish_biodiv_habitat_list.csv")
SBList_species <- read.csv("data_occurence/Scottish_biodiv_species_list.csv")
S_Nplot_data <- read.csv("data_occurence/S_Nplot_data.csv")
incidental_sightings <- read.csv("data_occurence/incidental_sightings.csv")

#Analysis for the conservation status of species in the Southern plot 

Splot_data <- read.csv("data_occurence/Southern_plot_occurence_data.csv")

total_organisms <- Splot_data%>%
  group_by(species) %>%
  summarise(total_organisms = sum(organismQuantity))

# Merge total_organisms with Splot_data
Splot_data_filtered <- Splot_data %>%
  left_join(total_organisms, by = "species")

# Merge the two dataframes on the 'scientificName' column
merged_data <- inner_join(Splot_data_filtered, SBList_species, by = "scientificName")



#Analysis for the conservation status of species in the Northern plot 

Nplot_data <- read.csv("data_occurence/Southern_plot_occurence_data.csv")

total_organisms <- Splot_data%>%
  group_by(species) %>%
  summarise(total_organisms = sum(organismQuantity))
# Merge total_organisms with Splot_data
Splot_data_filtered <- Splot_data %>%
  left_join(total_organisms, by = "species")
# Merge the two dataframes on the 'scientificName' column
merged_data_N <- inner_join(Splot_data_filtered, SBList_species, by = "scientificName")
