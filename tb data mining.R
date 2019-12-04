setwd("C:/TB-DATA MINING (001,004,037)")
getwd()

install.packages("tidyverse")
install.packages("cluster")
install.packages("factoextra")

library(tidyverse)
library(cluster)    # Algoritma klastering
library(factoextra) # Algoritma klastering dan visualisasi

dataset <- read.csv("USArrest.csv", sep = ";")
str(dataset)

dataclus <- USArrests
str(dataclus)
head(dataclus)
dataclus1 <- na.omit(dataclus) #untuk menghilangkan data missing
summary(dataclus1)

datafix <- scale(dataclus1) #standarisasi data
fviz_nbclust(datafix, kmeans, method = "wss") # metode elbow











fviz_nbclust(datafix, kmeans, method = "silhouette") # metode silhouette















set.seed(123)
gap_stat <- clusGap(datafix, FUN = kmeans, nstart = 25,
                    K.max = 10, B = 50) # metode gap statistic
fviz_gap_stat(gap_stat)
final <- kmeans(datafix, 4, nstart = 25)
print(final)
fviz_cluster(final, data = datafix)
USArrests %>%
  mutate(Cluster = final$cluster) %>%
  group_by(Cluster) %>%
  summarise_all("mean")

?fviz
?nbclust
?datafix
?set.seed
?gap_stat
?mutate
?group_by
?fun
?summari