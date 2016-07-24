loadDatabaseQuery <- function(  odbcConnectionString
                              , query
                              , rdsFileName=""
                              , printTimer=FALSE
                             ) {
  if (printTimer) ptm <- proc.time();
  if (file.exists(rdsFileName)) {
    logwarn(paste("Loading previously cached RDS:", rdsFileName));
    obj <- readRDS(rdsFileName);
  } else {
    loginfo(paste("Loading data from query...", ""));
    dbhandle = odbcDriverConnect(odbcConnectionString);
    obj <- sqlQuery(dbhandle, query = query);
    odbcClose(dbhandle);
    if (rdsFileName != "") {
      loginfo(paste("Saving RDS", rdsFileName));
      saveRDS(obj, rdsFileName);
    }
  }
  if (printTimer) {
    print(proc.time()-ptm);
    rm(ptm);
  }
  return(obj);
}
