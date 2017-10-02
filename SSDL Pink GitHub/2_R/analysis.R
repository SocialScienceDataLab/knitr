# Data Analysis and Visualization
# -------------------------------

# Set up environment
# ------------------
path <- "PATH OF THIS FOLDER"
setwd(path)
library(ggplot2) # for beautiful plotting


# Step 1: Read in the data
# ------------------------
ourdata <- read.csv(paste(path,"/1_Stata/outdata/DataFromStata.csv",sep=""),sep=";")
head(ourdata) # have a look at the data
class(ourdata)  # should be a data.frame to work with the plotting package 'ggplot2'


# Step 2: Estimate a bivariate linear regression
# ----------------------------------------------
model <- lm(price ~ mpg, data = ourdata)
summary(model)


# Step 3: Plot the result as a line and some data points
# ------------------------------------------------------

plot.1 <- ggplot(data=ourdata,aes(x=mpg,y=price)) +
          geom_smooth(method=lm,alpha=0.2,color="white",size=1.2) + # adds a trend line (replicating the bivariate linear regression above)
          geom_point() +  # adds a scatter plot
          theme_bw() +  # change the overall look
          scale_x_continuous(name = "Mileage") +
          scale_y_continuous(name = "Price (in $)")
#plot.1



# Save the results for knitr to take them
# ---------------------------------------

vartokeep <- c("model","plot.1")
save(list=vartokeep,file=paste(path,"/2_R/outresults/ResultsFromR.RData",sep=""))
