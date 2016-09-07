######## Initialisation ########
# Close any open devices (if an error occurs while saving an image, a device may be left open)
for (d in dev.list()) { dev.off(); }; rm(d);
# Clear the Global Environment
rm(list = ls());
gc();
# Clear the console screen
cat("\014");
# Set working directory
# setwd("~/RProjects/EmptyRProject");

# Set system path to include the correct version of the Oracle Instant Client
# Sys.setenv("PATH" = paste0(Sys.getenv("PATH"), ";C:\\Program Files\\Oracle\\instantclient_12_1"));


# project functions
project_ensure_folder <- function(folderName) {
  ifelse(  !dir.exists(file.path(getwd(), folderName))
           , dir.create(file.path(getwd(), folderName), recursive = TRUE)
           , FALSE);
}


######## Parameters ########
project_parameters <- list();
# Date time stamp
project_parameters$DTS  <- as.POSIXlt(Sys.time(), "UTC");
project_parameters$DTSName = format(project_parameters$DTS, "%Y-%m-%dT%H-%M-%SZ")
# Folders
project_parameters$outputBaseFolder  <- "Output";
project_parameters$folders <- list(
  output = paste(project_parameters$outputBaseFolder, project_parameters$DTSName, sep="/")
);
project_ensure_folder(project_parameters$folders$output);
# Files
project_parameters$files <- list(
  log = "project_log.log"
);
project_parameters$logging <- list(
  level = 'INFO'
);

######## Logging ########
# install.packages("logging")
library(logging);
basicConfig(level = project_parameters$logging$level);
addHandler(  writeToFile
           , file   = paste(project_parameters$folders$output, project_parameters$files$log, sep="/")
           , level  = project_parameters$logging$level
           , logger = '');
loginfo(paste("Logging started at level:   ", project_parameters$logging$level));

loginfo(paste0("Current working directory:   \"", getwd(), "\""));


######## Process all steps ########
source("Source/_ProcessAll.R");

# Exiting
loginfo("Finished")
