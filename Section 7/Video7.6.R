#==================================================#
#                                                  #
#Video7.6 - Getting Practical: hedging             #
#                                                  #
#==================================================#

#Install and load PortfolioAnalytics package
if (!require("PerformanceAnalytics")) {
  install.packages("PerformanceAnalytics")
  library(PerformanceAnalytics)
}

#==================================================#
#Task 1 - Hedging                                  #
#==================================================#

#Imagine to have some data stored in few CSV files.
AAPL <- Return.read("AAPL.csv", frequency="d")
SPX <- Return.read("SPX.csv", frequency="d")

par(mfrow=c(2,1))
par(mar = rep(2, 4))
plot(AAPL[,5])
plot(SPX[,5])
#use Return.calculate to calculate returns
AAPL.returns <- Return.calculate(AAPL[,5],"method"="log")
SPX.returns <- Return.calculate(SPX[,5],"method"="log")
AAPL.returns <- na.omit(AAPL.returns)
SPX.returns <- na.omit(SPX.returns)

par(mfrow=c(2,1))
par(mar = rep(2, 4))
plot(AAPL.returns)
plot(SPX.returns)



corr=cor(AAPL.returns,SPX.returns)
AAPL.sd=sd(AAPL.returns)
SPX.sd=sd(SPX.returns)
HedgeRatio <- corr*AAPL.sd/SPX.sd
HedgeRatio

CAPM.beta(AAPL.returns, SPX.returns, Rf = 0)

spot <- as.numeric(AAPL[c(250:251),1]) #apple
futures <- as.numeric(SPX[c(250:251),1]) #spx

#Long-short portfolio
Initial.position <- spot[1] - HedgeRatio*futures[1]
as.numeric(Initial.position)
spot.gain <- spot[2]-spot[1] #spot only - NEG
spot.gain
futures.gain <- -(HedgeRatio*futures[2] - HedgeRatio*futures[1])  
futures.gain #futures only - positive

New.position <- spot[2] - HedgeRatio*futures[2]
New.position

gain.fromg.hedge <- (New.position - Initial.position) 
gain.fromg.hedge

