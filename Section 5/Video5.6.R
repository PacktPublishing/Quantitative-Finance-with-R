#====================================================#
#                                                    #
#Video5.6 - Getting Practical: Portfolio Optimization#
#                                                    #
#====================================================#

#Install and load PortfolioAnalytics package
if (!require("PortfolioAnalytics")) {
  install.packages("PortfolioAnalytics")
  library(PortfolioAnalytics)
}

if (!require("ROI")) {
  install.packages("ROI")
  library(ROI)
}

if (!require("ROI.plugin.quadprog")) {
  install.packages("ROI.plugin.quadprog")
  library(ROI.plugin.quadprog)
}

if (!require("ROI.plugin.glpk")) {
  install.packages("ROI.plugin.glpk")
  library(ROI.plugin.glpk)
}


#==================================================#
#  Task 1 - Working with EDHEC dataset             #
#==================================================#

#HOW TO Optimize a Portfolio -- WORKFLOW
#0 - Load Data
#1 - portfolio.spec
#2 - add.constraint
#3 - add.objective
#4 - optimize.portfolio
#5 - visualization: chart.Weights, chart.RiskReward

#------------#
#0 Load Data #
#------------#
data(edhec)
#preview the data
head(edhec)
#summary period statistics
summary(edhec)
#cumulative index returns
tail(cumprod(1+edhec),1)

#------------------#
#1 - portfolio.spec#
#------------------#
portf <- portfolio.spec(assets=colnames(edhec))
print(portf)

#------------------#
#2 - add.constraint#
#------------------#
# Add the full investment constraint that specifies the weights must sum to 1.
portf <- add.constraint(portfolio=portf, type="weight_sum", min_sum=0.99, max_sum=1.01)
portf <- add.constraint(portf, type="full_investment")
#Long-Only
portf <- add.constraint(portfolio=portf, type="long_only")

#-----------------#
#3 - add.objective#
#-----------------#
# Creates a new portfolio object using portf and adds mean as an objective
portf <- add.objective(portf, type="return", name="mean")

#----------------------#
#4 - optimize.portfolio#
#----------------------#
opt <- optimize.portfolio(edhec, portfolio = portf, constraints = NULL,
objectives = NULL, optimize_method = c("random", "ROI", "pso",
"GenSA"), search_size = 20000, trace = FALSE, rp = NULL,
momentFUN = "set.portfolio.moments", message = FALSE)

#----------------------#
#4 - Visualization     #
#----------------------#
extractWeights(opt)
extractObjectiveMeasures(opt)

#==================================================#
#  Task 2 - Create and plot efficient frontier     #
#==================================================#

data(edhec)
ret <- edhec[,1:6]
# Portfolio
p <- portfolio.spec(assets = colnames(ret))
p <- add.constraint(portfolio = p, type = "full_investment")
p <- add.constraint(portfolio = p, type = "long_only")
p <- add.objective(portfolio = p, type = "risk",
                     name = "StdDev")
# Optimisation
opt <- optimize.portfolio(R = ret, portfolio = p,optimize_method = "ROI")
#Visualisation
extractWeights(opt)
chart.Weights(opt)
extractObjectiveMeasures(opt)
EF=create.EfficientFrontier(ret,p,type="mean-var")
chart.EfficientFrontier(EF,match.col = "StdDev")
