#==================================================#
#                                                  #
#Video3.7 - Yield Curve                            #
#                                                  #
#==================================================#

if (!require("jrvFinance")) {
  install.packages("jrvFinance")
  library(jrvFinance)
}

#==================================================#
#Task 1 - Building the Yield Curve                 #
#==================================================#
# -- Yield and rates are expressed in cont.comp. notation

#Assume to find 5 bonds available in the market:
FV <- c(100,100,100,100,100)
settle = as.Date("2018-01-01")
maturity <- c(as.Date("2018-04-01"),as.Date("2018-07-01"),
              as.Date("2019-01-01"),
              as.Date("2019-07-01"),as.Date("2020-01-01"))
coupon <- c(0,0,0,8,12)
price <- c(97.5, 94.9, 90, 95.5,101.75)

rates_table = matrix(c(t(FV),t(as.character(maturity)),
              t(coupon),t(price)),ncol=4)
colnames(rates_table) <- c("FV","Maturity","Coupon","Price")
rownames(rates_table) <- c("Bond1","Bond2","Bond3","Bond4",
                           "Bond5")
View(rates_table)


convention = c("ACT/ACT")
redemption_value = 100


#Bond1
mature1 <- as.Date("2018-04-01")
bond1 <- bond.TCF(settle, mature1, coupon=0, freq=2, convention, redemption_value)
bond1.price <- price[1]

#Bond2
mature2 <- as.Date("2018-07-01")
bond2 <- bond.TCF(settle, mature2, coupon=0, freq=2, convention, redemption_value)
bond2.price <- price[2]

#Bond3
mature3 <- as.Date("2019-01-01")
bond3 <- bond.TCF(settle, mature3, coupon=0, freq=2, convention, redemption_value)
bond3.price <- price[3]

#Bond4
mature4 <- as.Date("2019-07-01")
bond4 <- bond.TCF(settle, mature4, coupon=0.08, freq=2, convention, redemption_value)
bond4.price <- price[4]

#Bond5
mature5 <- as.Date("2020-01-01")
bond5 <- bond.TCF(settle, mature5, coupon=0.12, freq=2, convention, redemption_value)
bond5.price <- price[5]

#Spot rates calculations
R.1 = log(bond1$cf/bond1.price)/0.25
R.2 = log(bond2$cf/bond2.price)/0.50
R.3 = log(bond3$cf[2]/bond3.price)/1.00
R.4 = log(bond4$cf[3]/(bond4.price-bond4$cf[1]*exp(-R.2*0.5)-
                         bond4$cf[2]*exp(-R.3*1)))/1.5
R.5 = log(bond5$cf[4]/(bond5.price-bond5$cf[1]*exp(-R.2*0.5)-
                         bond5$cf[2]*exp(-R.3*1)-bond5$cf[3]*exp(-R.4*1.5)))/2

times <- c(0.25,0.5,1,1.5,2)
rates <- c(R.1*100,R.2*100,R.3*100,R.4*100,R.5*100)
plot(times, rates,ylim=c(7,14))
lines(times,rates)
