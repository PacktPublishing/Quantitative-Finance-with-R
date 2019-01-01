#==================================================#
#                                                  #
#Video5.5 - Capital Asset Line                     #
#                                                  #
#==================================================#

#Install and load PortfolioAnalytics package
if (!require("PortfolioAnalytics")) {
  install.packages("PortfolioAnalytics")
  library(PortfolioAnalytics)
}

#==================================================#
# Task 1 - Capital Allocation Line                 #
#==================================================#

data(edhec)
ret <- edhec[,c(2,3)]
mu.A <- mean(ret[,1])*100
sig.A <- sd(ret[,1])*100
mu.B <- mean(ret[,2])*100
sig.B <- sd(ret[,2])*100

r.f = 0.03
#PTF1 - Asset A and risk free
x.A = seq(from=0, to=1.4, by=0.1) #weights changing from 0 to 1.4
mu.p.A = r.f + x.A*(mu.A - r.f)
sig.p.A = x.A*sig.A
#PTF2 - Asset B and risk free
x.B = seq(from=0, to=1.4, by=0.1)
mu.p.B = r.f + x.B*(mu.B - r.f)
sig.p.B = x.B*sig.B

plot(sig.p.A, mu.p.A, type="b", col="black", ylim=c(0, max(mu.p.A)), 
     xlim=c(0, max(sig.p.A, sig.p.B)), pch=16,
     xlab=expression(sigma[p]), ylab=expression(mu[p]))
points(sig.p.A[1],mu.p.A[1],col="red", pch=16)
points(sig.p.A[11],mu.p.A[11],col="red", pch=16)

points(sig.p.B, mu.p.B, type="b", col="blue", pch=16)
text(x=sig.A, y=mu.A, labels="Asset A", pos=4)
text(x=sig.B, y=mu.B, labels="Asset B", pos=1)
text(x=0, y=r.f, labels =expression(r[ f ]), pos=2)
points(sig.p.B[1],mu.p.B[1],col="red", pch=16)
points(sig.p.B[11],mu.p.B[11],col="red", pch=16)
