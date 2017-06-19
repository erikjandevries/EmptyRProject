loginfo("Imputing missing values");

rdsImputed <- paste(project_config$folders$rds,   project_config$rds$imputed,   sep="/");

# x <- do.call.cached(rdsImputed, mice, list(total[,modelfeatures()]))
# imputed <- complete(x)


imputed <- complete(do.call.cached(rdsImputed, mice, list(total[,modelfeatures()])))

for (col in names(imputed)) {
  total[,col] <- imputed[,col];
}; rm(col);

rm(imputed, rdsImputed);
