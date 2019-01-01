#====================================================#
#                                                    #
#Video6.5 - CAPM                                     #
#                                                    #
#====================================================#

#Install and load PortfolioAnalytics package
if (!require("PerformanceAnalytics")) {
  install.packages("PerformanceAnalytics")
  library(PerformanceAnalytics)
}

#==================================================#
#  Task 1 - Uploading CSV file to R                #
#==================================================#

#Imagine to have some data stored in few CSV files.
AAPL <- Return.read("AAPL.csv", frequency="d")
AMZN <- Return.read("AMZN.csv", frequency="d")
SPX <- Return.read("SPX.csv", frequency="d")

#use Return.calculate to calculate returns
#Return.excess
AAPL <- Return.calculate(AAPL,"method"="log")
AMZN <- Return.calculate(AMZN,"method"="log")
SPX <- Return.calculate(SPX,"method"="log")

#==================================================#
#  Task 2 - Testing the CAPM model                 #
#==================================================#

beta_AAPL <- CAPM.beta(AAPL[,5], SPX[,5], Rf = 0)
beta_AMZN <- CAPM.beta(AMZN[,5], SPX[,5], Rf = 0)
