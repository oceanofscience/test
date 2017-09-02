#' Summary
#' using datafile of a specific year, the number of accidents per month are presented.
#'
#' @param year The year of the accidents recorded
#' @inheritParams fars_read_years
#' @return This function returns the number of accidents per month in the accident file
#' @importFrom dplyr bind_rows group_by summarize
#' @importFrom tidyr spread
#'
#' @export
fars_summarize_years <- function(years) {
        dat_list <- fars_read_years(years)
        dplyr::bind_rows(dat_list) %>%
                dplyr::group_by(year, MONTH) %>%
                dplyr::summarize(n = n()) %>%
                tidyr::spread(year, n)
}

