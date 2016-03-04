print("Loading the data...");

# Empty strings are considered NA
# train <- read.csv(paste(parameters$folders$data, parameters$files$train, sep="/"), na.strings=c("NA",""));
# valid <- read.csv(paste(parameters$folders$data, parameters$files$valid, sep="/"), na.strings=c("NA",""));
# test  <- read.csv(paste(parameters$folders$data, parameters$files$test,  sep="/"), na.strings=c("NA",""));

# train$OriginalDataSet <- factor("train");
# valid$OriginalDataSet <- factor("valid");
# test$OriginalDataSet  <- factor("test");


# Combine train, validation and test data into a total set
# total <- rbind(train, valid, test);

# Write the data sets to disk
# write.csv(total, paste(parameters$folders$output, parameters$files$total, sep="/"), row.names=FALSE);
