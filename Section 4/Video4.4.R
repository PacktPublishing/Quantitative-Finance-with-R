#==================================================#
#                                                  #
#Video4.4 - European and American Options          #
#                                                  #
#==================================================#

#Install and load fOptions package
install.packages("fOptions")
library("fOptions")

#==================================================#
#  Task 1 -- Payoff Analysis                       #
#==================================================#

S<- 39
K<- 40
call.price <- 1.927
put.price <- 2.529

#Payoff Long Call
f.call <- function(x) sapply(x, function(x) max(c(x-K-call.price, 0-call.price))) 
curve(f.call, 20, 60, main = "Payoff Long Call", col = "blue", lty = 1, lwd = 1, ylab = "Payoff",xlab="Price")

#Payoff Long Put
f.put <- function(x) sapply(x, function(x) max(c(K-x-put.price, 0-put.price)))
curve(f.put, 20, 60, main = "Payoff Long Put",col ="blue", add = FALSE, lty = 1, lwd = 1,ylab = "Payoff",xlab="Price") 

#Payoff Short Call
f.call <- function(x) sapply(x, function(x) min(c(call.price-(x-K), call.price))) 
curve(f.call, 20, 60, main = "Payoff Short Call", col = "blue", lty = 1, lwd = 1, ylab = "Payoff",xlab="Price")

#Payoff Short Put
f.put <- function(x) sapply(x, function(x) min(c(put.price-(K-x), put.price)))
curve(f.put, 20, 60, main = "Payoff Short Put",col ="blue", add = FALSE, lty = 1, lwd = 1,ylab = "Payoff",xlab="Price")