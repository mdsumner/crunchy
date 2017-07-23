context("netcdf-4")

test_that("ncdf4 works", {
 open_oc_file_ncdf4()
})

test_that("RNetCDF works", {
  open_oc_file_RNetCDF()
})
