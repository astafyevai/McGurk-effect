setwd("/home/agricolamz/_DATA/OneDrive1/_Work/github/McGurk effect/data")
df <- read.csv("map.data.csv")

# install.packages("devtools")
# devtools::install_github("agricolamz/lingtypology", dependencies = TRUE)
library(lingtypology)
map.feature(df$languages, 
            latitude = df$lat,
            longitude = df$long,
            control = F,
            color = "black",
            tile = "OpenStreetMap.BlackAndWhite")
