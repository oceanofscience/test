#' Read data file.
#'
#' This reads the bz2 file to be used in other functions of this package.
#' Users do not have to see the result of this function, thus it is not exported.
#' @param filename The name of the file to be called.
#' @return This function returns a part of file as a printed table.
fars_read <- function(filename) {
        if(!file.exists(filename))
                stop("file '", filename, "' does not exist")
        data <- suppressMessages({
                readr::read_csv(filename, progress = FALSE)
        })
        dplyr::tbl_df(data)
}
