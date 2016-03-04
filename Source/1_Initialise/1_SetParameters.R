print("Setting parameters...");

# Parameters
project_parameters <- list();

# Setting seed for random number generator
project_parameters$seed <- 1234;
set.seed(project_parameters$seed);

# Date time stamp
project_parameters$DTS  <- as.POSIXlt(Sys.time(), "UTC");
project_parameters$DTSName = format(project_parameters$DTS, "%Y-%m-%dT%H-%M-%SZ")
# print(paste("Current UTC time is:", project_parameters$DTSName));

# Folders
project_parameters$outputBaseFolder  <- "Output";
project_parameters$folders <- list(
    data   = "data"
  , output = paste(project_parameters$outputBaseFolder, project_parameters$DTSName, sep="/")
  );
ifelse(!dir.exists(file.path(getwd(), project_parameters$outputBaseFolder)), dir.create(file.path(getwd(), project_parameters$outputBaseFolder)), FALSE);
ifelse(!dir.exists(file.path(getwd(), project_parameters$folders$data)),     dir.create(file.path(getwd(), project_parameters$folders$data)), FALSE);
ifelse(!dir.exists(file.path(getwd(), project_parameters$folders$output)),   dir.create(file.path(getwd(), project_parameters$folders$output)), FALSE);

# Data files
project_parameters$files <- list(
    train = "train.csv"
  , valid = "valid.csv"
  , test  = "test.csv"
  , total = "total.csv"

  , trainCleaned = "trainCleaned.csv"
  , validCleaned = "validCleaned.csv"
  , testCleaned  = "testCleaned.csv"
  , totalCleaned = "totalCleaned.csv"
  );

project_parameters$splitRatios <- list(
    train = 0.6
  , valid = 0.2
  , test  = 0.2);
