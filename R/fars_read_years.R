
#' Select data
#' This function harvests data from the file for summary or drawing maps.
#' Users don't need to do this separately, thus this function is not exported.
#'
#' @param year The year of the accidents recorded
#' @inheritParams make_filename
#' @return This function returns month data of the accidents in the accident file
#' @importFrom dplyr mutate select
fars_read_years <- function(years) {
        lapply(years, function(year) {
                file <- make_filename(year)
                tryCatch({
                        dat <- fars_read(file)
                        dplyr::mutate(dat, year = year) %>%
                                dplyr::select(MONTH, year)
                }, error = function(e) {
                        warning("invalid year: ", year)
                        return(NULL)
                })
        })
}

