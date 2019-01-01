#==================================================#
#                                                  #
#Video5.4 - Risk/Return Paradigm                   #
#                                                  #
#==================================================#

#Install and load PortfolioAnalytics package
if (!require("PortfolioAnalytics")) {
  install.packages("PortfolioAnalytics")
  library(PortfolioAnalytics)
}

#==================================================#
#  Task 1 - Working with EDHEC dataset             #
#==================================================#

data(edhec)
dim(edhec)
View(edhec)
data <- as.matrix(edhec)
data.mean <- apply(data,2,mean)
data.mean
data.variance <- apply(data,2,var)
data.variance

plot(data.variance, data.mean, 
     main= "Risk/Return EDHEC dataset",
     xlab= "Risk - Variance",
     ylab= "Expected Return",
     col= "blue", pch = 19, cex = 1, lty = "solid", lwd = 2)

text(data.variance, data.mean, labels=colnames(edhec), cex= 0.7, pos=2)

cov.matrix <- cov(data)
cov.matrix
corr.matrix <- cor(data)
corr.matrix

#==================================================#
#  Task 2 - Correlation Analysis                   #
#==================================================#

#Install and load corrplot package
if (!require("corrplot")) {
  install.packages("corrplot")
  library(corrplot)
}

corrplot(corr.matrix, method="circle")
corrplot(corr.matrix, method="pie")
corrplot(corr.matrix, method="color")
corrplot(corr.matrix, method="number")
corrplot(corr.matrix, type="upper")

# correlogram with hclust reordering
corrplot(corr.matrix, type="upper", order="hclust")

# Change background color to lightblue
corrplot(corr.matrix, type="upper", order="hclust", col=c("black", "white"),
         bg="lightblue")
