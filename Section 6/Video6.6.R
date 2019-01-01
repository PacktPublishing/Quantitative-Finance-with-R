#====================================================#
#                                                    #
#Video6.6 - FAMA-FRENCH model                        #
#                                                    #
#====================================================#

#Install and load PortfolioAnalytics package
if (!require("PerformanceAnalytics")) {
  install.packages("PerformanceAnalytics")
  library(PerformanceAnalytics)
}

#==================================================#
#  Task 1 - working with FAMA-FRENCH dataset       #
#==================================================#

#Imagine to have some data stored in a CSV files.
AAPL <- Return.read("AAPL.csv", frequency="d")
AMZN <- Return.read("AMZN.csv", frequency="d")

FF3 <- Return.read("F-F_Research_Data_Factors_daily.csv",frequency="d")
FF5 <- Return.read("F-F_Research_Data_5_Factors_2x3_daily.csv",frequency="d")

AAPL <- Return.calculate(AAPL,"method"="log")
AAPL <- Return.excess(AAPL,as.numeric(tail(FF3[,4],1)))*100

AMZN <- Return.calculate(AMZN,"method"="log")
AMZN <- Return.excess(AMZN,as.numeric(tail(FF3[,4],1)))*100



#==================================================#
#  Task 2 - Testing FF3                            #
#==================================================#

lm(AAPL[2:252,5] ~ FF3[24101:24351,1]+FF3[24101:24351,2]+FF3[24101:24351,3])
lm(AMZN[2:252,5] ~ FF3[24101:24351,1]+FF3[24101:24351,2]+FF3[24101:24351,3])

#==================================================#
#  Task 2 - Testing FF5                            #
#==================================================#

lm(AAPL[2:252,5] ~ FF5[13681:13931,1]+FF5[13681:13931,2]+FF5[13681:13931,3]+
     FF5[13681:13931,4]+FF5[13681:13931,5])
lm(AMZN[2:252,5] ~ FF5[13681:13931,1]+FF5[13681:13931,2]+FF5[13681:13931,3]+
     FF5[13681:13931,4]+FF5[13681:13931,5])
