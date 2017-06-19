######## Initialisation ########
# Close any open devices (if an error occurs while saving an image, a device may be left open)
for (d in dev.list()) { try(dev.off()); }; rm(d);
# Clear the Global Environment
rm(list = ls());
gc();
# Clear the console screen
cat("\014");


# Set system path to include the correct version of the Oracle Instant Client
# Sys.setenv("PATH" = paste0(Sys.getenv("PATH"), ";C:\\Program Files\\Oracle\\instantclient_12_1"));

# Add the appropriate library location to the .libPaths()
# .libPaths(c("/my/libPath", .libPaths()))


# install.packages("config")
# install.packages("dstools.ej")
# install.packages("logging")

library(config);
library(dstools.ej)
library(logging);
logReset();


######## Parameters ########
# Sys.setenv(R_CONFIG_ACTIVE = "")
# Sys.setenv(R_CONFIG_ACTIVE = "acceptance")
# Sys.setenv(R_CONFIG_ACTIVE = "production")

DTS <- as.POSIXlt(Sys.time(), "UTC");
project_config   <- config::get(file = "config.yml", use_parent = FALSE);
rm(DTS);

if (dir.exists(project_config$folders$output)) {
  unlink(project_config$folders$output, recursive = TRUE)
}
for (folder in project_config$folders) {
  ensure_folder(folder);
}; rm(folder);


######## Logging ########
basicConfig(level = project_config$logging$level);
addHandler(  writeToFile
           , file   = paste(project_config$folders$output, project_config$files$log, sep="/")
           , level  = project_config$logging$level
           , logger = '');
loginfo(paste0("Logging started at level:   ", project_config$logging$level));
loginfo(paste0("Working directory:          ", getwd()));
if (Sys.getenv("R_CONFIG_ACTIVE") == "") {
  loginfo(paste0("Configuration:              ", "default"));
} else {
  loginfo(paste0("Configuration:              ", Sys.getenv("R_CONFIG_ACTIVE")));
}

######## Process all steps ########
source("Source/_ProcessAll.R");

# Exiting
loginfo("Finished")
