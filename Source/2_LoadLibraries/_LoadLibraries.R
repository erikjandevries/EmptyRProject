loginfo("Loading packages")

required_packages <- c(
    "shiny"                 # R web app
  , "mice"                  # impute
  , "caTools"               # sample.split
  , "scales"                # percent formatting
  , "ggplot2"

  # , "ROracle"               # Connect to Oracle SQL databases
  # , "RODBC"                 # Connect to Microsoft SQL Server databases
  
  # , "ROCR"                # auc
  # , "rpart"               # CART
  # , "rpart.plot"          # plot CART
  # , "randomForest"        # random forest
  # , "nnet"                # neural network
  # , "caret"               # cross-validation for CART, preProcess
  # , "e1071"               # cross-validation for CART
  # , "tm"                  # text mining
  # , "SnowballC"           #
  # , "RTextTools"          # poly-grams
  # , "flexclust"           # clustering
  # , "dplyr"
  # , "reshape2"            # melt
  # , "lubridate"
);

install.packages.ifmissing(required_packages)

for (p in required_packages) {
  library(p, character.only = TRUE);
}; rm(p);
rm(required_packages);


# loginfo("Loading custom functions");
# source("Source/2_LoadLibraries/YMDtoDate.R")
