#' Data Frame of Wiki Graph
#'
#' The data.frame with three variables (v1, v2 and w) that contains the edges of the graph (from v1 to v2) with the weight of the edge (w).
#'
#' @format ## `wiki_graph`
#' A data frame with 18 rows and 3 columns:
#' \describe{
#'   \item{v1}{node(from)}
#'   \item{v2}{node(to)}
#'   \item{w}{Weight between two nodes}
#' }
#
#' @examples
#' library(Lab3)
#' dijkstra(wiki_graph, 1)
#'
#' @source https://en.wikipedia.org/wiki/Dijkstra%27s_algorithm
"wiki_graph"
