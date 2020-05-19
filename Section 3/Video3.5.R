#==================================================#
#                                                  #
#Script3.5 - Bond                                  #
#                                                  #
#==================================================#


#==================================================#
#Pricing a bond - Starting
#==================================================#
bond.TCF(settle, mature, coupon, freq, convention, redemption_value)
bond.price(settle, mature, coupon, freq, yield, convention, comp.freq,redemption_value)
bond.yield(settle, mature, coupon, freq, price, convention, comp.freq,redemption_value)
irr(cf, interval, cf.freq, comp.freq, cf.t = seq(from =0, by = 1/cf.freq, along.with = cf), r.guess, toler,convergence, max.iter, method = c("default", "newton","bisection"))

settle = as.Date("2018-04-07")
mature = as.Date("2020-04-07")
coupon = 0.10 #coupon rate in decimal
freq = 2 # frequency of coupon payments
yield = 0.2
price = 100
convention = c("ACT/ACT")
redemption_value = 100

bond <- bond.TCF(settle, mature, coupon, freq, convention, redemption_value)

#==================================================#
#Pricing a bond - Day-counting impact
#==================================================#
bond.price(settle, mature, coupon, freq, yield, convention = c("ACT/ACT"), comp.freq = freq,redemption_value = 100)
bond.price(settle, mature, coupon, freq, yield, convention = c("30/360"), comp.freq = freq,redemption_value = 100)
bond.price(settle, mature, coupon, freq, yield, convention = c("ACT/360"), comp.freq = freq,redemption_value = 100)
bond.price(settle, mature, coupon, freq, yield, convention = c("30/360E"), comp.freq = freq,redemption_value = 100)

bond.yield(settle, mature, coupon, freq, price, convention = c("ACT/ACT"), comp.freq = freq,redemption_value = 100)
bond.yield(settle, mature, coupon, freq, price, convention = c("30/360"), comp.freq = freq,redemption_value = 100)
bond.yield(settle, mature, coupon, freq, price, convention = c("ACT/360"), comp.freq = freq,redemption_value = 100)
bond.yield(settle, mature, coupon, freq, price, convention = c("30/360"), comp.freq = freq,redemption_value = 100)


#==================================================#
#Pricing a bond - yield to maturity (YTM)
#==================================================#

irr(cf, interval, cf.freq, comp.freq, cf.t = seq(from =0, by = 1/cf.freq, along.with = cf), r.guess, toler,convergence, max.iter, method = c("default", "newton","bisection"))
cf <- bond$cf
irr(c(-100,cf), interval = c(0,1), cf.freq = 2, comp.freq = 1, r.guess = 0, toler = 1e-06,convergence = 1e-08, max.iter = 100, method = c("default"))

bond.yield(settle, mature, coupon, freq = 2, price, convention = c("30/360","ACT/ACT", "ACT/360", "30/360E"), comp.freq = freq,redemption_value)

#==================================================#
#Pricing a bond - price/return relationship
#==================================================#
prices <- seq(80,120)
ytm <- numeric(41)
for (i in seq(1,41)){
ytm[i] <- bond.yield(settle, mature, coupon, freq, price=prices[i], convention, comp.freq = freq,redemption_value)
}
plot(prices,ytm)
