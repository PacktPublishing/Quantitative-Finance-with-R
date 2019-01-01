#==================================================#
#                                                  #
#Video7.4 - VaR: benefits and pitfalls             #
#                                                  #
#==================================================#

if (!require("PerformanceAnalytics")) {
  install.packages("PerformanceAnalytics")
  library(PerformanceAnalytics)
}

#==================================================#
# Task 1 - Var does not describe maximum loss      #
#==================================================#

set.seed(30) #30
stock=rlnorm(1000, meanlog = 0, sdlog = 1)-1
stock.hist = hist(stock,plot=F,breaks=1000)
hist(stock,main="P&L", col="cornflowerblue",
     xlab="returns",
     breaks=stock.hist$breaks, xlim = c(-1, 3))
stock.sort=sort(stock)
stock.VaR.np <- -stock.sort[round(0.1*length(stock))]
abline(v=-stock.VaR.np, col="red")


#==================================================#
# Task 2 - VaR can be against diversification      #
#==================================================#

set.seed(50) #30
stock=rlnorm(1000, meanlog = 0, sdlog = 1)
stock.sort=sort(stock)
stock.VaR.np <- stock.sort[round(0.1*length(stock))]

set.seed(30) #30
stock1=rlnorm(1000, meanlog = 0, sdlog = 1)
stock.sort1=sort(stock1)
stock.VaR.np1 <- stock.sort[round(0.1*length(stock))]

ptf <- stock+stock1
ptf.sort=sort(ptf)
ptf.VaR.np <- ptf.sort[round(0.1*length(ptf))]

stock.VaR.np+stock.VaR.np1
ptf.VaR.np

