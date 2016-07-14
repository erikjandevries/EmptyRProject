loadSampleOfDataFile <- function(fileName, nlines=NULL, rdsFileName
                                , fraction=0.01, nmin=1000, nmax=NULL
                                , n=min(c(max(c(nlines * fraction, nmin)), nmax))
                                , printTimer=FALSE
                                , sep=NULL, quote=NULL, dec=NULL) {
  if (printTimer) ptm <- proc.time();
  if (file.exists(rdsFileName)) {
    logwarn(paste("Loading previously cached RDS:", rdsFileName));
    obj <- readRDS(rdsFileName);
  } else {
    loginfo(paste("Loading sample from CSV:", fileName));
    # Detect data model
    model <- detect_dm_csv(fileName, header=TRUE);

    # Create LaF-object
    laf <- laf_open_csv(  fileName
                        , column_types=model$columns$type
                        , column_names=model$columns$name
                        , skip=1)

    if (n < nlines) {
      i <- sort(sample.int(nlines, size = n));
      # Read from file using indexing
      obj <- laf[i, ]
      if (rdsFileName != "") {
        loginfo(paste("Saving RDS", rdsFileName));
        saveRDS(obj, rdsFileName);
      }
    } else {
      logfatal("Not enough records to sample from...");
      stop("Not enough records to sample from...");
    }
    rm(i);
  }

  if (printTimer) {
    print(proc.time()-ptm);
    rm(ptm);
  }
  return(obj);
}
