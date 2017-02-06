loginfo("Splitting data into training, validation and test data sets");

# If we need a validation data set:
if (project_config$splitRatios$valid > 0) {
  SR = project_config$splitRatios$train / (project_config$splitRatios$train + project_config$splitRatios$valid + project_config$splitRatios$test);
  sample = sample.split(total$target, SplitRatio = SR);
  train = subset(total, sample == TRUE);
  tmp = subset(total, sample == FALSE);

  SR = project_config$splitRatios$valid / (project_config$splitRatios$valid + project_config$splitRatios$test);
  sample = sample.split(tmp$target, SplitRatio = SR);
  valid = subset(tmp, sample == TRUE);
  test = subset(tmp, sample == FALSE);

  rm(SR, sample, tmp);
} else {
  # if we don't need a validation data set:
  SR = project_config$splitRatios$train / (project_config$splitRatios$train + project_config$splitRatios$test);
  sample = sample.split(total$target, SplitRatio = SR);
  train = subset(total, sample == TRUE);
  test = subset(total, sample == FALSE);

  rm(SR, sample);
}
