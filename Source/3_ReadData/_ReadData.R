loginfo("Loading the data");

# The following strings are considered NA
NAStrings <- c("NA", "", "-", "NULL");

# source("Source/3_ReadData/loadDataFile.R")
# source("Source/3_ReadData/loadSampleOfDataFile.R")
# source("Source/3_ReadData/loadDatabaseQuery.R")
# source("Source/3_ReadData/loadOracleDatabaseQuery.R")


csvTotal <- paste(project_config$folders$data,  project_config$files$total, sep="/");
rdsTotal <- paste(project_config$folders$rds,   project_config$rds$total,   sep="/");
csvTotalConfig <- paste(project_config$folders$data, project_config$files$total_config,  sep="/");

total <- read.csv.cached(  rdsTotal
                         , csvTotal
                         , na.strings=NAStrings
                         , encoding="UTF-8"
                         , stringsAsFactors=FALSE)
total_config <- read.csv(csvTotalConfig
                         , na.strings=NAStrings
                         , encoding="UTF-8"
                         , stringsAsFactors=FALSE)

# total <- loadDataFile(csvTotal, rdsFileName=rdsTotal);
# total_config <- loadDataFile(csvTotalConfig);

rm(csvTotal, rdsTotal, csvTotalConfig);



# connect.string <- paste0(
#   "(DESCRIPTION=",
#     "(ADDRESS=(PROTOCOL=tcp) ",
#              "(HOST=", project_config$db$oracle.host, ") ",
#              "(PORT=", project_config$db$oracle.port, ")",
#     ")",
#     "(CONNECT_DATA=(SERVICE_NAME=", project_config$db$oracle.svc, "))",
#   ")"
# );
# data_all <- loadOracleDatabaseQuery(  oracle.username
#                                     , oracle.password
#                                     , connect.string
#                                     , query_data_all
#                                     , rdsFileName = rds_data_all_oracle
# );


# Apply configuration specified in total_config file
for (i in 1:nrow(total_config)) {
  if (total_config$name[i] %in% names(total)) {
    # Configure data type
    if (total_config$type[i] == "logical") {
      total[,total_config$name[i]] <- as.logical(total[,total_config$name[i]]);
    } else if (total_config$type[i] == "date") {
      total[,total_config$name[i]] <- as.Date(total[,total_config$name[i]]);
    } else if (total_config$type[i] == "factor") {
      total[,total_config$name[i]] <- as.factor(total[,total_config$name[i]]);
    } else if (total_config$type[i] == "ordered") {
      o_levels <- strsplit(total_config$levels[i], ",")[[1]];
      total[,total_config$name[i]] <- ordered(total[,total_config$name[i]], levels = o_levels);
      rm(o_levels);
    }
  }
}; rm(i);

modeltargets <- function(conf=total_config) {
  l <- c();
  for (i in 1:nrow(conf)) {
    if (conf$modeltarget[i]) {
      l <- c(l, conf$name[i]);
    }
  }
  return(l);
}
modelfeatures <- function(conf=total_config) {
  l <- c();
  for (i in 1:nrow(conf)) {
    if (conf$modelfeature[i]) {
      l <- c(l, conf$name[i]);
    }
  }
  return(l);
}
tuningfeatures <- function(conf=total_config) {
  l <- c();
  for (i in 1:nrow(conf)) {
    if (conf$tuningfeature[i]) {
      l <- c(l, conf$name[i]);
    }
  }
  return(l);
}



rm(NAStrings);
