print("Setting parameters...");

# Parameters
parameters <- list();

# Setting seed for random number generator
parameters$seed <- 1234;
set.seed(parameters$seed);

# Date time stamp
parameters$DTS  <- as.POSIXlt(Sys.time(), "UTC");
parameters$DTSName = format(parameters$DTS, "%Y-%m-%dT%H-%M-%SZ")
# print(paste("Current UTC time is:", parameters$DTSName));

# Folders
parameters$outputBaseFolder  <- "Output";
parameters$folders <- list(
    data   = "Data"
  , output = paste(parameters$outputBaseFolder, parameters$DTSName, sep="/")
  );
ifelse(!dir.exists(file.path(getwd(), parameters$outputBaseFolder)), dir.create(file.path(getwd(), parameters$outputBaseFolder)), FALSE);
ifelse(!dir.exists(file.path(getwd(), parameters$folders$data)),     dir.create(file.path(getwd(), parameters$folders$data)), FALSE);
ifelse(!dir.exists(file.path(getwd(), parameters$folders$output)),   dir.create(file.path(getwd(), parameters$folders$output)), FALSE);

# Data files
parameters$files <- list(
    train = "train.csv"
  , valid = "valid.csv"
  , test  = "test.csv"
  , total = "total.csv"

  , trainCleaned = "trainCleaned.csv"
  , validCleaned = "validCleaned.csv"
  , testCleaned  = "testCleaned.csv"
  , totalCleaned = "totalCleaned.csv"
  );

parameters$splitRatios <- list(
    train = 0.6
  , valid = 0.2
  , test  = 0.2);
