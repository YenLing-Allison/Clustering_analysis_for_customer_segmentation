# Clustering analysis for customr segmentation
https://github.com/YenLing-Allison/Clustering_analysis_for_customer_segmentation

# Business Question
Background:  
Company XYZ is a wholesale distributor that serves a number of business clients (e.g., retailers, restaurants, hotels, or cafes) in Portugal. 
The management of XYZ would like to get a deeper understanding of the spending patterns of their clients, so that they can make strategic decisions to better meet the clients' demand (e.g., to improve inventory management and avoid shortages).

Question:  
1. Apply the appropriate data analytics technique(s) to understand client spending patterns. Specically, are there any meaningful client groups or types? If so, how are they
distributed across different channels or regions?
2. Based on your exploratory findings, provide some recommendations to XYZ's management that may help them in decision-making.

# Resrources
Dataset contains 440 clients and their annual spending (in a standardized monetary unit). Each record corresponds to a client, and contains a client's region, channel, as well as the client's annual spending across 6 product categories.  

Dataset: [Wholesale customers data.csv](https://github.com/YenLing-Allison/Clustering_analysis_for_customer_segmentation/blob/8df230f5f9b0ec85906089c8c89e10cd7f4ad8d3/Wholesale%20customers%20data.csv)

# Analysis Process 
1. Data Preprocessing
-  Clean data
-  Exploratory analysis
2. Clustering Analysis
-  Calculate distances
-  Conduct clustering analysis - Hierarchical clustering, K-Means
3. Model Performance
-  SSE curve
-  Silhouette coefficient
  
Technical Document: [Clustering_analysis.R](https://github.com/YenLing-Allison/Clustering_analysis_for_customer_segmentation/blob/8df230f5f9b0ec85906089c8c89e10cd7f4ad8d3/Clustering_analysis.R)

# Result
#### Cluster 1: 11.14% of all customers, and their average annual spending amount is around 70K, focus more on Grocery item.
#### Cluster 2: With the most customers 57.8%, but their average annual spending is the lowest, 20K.
#### Cluster 3: 25.68% customers, and they focus more on fresh product.
#### Cluster 4: The minimum number of customers, but they are the most potential group, because they spend the highest average annual spending on XYZ retail, 75K.
<img width="960" alt="clustering_analysis" src="https://github.com/YenLing-Allison/Clustering_analysis_for_customer_segmentation/assets/144725779/122c83c6-5523-4a78-bbe8-bd5b21be2fb4">

