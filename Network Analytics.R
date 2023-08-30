
network.full <- graph_from_data_frame(edges.full,
                                      directed = TRUE,
                                      vertices = nodes)

*generating table of different status/roles of the employees in this dataset
table(V(network.full)$status)

*generating degree, betweenness, and eigenvector/influence centrality scores
nodes$degree_total <- degree(network.full, 
                             v = V(network.full), 
                             mode = c("total"))

nodes$betweenness <- betweenness(network.full, 
                                 v = V(network.full), 
                                 directed = TRUE,
                                 weights = NULL,
                                 nobigint = TRUE,
                                 normalized = FALSE)

nodes$eigen <- eigen_centrality(network.full, 
                                directed = TRUE,
                                weights = NULL,
                                scale = TRUE,
                                options = arpack_defaults)$vector

head(nodes[order(nodes$degree_total,
                 decreasing = TRUE),], n = 10L)

head(nodes[order(nodes$betweenness,
                 decreasing = TRUE),], n = 10L)

head(nodes[order(nodes$eigen,
                 decreasing = TRUE),], n = 10L)

*generating count of employees are within 1 step of Kenneth Lay in email network:
  neighborhood.size(network.full, 
                    1, 
                    V(network.full)$name == "kenneth.lay@enron.com")

*generating count of employees are within 2 steps of Kenneth Lay in email network:
  neighborhood.size(network.full, 
                    2, 
                    V(network.full)$lastName == "Lay")


*generating set of emails to and from Kenneth Lay during defined time period.  Can then scroll through mails.lay to look at content of emails

edges.full$date.R <- as.POSIXct(edges.full$date)

mails.lay <- edges.full[(edges.full$sender == "kenneth.lay@enron.com" &
                           as.Date(edges.full$date.R) > "2001-10-17 00:00:00" &
                           as.Date(edges.full$date.R) < "2001-10-31 00:00:00") |
                          (edges.full$receiver == "kenneth.lay@enron.com" &
                             as.Date(edges.full$date.R) > "2001-10-17 00:00:00" &
                             as.Date(edges.full$date.R) < "2001-10-30 00:00:00")
                        