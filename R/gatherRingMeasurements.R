POSpaths <- Sys.glob(file.path("C:/Users/dce25/Documents/R Projects/zelandica-IPO/SlaterMeasurements/", "*.pos"))
allMeasSeries <- ringdater::load_undated(POSpaths)
write.csv(allMeasSeries, file = "C:/Users/dce25/Documents/R Projects/zelandica-IPO/SlaterMeasurements/undated9-27.csv")
