#' make filename by giving the year as parameter only.
#'
#' Because this is used by other functions of this package,
#' users don't have to see the result of this function, thus it is not exported.
#'
#' @param year The year of the accidents recorded
#' @return This function returns a file name that corresponds to the \code{year}
#' inputted as parameter
make_filename <- function(year) {
        year <- as.integer(year)
        sprintf("accident_%d.csv.bz2", year)
}

