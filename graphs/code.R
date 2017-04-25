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

# results summary ---------------------------------------------------------
library(tidyverse)
df <- read.csv("pre_results.csv")

levels(df$example.audio) <- c("p", "t", "k")
levels(df$example.video) <- c("k", "t", "p")
levels(df$answer) <- c("p", "t", "k", "-")

df %>%
  count(sex, example.audio, example.video, answer, sort = TRUE) %>% 
  ggplot(aes(answer, n, fill = sex)) +
  geom_bar(stat = "identity", position = "dodge")+
  #geom_text(aes(label = n), color="white", size = 5) +
  #scale_size(range = c(3,20)) +
  facet_grid(example.video~example.audio)+
  theme_bw()+
  labs(x = "audio stimulus",
       y = "video stimulus",
       title = "Results grouped by answer and sex")
