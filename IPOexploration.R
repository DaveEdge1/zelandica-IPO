library(reshape2)
library(ggplot2)

ma <- function(x, n = 5){filter(x, rep(1 / n, n), sides = 2)}

IPOts <- read.csv("IPOts.csv")
head(IPOts)
names(IPOts)[1] <- "Year"
IPOts <- IPOts[IPOts$Year >= 1650 & IPOts$Year <= 1996,]

cor(IPOts[IPOts$Year >= 1650 & IPOts$Year <= 1699,-1])
cor(IPOts[IPOts$Year >= 1700 & IPOts$Year <= 1749,-1])
cor(IPOts[IPOts$Year >= 1750 & IPOts$Year <= 1799,-1])
cor(IPOts[IPOts$Year >= 1800 & IPOts$Year <= 1849,-1])
cor(IPOts[IPOts$Year >= 1850 & IPOts$Year <= 1899,-1])
cor(IPOts[IPOts$Year >= 1900 & IPOts$Year <= 1949,-1])
cor(IPOts[IPOts$Year >= 1950 & IPOts$Year <= 1996,-1])

mean(cor(IPOts[IPOts$Year >= 1650 & IPOts$Year <= 1699,-1]))
mean(cor(IPOts[IPOts$Year >= 1700 & IPOts$Year <= 1749,-1]))
mean(cor(IPOts[IPOts$Year >= 1750 & IPOts$Year <= 1799,-1]))
mean(cor(IPOts[IPOts$Year >= 1800 & IPOts$Year <= 1849,-1]))
mean(cor(IPOts[IPOts$Year >= 1850 & IPOts$Year <= 1899,-1]))
mean(cor(IPOts[IPOts$Year >= 1900 & IPOts$Year <= 1949,-1]))
mean(cor(IPOts[IPOts$Year >= 1950 & IPOts$Year <= 1996,-1]))

IPOts[-1] <- apply(IPOts[-1], 2, function(x) scale(x))
IPOts[-1] <- IPOts[-1] + 5
IPOts[-1] <- apply(IPOts[-1], 2, function(x) dplR::detrend.series(x, method = "Spline", nyrs = 11, return.info = TRUE)$curves)
IPOts[-1] <- IPOts[-1] - 5
IPOdat <- melt(IPOts, id.vars="Year")
names(IPOdat)[2:3] <- c("Method", "Index")

p1 <- ggplot(data = IPOdat, mapping = aes(x=Year, y=Index, color=Method))+geom_line(lty=1) +theme_classic() +
  theme(text = element_text(size=15),
        #plot.title = element_text(hjust = 0.5),
        legend.position = "bottom")
  #ggtitle("Reconstructions of IPO")

ggsave(filename = "IPOrecons.png", p1)

dplR::detrend.series(IPOts[,2], method = "Spline", nyrs = 11, return.info = TRUE)$curves
