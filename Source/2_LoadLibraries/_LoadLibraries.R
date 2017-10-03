loginfo("Loading packages")

pkgs <- c(
    "shiny"                 # R web app
  , "mice"                  # impute
  , "caTools"               # sample.split
  , "scales"                # percent formatting
  , "ggplot2"               # visualisations

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
)

project_packages(pkgs)
