loginfo("Setting parameters");

# Setting seed for random number generator
set.seed(project_config$seed);

# Visualisation settings
# Colour palettes
project_config$palettes <- list(
  chart = c(  project_config$colours$accent1
            , project_config$colours$accent2
            , project_config$colours$accent3
            , project_config$colours$accent4
            , project_config$colours$accent5
            , project_config$colours$accent6
            , project_config$colours$accent7
  )
  , twotone1 = colorRampPalette(c(
      project_config$colours$accent1
    , project_config$colours$accent2
  ))
  , twotone2 = colorRampPalette(c(
      project_config$colours$accent3
    , project_config$colours$accent4
  ))
);
