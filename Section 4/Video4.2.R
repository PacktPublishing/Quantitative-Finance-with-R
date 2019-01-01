#==================================================#
#                                                  #
#Video4.2 - R warm-up: Introduction to fOptions    #
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
#Download fOptions
#==================================================#
if (!require("fOptions")) {
  install.packages("fOptions")
  library(fOptions)
}

?fOptions