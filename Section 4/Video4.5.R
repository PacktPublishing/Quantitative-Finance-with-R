#==================================================#
#                                                  #
#Video4.5 - Binomial Model                         #
#                                                  #
#==================================================#

#Install and load fOptions package
install.packages("fOptions")
library("fOptions")

#==================================================#
#  Task 1 -- Binomial Model                        #
#==================================================#

S0 <- 20
S1.a <- 22
op1.a <- 1 #option payoff
S1.b <- 18
op1.b <- 0
Delta <- 1/(22-18)
#synthetic ptf, 0.25long shares, 1short call option
ptf.a <- S1.a*Delta - op1.a
ptf.b <- S1.b*Delta - op1.b

risk.free <- 0.12
ptf0 <- ptf.a*exp(1)^(-risk.free*3/12)
op0 <- S0*Delta - ptf0

#==================================================#
#  Task 2 -- Binomial Model CRR                    #
#==================================================#

#Initial parameters
S<-39 #underlying price
K<- 40 #strike price
Time<- 0.5 #six months time to expiration
r<- 0.02 #risk free rate
b<- 0.02 #cost of carry
sigma <- 0.2 #volatility

help(BinomialTreeOption)

#Call and Put prices via Binomial Tree
n<- 3
CRRTree<- BinomialTreeOption('ce',S,K,Time,r,r,sigma,n)
BinomialTreePlot(CRRTree)

