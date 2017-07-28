loginfo("Computing Baseline results for the analysis");

if (project_config$splitRatios$valid > 0) {
  baselineResult <- list();
  totalTable <- table(total=total$target);
  trainTable <- table(train=train$target);
  validTable <- table(valid=valid$target);
  testTable <- table(test=test$target);

  baselineResult$table <- data.frame(rbind(Total=totalTable, Training=trainTable, Validation=validTable, Testing=testTable));
  rm(totalTable, trainTable, validTable, testTable);
  print(baselineResult$table);

  baselineResult$totalMostFrequent <- names(baselineResult$table)[which.max(baselineResult$table["Total",])];
  baselineResult$trainMostFrequent <- names(baselineResult$table)[which.max(baselineResult$table["Training",])];
  baselineResult$validMostFrequent <- names(baselineResult$table)[which.max(baselineResult$table["Validation",])];
  baselineResult$testMostFrequent <- names(baselineResult$table)[which.max(baselineResult$table["Testing",])];
  logdebug(paste("   Most frequent result in total      set:", baselineResult$totalMostFrequent));
  logdebug(paste("   Most frequent result in training   set:", baselineResult$trainMostFrequent));
  logdebug(paste("   Most frequent result in validation set:", baselineResult$validMostFrequent));
  logdebug(paste("   Most frequent result in test       set:", baselineResult$testMostFrequent));

  baselineResult$totalAccuracy <- baselineResult$table["Total",       baselineResult$totalMostFrequent] / sum(baselineResult$table["Total",]);
  baselineResult$trainAccuracy <- baselineResult$table["Training",    baselineResult$trainMostFrequent] / sum(baselineResult$table["Training",]);
  baselineResult$validAccuracy <- baselineResult$table["Validation",  baselineResult$validMostFrequent] / sum(baselineResult$table["Validation",]);
  baselineResult$testAccuracy  <- baselineResult$table["Testing",     baselineResult$testMostFrequent ] / sum(baselineResult$table["Testing",]);
  logdebug(paste("   Total      accuracy for always predicting the most frequent            result:", percent(baselineResult$totalAccuracy)));
  logdebug(paste("   Training   accuracy for always predicting the most frequent training   result:", percent(baselineResult$trainAccuracy)));
  logdebug(paste("   Validation accuracy for always predicting the most frequent validation result:", percent(baselineResult$validAccuracy)));
  logdebug(paste("   Test       accuracy for always predicting the most frequent testing    result:", percent(baselineResult$testAccuracy)));
} else {
  baselineResult <- list();
  totalTable <- table(total=total$target);
  trainTable <- table(train=train$target);
  testTable <- table(test=test$target);

  baselineResult$table <- data.frame(rbind(Total=totalTable, Training=trainTable, Testing=testTable));
  rm(totalTable, trainTable, testTable);
  print(baselineResult$table);

  baselineResult$totalMostFrequent <- names(baselineResult$table)[which.max(baselineResult$table["Total",])];
  baselineResult$trainMostFrequent <- names(baselineResult$table)[which.max(baselineResult$table["Training",])];
  baselineResult$testMostFrequent <- names(baselineResult$table)[which.max(baselineResult$table["Testing",])];
  logdebug(paste("   Most frequent result in total      set:", baselineResult$totalMostFrequent));
  logdebug(paste("   Most frequent result in training   set:", baselineResult$trainMostFrequent));
  logdebug(paste("   Most frequent result in test       set:", baselineResult$testMostFrequent));

  baselineResult$totalAccuracy <- baselineResult$table["Total",       baselineResult$totalMostFrequent] / sum(baselineResult$table["Total",]);
  baselineResult$trainAccuracy <- baselineResult$table["Training",    baselineResult$trainMostFrequent] / sum(baselineResult$table["Training",]);
  baselineResult$testAccuracy  <- baselineResult$table["Testing",     baselineResult$testMostFrequent ] / sum(baselineResult$table["Testing",]);
  logdebug(paste("   Total      accuracy for always predicting the most frequent            result:", percent(baselineResult$totalAccuracy)));
  logdebug(paste("   Training   accuracy for always predicting the most frequent training   result:", percent(baselineResult$trainAccuracy)));
  logdebug(paste("   Test       accuracy for always predicting the most frequent testing    result:", percent(baselineResult$testAccuracy)));
}
