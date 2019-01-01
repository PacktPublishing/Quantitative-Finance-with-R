#==================================================#
#                                                  #
#Video4.6 - Black Scholes Model                    #
#                                                  #
#==================================================#

#Install and load fOptions package
install.packages("fOptions")
library("fOptions")

#==================================================#
#  Task 1 -- Valuing an option with BS model       #
#==================================================#

#=========================#
#Black-Scholes formula for#
#  European call and put  #
#       options           #
#=========================#


## Black-Scholes Function
BS <- function(S, K, r, T, sigma, type){
  d1 <- (log(S/K) + (r + sigma^2/2)*T) / (sigma*sqrt(T))
  d2 <- d1 - sigma*sqrt(T)
  if(type=="C"){
    value <- S*pnorm(d1) - K*exp(-r*T)*pnorm(d2)
  }
  if(type=="P"){
    value <- K*exp(-r*T)*pnorm(-d2) - S*pnorm(-d1)
  }
  return(value)
}

S<- 39
K<- 40
r<- 0.02
Time<- 180/360
sigma<- 0.2

call.price<- BS(S,K,r,Time,sigma,"C")
put.price<- BS(S,K,r,Time,sigma,"P")

#Call and Put prices via fOptions BS formula
call<- GBSOption('c',S,K,Time,r,r,sigma)
call.price.new<- GBSOption('c',S,K,Time,r,r,sigma)@price
put<- GBSOption('p',S,K,Time,r,r,sigma)
put.price.new<- GBSOption('p',S,K,Time,r,r,sigma)@price

#==================================================#
#  Task 2 -- Comparison with Binomial Model        #
#==================================================#

j=1
Discrepancy<- numeric(5) 
#Call and Put prices via Binomial Tree
for (n in c(2,100,500,1000,10000)){
CRRTree<- BinomialTreeOption('ce',S,K,Time,r,r,sigma,n)
#Comparison between the two methodology
Discrepancy[j]<- abs(CRRTree[1,1] - call.price)
j=j+1
}
print(Discrepancy)


#==================================================#
#  Task 3 -- Moneyness Impact                      #
#==================================================#

#Deep out of the money
S<- 30
call.price<- GBSOption('c',S,K,Time,r,r,sigma)@price
f.call <- function(x) sapply(x, function(x) max(c(x-K-call.price, 0-call.price))) 
curve(f.call, 20, 60, main = "Payoff Long Call", col = "blue", lty = 1, lwd = 1, ylab = "Payoff",xlab="Price")
points(K+call.price, y = 0, pch = 21, bg = "red")

#Out of the money
S<- 39
call.price<- GBSOption('c',S,K,Time,r,r,sigma)@price
f.call <- function(x) sapply(x, function(x) max(c(x-K-call.price, 0-call.price))) 
curve(f.call, 20, 60, main = "Payoff Long Call", col = "blue", lty = 1, lwd = 1, ylab = "Payoff",xlab="Price")
points(K+call.price, y = 0, pch = 21, bg = "red")

#At the money
S<- 40
call.price<- GBSOption('c',S,K,Time,r,r,sigma)@price
f.call <- function(x) sapply(x, function(x) max(c(x-K-call.price, 0-call.price))) 
curve(f.call, 20, 60, main = "Payoff Long Call", col = "blue", lty = 1, lwd = 1, ylab = "Payoff",xlab="Price")
points(K+call.price, y = 0, pch = 21, bg = "red")

#In the money
S<- 41
call.price<- GBSOption('c',S,K,Time,r,r,sigma)@price
f.call <- function(x) sapply(x, function(x) max(c(x-K-call.price, 0-call.price))) 
curve(f.call, 20, 60, main = "Payoff Long Call", col = "blue", lty = 1, lwd = 1, ylab = "Payoff",xlab="Price")
points(K+call.price, y = 0, pch = 21, bg = "red")

#Deep in the money
S<- 50
call.price<- GBSOption('c',S,K,Time,r,r,sigma)@price
f.call <- function(x) sapply(x, function(x) max(c(x-K-call.price, 0-call.price))) 
curve(f.call, 20, 60, main = "Payoff Long Call", col = "blue", lty = 1, lwd = 1, ylab = "Payoff",xlab="Price")
points(K+call.price, y = 0, pch = 21, bg = "red")
