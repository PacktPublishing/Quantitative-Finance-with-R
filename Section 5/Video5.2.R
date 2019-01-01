#==================================================#
#                                                  #
#Video5.2 - R warm-up: Introduction to             #
#                      PortfolioAnalytics          #
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
#Download PortfolioAnalytics
#==================================================#
if (!require("PortfolioAnalytics")) {
  install.packages("PortfolioAnalytics")
  library(PortfolioAnalytics)
}

?PortfolioAnalytics