#' Measurement functions
#'
#' \code{measure} creates the factors from measurement items by assigning the
#' relevant items to each factor and specifying formative or reflective type
#'
#' This function conveniently maps measurement items to factors using
#' root name, numbers, and affixes with explicit definition of formative
#' or reflective structure
#'
#' @param ... Reflective or Formative factors as generated by the \code{reflect()}
#' or \code{form()}
#'
#' @usage
#'   measurement_model <- measure(
#'                        reflect("factor1", multi_items("fac1", 1:3)),
#'                        reflect("factor2", multi_items("fac2", 1:3)),
#'                        )
#'
#' @seealso See \code{\link{form}}, \code{\link{reflect}}, \code{\link{multi_items}}
#'   and \code{\link{single_item}}
#'
#' @examples
#'   mobi_mm <- measure(
#'    reflect("Image",        multi_items("IMAG", 1:5)),
#'    reflect("Expectation",  multi_items("CUEX", 1:3)),
#'    reflect("Quality",      multi_items("PERQ", 1:7)),
#'    reflect("Value",        multi_items("PERV", 1:2)),
#'    reflect("Satisfaction", multi_items("CUSA", 1:3)),
#'    reflect("Complaints",   single_item("CUSCO")),
#'    reflect("Loyalty",      multi_items("CUSL", 1:3))
#'    )
measure <- function(...) {
  return(matrix(c(...), ncol = 2, byrow = TRUE,
                dimnames = list(NULL, c("source", "target"))))
}

reflect <- function(construct_name, item_names) {
  construct_names <- rep(construct_name, length(item_names))
  return(c(rbind(construct_names, item_names)))
}

form <- function(construct_name, item_names) {
  construct_names <- rep(construct_name, length(item_names))
  return(c(rbind(item_names, construct_names)))
}

#
#
# arguments:
#   item_name: root name of all items
#   item_numbers: vector of item numbers
#   ...: optional affix arguments
#     prefix: prefix before each item name
#     mid: insert between item name and numbers
#     suffix: suffix after each ite name
#
# e.g.> multi_items("item", 0:3, prefix="X_", mid=".", suffix="_")
#
multi_items <- function(item_name, item_numbers, ...) {
  affix <- as.data.frame(list(...))
  paste(affix$prefix, item_name, affix$mid, item_numbers, affix$suffix, sep = "")
}

single_item <- function(item) {
  return(item)
}
