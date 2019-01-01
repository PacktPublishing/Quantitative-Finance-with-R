#==================================================#
#                                                  #
#Video3.2 - R warm-up: introduction to jrvFinance  #
#                                                  #
#==================================================#

#==================================================#
#Initial Setup
#==================================================#
rm(list = ls())  # cleanup the R environment
dev.off() # close graphical devices
cat("\014") # clear the console
setwd("/Users/marconeffelli/Packt") # Set the working directory
getwd() # Check current working directory

#==================================================#
#Download jrvFinance
#==================================================#
if (!require("jrvFinance")) {
  install.packages("jrvFinance")
  library(jrvFinance)
}

?jrvFinance