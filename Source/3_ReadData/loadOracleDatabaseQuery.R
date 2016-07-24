loadOracleDatabaseQuery <- function(  username
                              , password
                              , connect.string
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
    
    drv <- dbDriver("Oracle")
    con <- dbConnect(drv, username, password, dbname=connect.string)
    obj <- dbGetQuery(con, query)
    dbDisconnect(con)

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
