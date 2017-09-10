#' Draw map
#' using datafile of a specific year, yearly accident in a state is drawn in a map.
#'
#' @param year The year of the accidents recorded
#' @param state.num State number
#' @return This function returns yearly accident map
#' @importFrom dplyr filter
#' @importFrom maps map
fars_map_state <- function(state.num, year) {
        filename <- make_filename(year)
        data <- fars_read(filename)
        state.num <- as.integer(state.num)

        if(!(state.num %in% unique(data$STATE)))
                stop("invalid STATE number: ", state.num)
        data.sub <- dplyr::filter_(~ data, ~ STATE == state.num)
        if(nrow(data.sub) == 0L) {
                message("no accidents to plot")
                return(invisible(NULL))
        }
        is.na(data.sub$LONGITUD) <- data.sub$LONGITUD > 900
        is.na(data.sub$LATITUDE) <- data.sub$LATITUDE > 90
        with(data.sub, {
                maps::map("state", ylim = range(LATITUDE, na.rm = TRUE),
                          xlim = range(LONGITUD, na.rm = TRUE))
                points(LONGITUD, LATITUDE, pch = 46)
        })
}


