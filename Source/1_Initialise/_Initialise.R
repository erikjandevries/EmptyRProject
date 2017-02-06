source("Source/1_Initialise/1_SetParameters.R")

if (!is.null(project_config$copy.source.to.output)) {
  if (project_config$copy.source.to.output) {
    source("Source/1_Initialise/2_CopySource.R")
  }
}
