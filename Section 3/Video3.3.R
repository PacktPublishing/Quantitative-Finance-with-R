#==================================================#
#                                                  #
#Script3.3 - Day-convention                        #
#                                                  #
#==================================================#

#==================================================#
#Install and load jrvFinance package
#==================================================#
library("jrvFinance")

#==================================================#
#Day-convention impact
#==================================================#
yearFraction(d1, d2, r1, r2, freq, convention)
daycount.actual(d1, d2, variant)
daycount.30.360(d1, d2, variant)


d1 = as.Date("2017-01-01") #starting date of period for day counts
d2 = as.Date("2018-01-01") #ending date of period for day counts
r1 = as.Date("2017-01-01") #starting date of reference period for ACT/ACT day counts
r2 = as.Date("2018-01-01") #ending date of reference period for ACT/ACT day counts

yearFraction(d1, d2, r1, r2, freq = 2, convention = c("ACT/ACT"))
yearFraction(d1, d2, freq = 2, convention = c("30/360"))
yearFraction(d1, d2, freq = 2, convention = c("ACT/360"))
yearFraction(d1, d2, freq = 2, convention = c("30/360E"))
daycount.actual(d1, d2, variant = c("bond"))
daycount.30.360(d1, d2, variant = c("US"))
daycount.30.360(d1, d2, variant = c("EU"))


#==================================================#
#Day-convention impact
#==================================================#
bond.price(settle, mature, coupon, freq, yield, convention, comp.freq,redemption_value)
bond.yield(settle, mature, coupon, freq, price, convention, comp.freq,redemption_value)


settle = as.Date("2018-04-07")
mature = as.Date("2020-04-07")
coupon = 0.10 #coupon rate in decimal
freq = 1 # frequency of coupon payments
yield = 0.2
price = 100


bond.price(settle, mature, coupon, freq, yield, convention = c("ACT/ACT"), comp.freq = freq,redemption_value = 100)
bond.price(settle, mature, coupon, freq, yield, convention = c("30/360"), comp.freq = freq,redemption_value = 100)
bond.price(settle, mature, coupon, freq, yield, convention = c("ACT/360"), comp.freq = freq,redemption_value = 100)
bond.price(settle, mature, coupon, freq, yield, convention = c("30/360E"), comp.freq = freq,redemption_value = 100)

bond.yield(settle, mature, coupon, freq, price, convention = c("ACT/ACT"), comp.freq = freq,redemption_value = 100)
bond.yield(settle, mature, coupon, freq, price, convention = c("30/360"), comp.freq = freq,redemption_value = 100)
bond.yield(settle, mature, coupon, freq, price, convention = c("ACT/360"), comp.freq = freq,redemption_value = 100)
bond.yield(settle, mature, coupon, freq, price, convention = c("30/360"), comp.freq = freq,redemption_value = 100)
