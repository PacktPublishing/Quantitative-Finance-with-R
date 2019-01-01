#====================================================#
#                                                    #
#Video6.7 - Getting Practical - CAPM                 #
#                                                    #
#====================================================#

#Install and load PortfolioAnalytics package
if (!require("PerformanceAnalytics")) {
  install.packages("PerformanceAnalytics")
  library(PerformanceAnalytics)
}

#==================================================#
#  Task 1 - Working with Managers dataset          #
#==================================================#

data(managers)

CAPM.alpha(managers[,1:6],
           managers[,8:7,drop=FALSE],
           Rf=.035/12)
CAPM.alpha(managers[,1:6],
           managers[,8:7,drop=FALSE],
           Rf = managers[,10,drop=FALSE]) #3-month bill

CAPM.beta(managers[,1:6],
           managers[,8:7,drop=FALSE],
           Rf=.035/12)
CAPM.beta(managers[,1:6],
           managers[,8:7,drop=FALSE],
           Rf = managers[,10,drop=FALSE])

CAPM.beta.bull(managers[,1:6],
          managers[,8:7,drop=FALSE],
          Rf=.035/12)
CAPM.beta.bull(managers[,1:6],
          managers[,8:7,drop=FALSE],
          Rf = managers[,10,drop=FALSE])

CAPM.beta.bear(managers[,1:6],
          managers[,8:7,drop=FALSE],
          Rf=.035/12)
CAPM.beta.bear(managers[,1:6],
          managers[,8:7,drop=FALSE],
          Rf = managers[,10,drop=FALSE])

TimingRatio(managers[,1:6],
          managers[,8:7,drop=FALSE],
          Rf=.035/12)
TimingRatio(managers[,1:6],
          managers[,8:7,drop=FALSE],
          Rf = managers[,10,drop=FALSE])

CAPM.RiskPremium(managers[,1:6],
           Rf=.035/12)
CAPM.RiskPremium(managers[,1:6],
           Rf = managers[,10,drop=FALSE])

#==================================================#
#  Task 2 - The CML                                #
#==================================================#

CAPM.CML.slope(managers[,"SP500 TR",drop=FALSE], 
               managers[,10,drop=FALSE])
