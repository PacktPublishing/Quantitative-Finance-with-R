#==================================================#
#                                                  #
#Script2.3 - Equity: definition and prices download#
#                                                  #
#==================================================#

#==================================================#
#Download the time series for Apple (AAPL)
#==================================================#
start <- as.Date("2018-01-01")
end <- as.Date("2018-10-01")
getSymbols("AAPL", src = "yahoo", from = start, to = end)
#the result is a matrix called AAPL

#check element class
class(AAPL)

#view main information without opening it
head(AAPL)
View(AAPL)

#==================================================#
#Plot AAPL time series for closing prices
#==================================================#
plot(AAPL[, "AAPL.Close"], main = "AAPL")
#plot AAPL time series for opening prices
plot(AAPL[, "AAPL.Open"], main = "AAPL")

#==================================================#
#plot the candlechart for AAPL
#==================================================#
candleChart(AAPL[seq(1:10),], up.col = "black", dn.col = "red", theme = "white")










# #Download more than a single time series at the same time
# getSymbols(c("MSFT", "GOOG"), src = "yahoo", from = start, to = end)
# 
# 
# #The as. command forces the object to change
# stocks <- as.xts(data.frame(AAPL = AAPL[, "AAPL.Close"], MSFT = MSFT[, "MSFT.Close"], 
#                             GOOG = GOOG[, "GOOG.Close"]))
# head(stocks)
# View(stocks)
# 
# plot(as.zoo(stocks), screens = 1, lty = 1:3, xlab = "Date", ylab = "Price")
# legend("right", c("AAPL", "MSFT", "GOOG"), lty = 1:3, cex = 0.5)