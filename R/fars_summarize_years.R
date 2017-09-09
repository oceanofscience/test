#' Summary
#' using datafile of a specific year, the number of accidents per month are presented.
#'
#' @param years The year of the accidents recorded
#' @return This function returns the number of accidents per month in the accident file
#' @importFrom dplyr bind_rows group_by summarize n
#' @importFrom tidyr spread
#' @importFrom magrittr %>%
#'
#' @export
fars_summarize_years <- function(years) {
        dat_list <- fars_read_years(years)
        dplyr::bind_rows(dat_list) %>%
                dplyr::group_by_(~ year, ~ MONTH) %>%
                dplyr::summarize_(n = ~ n()) %>%
                tidyr::spread_(~ year, ~ n)
}

