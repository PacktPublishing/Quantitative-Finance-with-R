#==================================================#
#                                                  #
#Video3.6 - Duration and Mod. Duration             #
#                                                  #
#==================================================#

if (!require("jrvFinance")) {
  install.packages("jrvFinance")
  library(jrvFinance)
}

#==================================================#
#Task 1 - Calculate the duration of a bond         #
#==================================================#
#Consider a 3-year 10% bond with Face Value of $100 
settle <- as.Date("2018-01-01")
mature <- as.Date("2021-01-01")
coupon <- 0.1
freq <- 2
yield <- 0.12 #cont.comp. yield
convention <- c("ACT/ACT")
bond <-bond.TCF(settle, mature, coupon, freq, 
  convention, redemption_value = 100)
price <- bond.price(settle, 
  mature, coupon, freq, yield, convention, 
  comp.freq = Inf,redemption_value = 100)

pv <- bond$cf*exp(-yield*bond$t)
w <- pv/price
wt <- bond$t*w
dur <- sum(wt) 

#the same results could have been achieved using duration() formula
duration(bond$cf, yield, cf.freq = 2, 
         comp.freq = Inf, immediate.start = FALSE, modified = FALSE)

#create a table to display results
duration_table <- matrix(c(t(bond$cf),t(pv),t(w),t(wt)),ncol=4)
colnames(duration_table) <- c("CF","PV","W","Wt")
rownames(duration_table) <- c("0.5","1","1.5","2","2.5","3")
View(duration_table)

#==================================================#
#Task 2 - Duration in practice                     #
#==================================================#

#suppose delta_yield is +10 basis points (+0.1%)

price
dur
delta_yield <- 0.001
delta_price <- -price*dur*delta_yield
new_price <- price + delta_price
new_price

#more accurate
yield_new <- yield+delta_yield
new_price_acc <- bond.price(settle=as.Date("2018-01-01"), 
  mature=as.Date("2021-01-01"), coupon=0.1, freq, 
  yield_new, convention = c("ACT/ACT"), 
  comp.freq = Inf,redemption_value = 100)
new_price_acc

#==================================================#
#Task 3 - Modified Duration                        #
#==================================================#
#Suppose the yield is expressed with semi-annual comp.
price
dur
yield_semi <- equiv.rate(yield,Inf,2)
yield_semi
mod_dur <- duration(bond$cf, yield_semi, cf.freq = 2, 
  comp.freq = 2, immediate.start = FALSE, modified = TRUE)
mod_dur
delta_yield <- 0.001
delta_price <- -price*mod_dur*delta_yield
new_price <- price + delta_price
new_price
