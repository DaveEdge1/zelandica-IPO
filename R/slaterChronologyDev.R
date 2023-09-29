library(dplR)

slaterRWL <- dplR::read.rwl("C:/Users/dce25/Documents/R Projects/zelandica-IPO/SlaterMeasurements/slaterChronFirst2.csv")
rwl.stats(slaterRWL)

slaterChron <- detrend(slaterRWL, method = "Spline")

slaterMV <- chron(slaterChron)

slaterMV
plot(slaterMV)
saveRDS(slaterChron, file = "C:/Users/dce25/Documents/R Projects/zelandica-IPO/SlaterMeasurements/slaterChron3SeriesSept27.RDS")

TNrwl <- dplR::read.rwl("C:/Users/dce25/Documents/R Projects/zelandica-IPO/TreeNobAnalog2.csv")
TNChron <- detrend(TNrwl, method = "Spline", make.plot = TRUE)
TNmv <- chron(TNChron)

sst <- read.csv("C:/Users/dce25/Documents/R Projects/zelandica-IPO/HadISST-GoldenBay-anoms.csv")

TNrwl <- dplR::read.rwl("C:/Users/dce25/Documents/R Projects/zelandica-IPO/TreeNobAnalog3.csv")
TNChron <- detrend(TNrwl, method = "Spline", make.plot = TRUE)
TNmv <- chron(TNChron)

