#==================================================#
#                                                  #
#Script2.6 - Getting Practical: SPX                #
#                                                  #
#==================================================#

#==================================================#
#S&P500 Statistical Analysis
#==================================================#
#get prices from Yahoo for S&P500 (GSPC is the ticker)
start <- as.Date("2010-01-01")
end <- as.Date("2018-11-01")
getSymbols("^gspc", src = "yahoo", from = start, to = end)

#get information about S&P500
class(GSPC)
dim(GSPC)
head(GSPC)
View(GSPC)
GSPC.prices = na.omit(GSPC[, "GSPC.Adjusted"])
plot(GSPC.prices)
summary(GSPC.prices)

#Derive S&P500 returns -- only geometric
GSPC.returns <- periodReturn(GSPC.prices,period='daily',subset=NULL,type='log',leading=TRUE)

#Plot S&P500 returns
plot(GSPC.returns, main = "SPX")

#Histogram
GSPC.hist = hist(GSPC.returns,plot=F,breaks=10)
hist(GSPC.returns,main="SP500", col="cornflowerblue",
     xlab="returns",
     breaks=GSPC.hist$breaks)

#qqplot
qqnorm(GSPC.returns, main="SP500 Returns", col="slateblue1")
qqline(GSPC.returns)

#Autocorrelation
SPX.acorr=acf(GSPC.returns, main="Fz. autocorrelation SPX")

#Statistical summaries
summary(GSPC.returns)