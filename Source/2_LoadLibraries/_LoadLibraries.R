loginfo("Loading packages")

packages <- rownames(installed.packages());

required.packages <- c(
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

for (p in required.packages) {
  if (!(p %in% packages)) {
    install.packages(p);
  }
  library(p, character.only = TRUE);
}; rm(p);
rm(packages, required.packages);


# loginfo("Loading custom functions");
# source("Source/2_LoadLibraries/YMDtoDate.R")
