#' Structural specification functions for seminr package
#'
#' \code{paths} creates the structural paths of a PLS SEM model and \code{structure} generates
#' the matrix of paths for use by PLS modelling packages such as semPLS and simplePLS.
#'
#' @param from The source factor of a structural path
#'
#' @param to The destination factor of a structural path
#'
#' @param ... The function \code{paths} that specifies the source and destination factors
#'   for each of the model's structural paths.
#'
#' @usage
#' structure(...)
#' ## S3 method for class seminr
#'
#' paths(from = , to = )
#' ## S4 method for method structure()
#'
#' @examples
#' mobi_sm <- structure(
#'              paths(from = "Image",        to = c("Expectation", "Satisfaction", "Loyalty")),
#'              paths(from = "Expectation",  to = c("Quality", "Value", "Satisfaction")),
#'              paths(from = "Quality",      to = c("Value", "Satisfaction")),
#'              paths(from = "Value",        to = c("Satisfaction")),
#'              paths(from = "Satisfaction", to = c("Complaints", "Loyalty")),
#'              paths(from = "Complaints",   to = "Loyalty")
#'            )
#'
#' @aliases paths
#'
structure <- function(...) {
  return(matrix(c(...), ncol = 2, byrow = TRUE,
                dimnames = list(NULL, c("source", "target"))))
}

paths <- function(from, to) {
  return(as.vector(t(as.matrix(expand.grid(from, to)))))
}

