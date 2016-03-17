print("Setting parameters...");

# Parameters
project_parameters <- list();

# Setting seed for random number generator
project_parameters$seed <- 1234;
set.seed(project_parameters$seed);

# Date time stamp
project_parameters$DTS  <- as.POSIXlt(Sys.time(), "UTC");
project_parameters$DTSName = format(project_parameters$DTS, "%Y-%m-%dT%H-%M-%SZ")

# Folders
project_parameters$outputBaseFolder  <- "Output";
project_parameters$folders <- list(
    data   = "Data"
  , output = paste(project_parameters$outputBaseFolder, project_parameters$DTSName, sep="/")
  , rds    = paste(project_parameters$outputBaseFolder, "RDS", sep="/")
  );

project_ensure_folder <- function(folderName) {
  ifelse(  !dir.exists(file.path(getwd(), folderName))
          , dir.create(file.path(getwd(), folderName), recursive = TRUE)
          , FALSE);
}
project_ensure_folder(project_parameters$folders$data);
project_ensure_folder(project_parameters$folders$output);
project_ensure_folder(project_parameters$folders$rds);

# Data files
project_parameters$files <- list(
    total        = "total.csv"
  , total_config = "total_config.csv"
  );

# RDS files
project_parameters$rds <- list(
    total   = "total.rds"
  , imputed = "imputed.rds"
  );

project_parameters$splitRatios <- list(
    train = 0.6
  , valid = 0.2
  , test  = 0.2);

# Shiny Parameters
project_parameters$shiny <- list();
project_parameters$shiny$port <- 7861;
