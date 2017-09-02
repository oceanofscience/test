make_filename <- function(year) {
        year <- as.integer(year)
        sprintf("accident_%d.csv.bz2", year)
}

testthat::expect_that(make_filename(2013)(fars_read("accident_2013.csv.bz2")), throws_error())

