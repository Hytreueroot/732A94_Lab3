#' Dijkstra's Algorithm
#'
#' @name dijkstra
#'
#' @param graph Data Frame
#' @param init_node Numeric Number
#'
#' @return The shortest path to every other node from the starting node as a vector.
#'
#' @description
#'  The algorithm takes a graph and an initial node and calculates the shortest path
#'  from the initial node to every other node in the graph.
#'
#'
#' @examples
#' wiki_graph <-
#' data.frame(v1=c(1,1,1,2,2,2,3,3,3,3,4,4,4,5,5,6,6,6),
#'            v2=c(2,3,6,1,3,4,1,2,4,6,2,3,5,4,6,1,3,5),
#'             w=c(7,9,14,7,10,15,9,10,11,2,15,11,6,6,9,14,2,9))
#'
#' dijkstra(wiki_graph, 1)
#' dijkstra(wiki_graph, 3)
#'
#' @references https://en.wikipedia.org/wiki/Dijkstra%27s_algorithm
#'
#' @export
dijkstra <- function(graph, init_node){
  stopifnot(is.numeric(init_node) &
              is.data.frame(graph) &
              init_node %in% unique(graph$v1) &
              all(colnames(graph) == c("v1", "v2", "w")) &
              length(colnames(graph)) == 3 &
              length(graph$v1) == length(graph$v2) &
              length(graph$v2) == length(graph$w) &
              is.atomic(init_node)
  )
  dist <- c()
  prev <- c()
  Q <- c()
  for (i in unique(graph$v1)){
    dist[i] <- Inf
    prev[i] <- NaN
    Q <- c(Q, i)
  }
  dist[init_node] <- 0

  while(length(Q) != 0){
    u <- min(Q)
    # for -which usage reference: https://sparkbyexamples.com/r-programming/r-remove-from-vector-with-examples/#:~:text=How%20to%20remove%20elements%20from,can%20remove%20the%20selected%20elements.
    Q <- Q[-which((Q %in% u))]

    for (j in graph$v2[graph$v1 == u]){
      alt <- dist[u] + graph$w[graph$v1 == j & graph$v2 == u]
      if (alt < dist[j]) {
        dist[j] <- alt
        prev[j] <- u
      }
    }
  }
  return(dist)
}
