print("Loading the data...");

# The following strings are considered NA
NAStrings <- c("NA", "", "-");

loadDataFile <- function(fileName, rdsFileName="", printTimer=FALSE
                          , sep=NULL, quote=NULL, dec=NULL) {
  if (printTimer) ptm <- proc.time();
  if (file.exists(rdsFileName)) {
    print(paste("Loading previously cached RDS:", rdsFileName));
    obj <- readRDS(rdsFileName);
  } else {
    print(paste("Loading CSV:", fileName));
    if (is.null(sep)) {
      # Amerikaanse datum/tijd notatie
      obj <- read.csv(fileName
                      , na.strings=NAStrings
                      , encoding="UTF-8"
                      , stringsAsFactors=FALSE);
    } else {
      # Specifieke datum/tijd notatie
      # Nederlands: sep=";", quote="\"", dec=","
      obj <- read.csv(fileName
                      , na.strings=NAStrings
                      , encoding="UTF-8"
                      , stringsAsFactors=FALSE
                      , sep=sep, quote=quote, dec=dec);
    }
    if (rdsFileName != "") {
      print(paste("Saving RDS", rdsFileName));
      saveRDS(obj, rdsFileName);
    }
  }
  if (printTimer) {
    print(proc.time()-ptm);
    rm(ptm);
  }
  return(obj);
}


csvTotal <- paste(project_parameters$folders$data,  project_parameters$files$total, sep="/");
rdsTotal <- paste(project_parameters$folders$rds,   project_parameters$rds$total,   sep="/");

csvTotalConfig <- paste(project_parameters$folders$data, project_parameters$files$total_config,  sep="/");

total <- loadDataFile(csvTotal, rdsFileName=rdsTotal);
total_config <- loadDataFile(csvTotalConfig);

rm(csvTotal, rdsTotal, csvTotalConfig);





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
