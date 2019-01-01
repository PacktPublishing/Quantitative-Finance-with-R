#==================================================#
#                                                  #
#Script3.4 - Interest rate                         #
#                                                  #
#==================================================#

#==================================================#
#Compound interest rate - 1
#==================================================#

InitialCapital <- 10000
simple.interest <- 0.06 #p.a.
year <- seq(1,5)
Investment.simple <- numeric(5)
Total.simple <- numeric(5)
for (i in year){
Investment.simple[i] <- InitialCapital*simple.interest
if (i==1){
  Total.simple[i] <- InitialCapital+ Investment.simple[i]}
if (i>1){
  Total.simple[i] <- Total.simple[i-1]+ Investment.simple[i]}
}


Investment.comp <- numeric(5)
Total.comp <- numeric(5)
Discrepancy <- numeric(5)
for (i in year){
  if (i==1){
    Investment.comp[i] <- InitialCapital*simple.interest*year[i]
    Total.comp[i] <- InitialCapital+ Investment.comp[i]}
  if (i>1){
    Investment.comp[i] <- Total.comp[i-1]*simple.interest
    Total.comp[i] <- Total.comp[i-1]+ Investment.comp[i]}
  Discrepancy[i] <-  Total.comp[i] - Total.simple[i]
}

plot(Total.comp);lines(Total.comp);lines(Total.simple)
plot(Discrepancy);lines(Discrepancy)


#==================================================#
#Compound interest rate - 2
#==================================================#

InitialCapital = 10000
simple.interest = 0.06 #p.a.

semi.comp = equiv.rate(rate = simple.interest, from.freq = 1, to.freq = 2)
monthly.comp = equiv.rate(rate = simple.interest, from.freq = 1, to.freq = 12)
cont.comp = equiv.rate(rate = simple.interest, from.freq = 1, to.freq = Inf)

Investment.simple = InitialCapital*simple.interest
Investment.semi.comp = InitialCapital*((1+semi.comp/2)^2-1)
Investment.monthly.comp = InitialCapital*((1+monthly.comp/12)^12-1)
Investment.cont.comp = InitialCapital*(exp(cont.comp)-1)
