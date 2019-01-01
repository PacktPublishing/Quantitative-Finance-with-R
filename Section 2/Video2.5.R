#==================================================#
#                                                  #
#Script2.5 - Predictability of asset returns....   #
#                                                  #
#==================================================#

#==================================================#
#Monte Carlo - Throwing a dice
#==================================================#
#Dice throws
set.seed(80)
roll = sample(1:6, 10000, replace=T)
outcome <- as.data.frame(table(roll))
View(outcome)
barplot(t(as.matrix(table(roll))),col=rainbow(6),main="Dice throws",ylab="frequency")

#==================================================#
#Monte Carlo - Returns simulation
#==================================================#
mu=0.01
sigma=0.02
n=1000
m=100
set.seed(80)

#Generate m*n Gaussian simulations stored in matrix u (n*m)
u <- matrix(rnorm(n*m,0,1), n,m)
#Generate m returns paths of size n
Rt <- mu + sigma*u
#Plot
matplot(Rt,type = 'l')

#Simulate a Brownian Motion
#diffinv(c(1,2,3,4,5))
Wt<- apply(u,2, diffinv)
BM <- mu + sigma*Wt
matplot(BM,type = 'l')
