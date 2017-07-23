u <- "https://oceandata.sci.gsfc.nasa.gov/cgi/getfile/S2008001.L3m_DAY_CHL_chlor_a_9km.nc"
download.file(u, file.path("inst/extdata/oceandata", basename(u)), mode = "wb")
