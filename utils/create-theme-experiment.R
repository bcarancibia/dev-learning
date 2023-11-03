library(tidyverse)
library(ggthemes)

#use iris as a way to test data / plots with themes
data(iris)
ggplot(iris, aes(x = Petal.Length)) +
  geom_histogram() 


#really like this guide
# https://waterdata.usgs.gov/blog/ggplot-jazz/