---
title: "HW1_433"
author: "Georgia Warren"
date: "9/23/2021"
output: github_document
---

Link to github: https://github.com/gewarrren/gewarrren.git

```{r}
library("tidyverse")
library("readr")
library("ggplot2")

bridges <- read_delim("Bridges.txt")

# Preview Raw Data
head(bridges)
str(bridges)

# Select Variables to View
new_bridges = data.frame(bridge_ID = bridges$STRUCTURE_NUMBER_008, year = bridges$YEAR_BUILT_027, fips_codes =  bridges$STATE_CODE_001, conditions_rating = bridges$BRIDGE_CONDITION, lanes_on_structure = bridges$TRAFFIC_LANES_ON_028A, bridge_roadway_width = bridges$ROADWAY_WIDTH_MT_051)

# Creating a file with the filtered variables
write.csv(new_bridges, file = "new_bridges.csv")

## Data Descriptions:
  ## bridge_ID: ID given to each bridge. 
  ## year: Year the structure was built (xxxx).
  ## fips_codes: 
  ## conditions_rating: S meaning Structurally Deficient , F meaning Functionally Obsolete 
  ## lanes_on_structure: Number of lanes on the structure. 
  ## bridge_roadway_width: Width (meters) of bridge from curb to curb (xxx.x).

#Preview Data
head(new_bridges)
str(new_bridges)

#Plot
ggplot(data = new_bridges) + 
  geom_point(mapping = aes(x = lanes_on_structure, y = bridge_roadway_width)) +
    coord_cartesian(xlim=c(0, 25)) + 
  ggtitle("Number of Lanes vs. Width of Structure") +
  xlab("Number of Lanes on Structure") +
  ylab("Width of Structure from Curb to Curb (meters)") 


```
