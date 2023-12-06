#VISUALISATION DATA

library(ggplot2)
install.packages("scales")
library(dplyr)
install.packages("scales")
library(scales)
library(RColorBrewer)
library(tidyverse)
library(forcats)
library(viridis)
library(dplyr)

#check if organismQuantity is numeric
Splot_data$organismQuantity

#creating a histogram comparing the class present in southern plot
Splot_data <- read.csv("data_occurence/Southern_plot_occurence_data.csv")


# Calculate total organisms for each order
total_organisms <- Splot_data %>%
  group_by(class) %>%
  summarise(total_organisms = sum(organismQuantity))


# Merge total_organisms with S_Nplotmammals
Splot_data_classf <- Splot_data %>%
  left_join(total_organisms, by = "class")

quartz()

ggplot(Splot_data_classf, aes(x = factor(class), y = total_organisms, fill = factor(class))) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(title = "Class in Southern plot",
       x = "plot",
       y = "Organism Quantity (n)",
       fill = "class") +
  scale_y_continuous(
    labels = scales::comma_format(),
    breaks = seq(0, max(Splot_data_classf$total_organisms), by = 10),
    name = "Individuals"
  ) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5))



#creating a histogram comparing the class present in northern plot

Nplot_data <- read.csv("data_occurence/Northern_plot_occurence_data.csv")


# Calculate total organisms for each order
total_organisms <- Nplot_data %>%
  group_by(class) %>%
  summarise(total_organisms = sum(organismQuantity))


# Merge total_organisms with S_Nplotmammals
Nplot_data_classf <- Nplot_data %>%
  left_join(total_organisms, by = "class")

quartz()

ggplot(Nplot_data_classf, aes(x = factor(class), y = total_organisms, fill = factor(class))) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(title = "Class in Northern plot",
       x = "plot",
       y = "Organism Quantity (n)",
       fill = "class") +
  scale_y_continuous(
    labels = scales::comma_format(),
    breaks = seq(0, max(Nplot_data_classf$total_organisms), by = 10),
    name = "Individuals"
  ) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5))


