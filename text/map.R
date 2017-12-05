# map ---------------------------------------------------------------------
df <- read.csv("map.data.csv")

# install.packages("devtools")
# devtools::install_github("agricolamz/lingtypology", dependencies = TRUE)
library(lingtypology); library(tidyverse)
map.feature(df$languages,
            latitude = df$lat,
            longitude = df$long,
            control = F,
            color = "black",
            tile = "OpenStreetMap.BlackAndWhite")