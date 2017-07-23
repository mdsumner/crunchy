#' Open files
#'
#' @name open-netcdf-4
#' @export
#' @importFrom ncdf4 nc_open
open_oc_file_ncdf4 <- function() {
  f <- system.file("extdata/oceandata/S2008001.L3m_DAY_CHL_chlor_a_9km.nc", package = "crunchy")
  ncdf4::nc_open(f)
}

#' Title
#'
#' @name open-netcdf-4
#' @export
#' @importFrom RNetCDF open.nc
open_oc_file_RNetCDF <- function() {
  f <- system.file("extdata/oceandata/S2008001.L3m_DAY_CHL_chlor_a_9km.nc", package = "crunchy")
  RNetCDF::open.nc(f)
}

