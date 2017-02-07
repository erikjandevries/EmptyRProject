######## Initialisation ########
# Close any open devices (if an error occurs while saving an image, a device may be left open)
for (d in dev.list()) { try(dev.off()); }; rm(d);
# Disconnect from Spark
if (exists("sc")) { spark_disconnect(sc); }
# Clear the Global Environment
rm(list = ls());
gc();
# Clear the console screen
cat("\014");


# Set system path to include the correct version of the Oracle Instant Client
# Sys.setenv("PATH" = paste0(Sys.getenv("PATH"), ";C:\\Program Files\\Oracle\\instantclient_12_1"));


# project functions
project_ensure_folder <- function(folderName) {
  ifelse(  !dir.exists(folderName)
         , dir.create(folderName, recursive = TRUE)
         , FALSE);
}


######## Parameters ########
# install.packages("config")
# Sys.setenv(R_CONFIG_ACTIVE = "")
# Sys.setenv(R_CONFIG_ACTIVE = "acceptance")
# Sys.setenv(R_CONFIG_ACTIVE = "production")
# Sys.getenv("R_CONFIG_ACTIVE")

DTS <- as.POSIXlt(Sys.time(), "UTC");
library(config);
project_config   <- config::get(file = "config.yml", use_parent = FALSE);
rm(DTS);

if (dir.exists(project_config$folders$output)) {
  unlink(project_config$folders$output, recursive = TRUE)
}
for (folder in project_config$folders) {
  project_ensure_folder(folder);
}; rm(folder);


######## Logging ########
# install.packages("logging")
library(logging);
basicConfig(level = project_config$logging$level);
addHandler(  writeToFile
           , file   = paste(project_config$folders$output, project_config$files$log, sep="/")
           , level  = project_config$logging$level
           , logger = '');
loginfo(paste0("Logging started at level:   ", project_config$logging$level));

loginfo(paste0("Current working directory:  ", getwd()));


######## Initialise Spark ########
loginfo("Initialising Spark")
library(sparklyr);
project_config_spark   <- spark_config(file = "config_spark.yml");

sqlContext <- function (spark_session) { invoke(spark_session, method = "sqlContext") }
sqlQuery   <- function (sqlContext, query) { invoke(sqlContext, method = "sql", query) }

loginfo(paste0("spark.app.name:             ", project_config_spark$spark.app.name));
loginfo(paste0("spark.master:               ", project_config_spark$spark.master));
loginfo(paste0("spark.home:                 ", project_config_spark$spark.home));
loginfo(paste0("spark.version:              ", project_config_spark$spark.version));
loginfo(paste0("spark.yarn.queue:           ", project_config_spark$spark.yarn.queue));
loginfo(paste0("spark.executor.instances:   ", project_config_spark$spark.executor.instances));
loginfo(paste0("spark.executor.cores:       ", project_config_spark$spark.executor.cores));
loginfo(paste0("spark.executor.memory:      ", project_config_spark$spark.executor.memory));

sc <- spark_connect(
    spark_home = project_config_spark$spark.home
  , version    = project_config_spark$spark.version
  , app_name   = project_config_spark$spark.app.name
  , config     = project_config_spark)

logdebug("Create Spark session object")
ss <- spark_session(sc)
logdebug("Create Spark SQL context object")
sqlc <- sqlContext(ss)


######## Process all steps ########
source("Source/_ProcessAll.R");

# Exiting
logdebug("Stopping Spark job");
spark_context(sc) %>% invoke("stop");
logdebug("Disconnecting from Spark");
spark_disconnect(sc);
rm(sc, ss, sqlc, project_config_spark);
loginfo("Finished")
