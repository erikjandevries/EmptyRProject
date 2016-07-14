loginfo("Setting parameters");

# Setting seed for random number generator
project_parameters$seed <- 1234;
set.seed(project_parameters$seed);

# Folders
project_parameters$folders$data   <- "Data";
project_parameters$folders$rds    <- "RDS";

project_ensure_folder(project_parameters$folders$data);
project_ensure_folder(project_parameters$folders$rds);

# Data files
project_parameters$files$total        <- "total.csv";
project_parameters$files$total_config <- "total_config.csv";

# RDS files
project_parameters$rds <- list(
    total   = "total.rds"
  , imputed = "imputed.rds"
);

project_parameters$splitRatios <- list(
    train = 0.6
  , valid = 0.2
  , test  = 0.2
);

# Visualisation settings
source("Source/1_Initialise/1_1_Colours.R");
project_parameters$DPI <- 600;

# Shiny Parameters
project_parameters$shiny <- list();
project_parameters$shiny$port <- 7861;
