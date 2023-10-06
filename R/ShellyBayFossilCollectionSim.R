library(dplR)

TNdead <- dplR::read.rwl("C:/Users/dce25/Documents/R Projects/zelandica-IPO/TreeNobModern.csv")
dplR::plot.rwl(TNdead)
min(!is.na(TNdead))
startYears <- apply(TNdead, 2, function(x) min(which((!is.na(x)))))
ks.test(startYears, "punif", min(startYears), max(startYears))
hist(startYears)

shellyAges <- read.csv("C:/Users/dce25/Documents/R Projects/zelandica-IPO/ShellyOver30.csv")
shellyAges <- shellyAges[,1]

bins <- seq(min(startYears)-1, max(startYears)+1,length.out=21)
#bins=abs(bins-1970)

samplesAll <- list()
df1 <- data.frame("Year"=1:246)
count=1
for (i in 1:(length(bins)-1)){
  sampleSize <- sum(startYears > bins[i] & startYears < bins[(i+1)])
  yrs1 <- sample(ceiling(bins[i]):floor(bins[(i+1)]), size = sampleSize, replace = TRUE)
  longevity1 <- sample(shellyAges,replace = TRUE, size = sampleSize)
  samplesAll[[i]] <- data.frame("StartYr"=yrs1,
                                "longevity"=longevity1)
  if (sampleSize>0){
    for(ii in 1:sampleSize){
      sampleID=paste0("Sample",count)
      df1 <- merge.data.frame(df1,data.frame("Year"=yrs1[ii]:(yrs1[ii]+longevity1[ii]-1), rep(1,longevity1[ii])),all.x = TRUE)
      colnames(df1)[dim(df1)[2]] <- sampleID
      cat(sampleID, "\n")
      count=count+1
    }
  }


}

write.csv(df1[,-1], "C:/Users/dce25/Documents/R Projects/zelandica-IPO/simulRWL.csv")
simulRWL <- read.rwl("C:/Users/dce25/Documents/R Projects/zelandica-IPO/simulRWL.csv")
plot.rwl(simulRWL)

plot.crn(chron(df1[10:dim(df1)[1],]))

apply(df1[10:dim(df1)[1],], 1, function(x) sum(!is.na(x)))

x<-runif(100,-1,1)
ks.test(x,"punif",-1,1)

hist(startYears)
hist(x)



sample(shellyAges[1,], replace = TRUE,size = 5)


factors <- function(x) {
  x <- as.integer(x)
  div <- seq_len(abs(x))
  factors <- div[x %% div == 0L]
  factors <- list(neg = -factors, pos = factors)
  return(factors)
}


