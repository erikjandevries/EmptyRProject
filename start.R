# Sys.setenv(R_CONFIG_ACTIVE = "")
# Sys.setenv(R_CONFIG_ACTIVE = "acceptance")
# Sys.setenv(R_CONFIG_ACTIVE = "production")

library(dstools.ej)
project_restart()

project_section("Initialisation")
source("Source/1_Initialise/1_SetParameters.R");
source("Source/1_Initialise/2_CopySource.R");

source("Source/2_LoadLibraries/_LoadLibraries.R");

project_section("Reading data")
source("Source/3_ReadData/_ReadData.R");

project_section("Preparing data")
source("Source/4_PrepareData/Impute.R");
source("Source/4_PrepareData/SplitDatasets.R");

project_section("Analysis", folder = "Analysis")
source("Source/5_Analyse/1_Baseline.R");

project_section("Visualisation", folder = "Visualisation")
source("Source/6_Visualise/Plot.R");

project_section("Finalisation")
source("Source/7_Finalise/_Finalise.R");

# project_section("Shiny App")
# runApp('Source/8_Shiny'
#       , port=project_parameters$shiny$port
#       , launch.browser=FALSE
#       );

loginfo("Finished")
