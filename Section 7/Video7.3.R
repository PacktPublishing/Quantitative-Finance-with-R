#==================================================#
#                                                  #
#Video7.3 - Value-at-Risk                          #
#                                                  #
#==================================================#

if (!require("quantmod")) {
  install.packages("quantmod")
  library(quantmod)
}
if (!require("PerformanceAnalytics")) {
  install.packages("PerformanceAnalytics")
  library(PerformanceAnalytics)
}

#==================================================#
#Task 1 - VaR Calculation                          #
#==================================================#
#get prices from Yahoo for S&P500 (GSPC is the ticker)
start <- as.Date("2018-01-01")
end <- as.Date("2018-11-01")
getSymbols("^gspc", src = "yahoo", from = start, to = end)
GSPC.prices <- na.omit(GSPC[, "GSPC.Adjusted"])
GSPC.returns <- periodReturn(GSPC.prices,period='daily',subset=NULL,type='log',leading=TRUE)

#Parametric VaR - Normality assumption
GSPC.mean <- mean(GSPC.returns)
GSPC.variance <- var(GSPC.returns)
horizon <- 1
confidence <- qnorm(0.05)
GSPC.VaR.p <- (GSPC.mean*horizon + confidence*sqrt(horizon*GSPC.variance))
GSPC.VaR.p

help(VaR)
VaR(GSPC.returns, 0.95, method = c("gaussian"))

#Non-Parametric VaR - model-free
GSPC.returns.sorted <- sort(GSPC.returns)
GSPC.VaR.np <- -GSPC.returns.sorted[round(0.05*dim(GSPC.returns)[1]),]
GSPC.VaR.np

#Comparison
GSPC.VaR.p
GSPC.VaR.np
VaR(GSPC.returns, 0.95, method = c("historical"))


help(chart.VaRSensitivity)
chart.VaRSensitivity(GSPC.returns, methods = c("GaussianVaR",
                                               "HistoricalVaR"),
                     clean = c("none", "boudt", "geltner"), elementcolor = "darkgray",
                     reference.grid = TRUE, xlab = "Confidence Level",
                     ylab = "Value at Risk", type = "l", lty = c(1, 2, 4), lwd = 1,
                     colorset = (1:12), pch = (1:12))
