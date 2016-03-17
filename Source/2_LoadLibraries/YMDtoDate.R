YMDtoDate <- function(year, month, day) {
  # ISOdate(year, month, day)
  as.Date( paste( year, month, day )  , format = "%Y %m %d" )
}
