---
title: "Clusting Analysis to categorize customers’ spending patterns for wholesale distributors"
author: "Allison Liu"
date: "2023-07-01"
output: html_document
---
  
# Load data
  library(dplyr)
  Wholesale_customers_data = read.csv("Wholesale customers data.csv")
  
# Clean Data and basic EDA
  # Check duplicated observations
  sum(duplicated(Wholesale_customers_data))
  
  # Check missing values
  sum(is.na(Wholesale_customers_data))
  
  # Summary of Database
  summary(Wholesale_customers_data)
  
  # Check outliers
  boxplot(Wholesale_customers_data)
  
# Descriptive statistics analysis
  # By Channel 
  Wholesale_customers_data %>% group_by(Channel) %>%
    summarise(count = n()) %>% mutate(Percentage=round(count/sum(count)*100,2))
  
  tapply(Wholesale_customers_data[,3:8], Wholesale_customers_data$Channel, summary)
  # First of all, we found that Channel 1 accounts for two-thirds. And, Region 3 has the most clients, 72%.
  # We found that in Channel 1, average annual spending on Fresh and Frozen are higher than that in Channel 2.
  # In Channel 2, average annual spending on Milk, Grocery, and Detergents_Paper are more than that in Channel 1.
  
  #By Region
  Wholesale_customers_data %>% group_by(Region) %>%
    summarise(count = n()) %>% mutate(Percentage=round(count/sum(count)*100,2))
  
  tapply(Wholesale_customers_data[,3:8], Wholesale_customers_data$Region, summary)

  # There is no significant difference in average annual spending on different categories across different regions.

  
# Clustering Analysis
  • Calculate distances:
    – Normalization;
    – Make a distance matrix from data.
  • Conduct clustering analysis:
    – Hierarchical clustering;
    – K-Means.
  • Evaluate the quality of clustering:
    – Plot the SSE curve;
    – Silhouette coefficient.
  
# Step1: Calculate distances
  #Normalize
  normalize = function(x){
    return ((x - min(x))/(max(x) - min(x)))}
  
  data_normalized = Wholesale_customers_data %>% mutate_at(c(3:8), normalize)

  #Distance Calculation: Distanc Matrix
  library(stats)
  distance_matrix = dist(data_normalized[,3:8], method = "euclidean")
  

# Step2: Conduct clustering analysis  
  # 1. Hierarchical Clustering
  set.seed(123)
  hierarchical = hclust(distance_matrix, method = "ward.D")
  plot(hierarchical, labels = data_normalized$Channel)
  rect.hclust(hierarchical, k = 4)   

  
  #cutree() can cut the dendrogram and tell you which entities belong to which cluster
  data_normalized$cluster = cutree(hierarchical, k=4)
  data_normalized %>% group_by(cluster) %>%
    summarise_at(c(3:8), mean)  

  # 2. K-Means Clustering
  set.seed(123)
  kcluster = kmeans(data_normalized[,3:8], centers = 4)
  kcluster$centers
  kcluster$cluster

  
# Step3: Evaluate the quality of clustering
  # Evaluate Clustering Solutions: SSE Curve  
  SSE_curve <- c()
  for (n in 1:10) {
    kcluster = kmeans(data_normalized[,3:8], n)
    sse = kcluster$tot.withinss
    SSE_curve[n] = sse}
  # plot SSE against number of clusters
  plot(1:10, SSE_curve, type = "b")
  
  # Evaluate Clustering Solutions: Silhouette coefficient
  library(cluster)
  sc = silhouette(data_normalized$cluster, dist = distance_matrix)
  summary(sc)
  