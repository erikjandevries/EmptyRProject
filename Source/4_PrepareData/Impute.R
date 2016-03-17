print("Imputing missing values...");

rdsImputed <- paste(project_parameters$folders$rds,   project_parameters$rds$imputed,   sep="/");

if (file.exists(rdsImputed)) {
  print(paste("Loading previously cached RDS:", rdsImputed));
  imputed <- readRDS(rdsImputed);
} else {
  # print("Imputing total data set...");
  imputed <- complete(mice(total[,modelfeatures()]));
  if (rdsImputed != "") {
    print(paste("Saving RDS", rdsImputed));
    saveRDS(imputed, rdsImputed);
  }
}

for (col in names(imputed)) {
  total[,col] <- imputed[,col];
}; rm(col);

rm(imputed, rdsImputed);
