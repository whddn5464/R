install.packages("dygraphs")
library(dygraphs, help, pos = 2, lib.loc = NULL)
library(ggplot2)
eco <-economics
head(eco)
library(xts)
econo <- xts(eco$unemploy,order.by =eco$date) 
head(econo)
dygraph(econo) %>% dyRangeSelector() 