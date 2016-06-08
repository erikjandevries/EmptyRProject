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
