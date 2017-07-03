#library(raadtools)
#raadtools::ocfiles()$fullname[1]
#raadtools::ocfiles(varname = "CHL", type = "L3m")$fullname[1]
#raadtools::sstfiles()$fullname[1]
library(tibble)
src <- "https://oceandata.sci.gsfc.nasa.gov/cgi/getfile"
osrc <- "ftp://eclipse.ncdc.noaa.gov/pub/OI-daily-v2/NetCDF/1981/AVHRR"
sources <- tribble(
  ~source,                                               ~file,                   ~description,
  file.path(src, "A2002184.L3b_DAY_RRS.nc"),             "A2002184.L3b_DAY_RRS.nc", "compound type",
  file.path(src, "A2002184.L3m_DAY_CHL_chlor_a_4km.nc"), "A2002184.L3m_DAY_CHL_chlor_a_4km.nc", "standard mapped",
  file.path(osrc, "avhrr-only-v2.19810901.nc.gz"),          "avhrr-only-v2.19810901.nc.gz", "standard classic",
  "http://coastwatch.pfeg.noaa.gov/erddap/griddap/erdQSwind3day", "http://coastwatch.pfeg.noaa.gov/erddap/griddap/erdQSwind3day", "thredds"

)


td <- file.path(tempdir(), "dirunc")
chk <- dir.create(td)
sources$local <- sources$file
sources$local[!sources$source == sources$file] <- file.path(td, sources$file)[!sources$source == sources$file]

for (i in seq_len(nrow(sources))) {
  if (!is.na(sources$local[i])) {
    curl::curl_download(sources$source[i], sources$local[i])
    if (grepl("gz$", sources$local[i])) {
      system(sprintf("gunzip %s", sources$local[i]))
      sources$local[i] <- gsub("\\.gz", "", sources$local[i])
    }
  }
}

print(td)
## oceandata NetCDF4 SMI
## ocean data compound type L3bin
## classic form (the SST weekly OISST?)
## thredds

## Windows (ncdf4/RNetCDF)
## MacOS (??)
## Linux

