# load libraries
library(dplyr)
library(tidyr)
library(ggplot2)

# set working directory
setwd("~/vw7.6ncnovo/cormas2020/Models/WitUses/analyses")

#load functions to interact with cormas
source("cormas-func.R")

#Open model
r <- openModel("WitUses", parcelFile="WitUses.pcl")

# Set the basic init and step method
r <- setInit("init") # Initialization choice
r <- setStep("step:") # Scenario choice

#choose the probe to activate during the simulation
r<- activateProbe("sumCapitalOfUsers", "WitUses")

## Set the value of attribute

r <- setNumericAttributeValue("ressCoef","Calibration class", 0.5)
####### Initialize the Cormas model #######
r <- initSimu()

####### Run Simulation #######
runSimu(100)

### Get results ####
res <- getNumericProbe("sumCapitalOfUsers", "WitUses")

