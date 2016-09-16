predict_batched <- function (n_batches = 10, object, newdata, ...) {
  # Create a vector to contain the predictions.
  predictions <- c();

  idxs <- split_evenly(seq(1,nrow(newdata)), n_batches);
  for (i in 1:n_batches) {
    cat("\r",paste("Batch:", i, "/", n_batches))
    predictions[idxs[[i]]] <- predict(object, newdata = newdata[idxs[[i]],]);
    gc();
  }
  cat("\n");

  return(predictions);
}
