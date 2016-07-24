# Colours
project_parameters$colours <- list(
  # Default colours
    dark1   = "#000000"   # black
  , light1  = "#ffffff"   # white
  , dark2   = "#000040"   # dark blue
  , light2  = "#f6f6f6"   # light gray
  , accent1 = "#006ec3"   #
  , accent2 = "#d24625"   #
  , accent3 = "#1f6e43"   #
  , accent4 = "#7d3778"   #
  , accent5 = "#295598"   #
  # , accent6 = "#"   #
  # , accent7 = "#"   #

  # Alert
  , alert_red = "#ff0000"
  , alert_orange = "#ff8000"
  , alert_yellow = "#ffff00"
  , alert_green = "#00ff00"
  , alert_neutral = "#0000ff"
  , alert_none = "#808080"
);

# Colour palettes
project_parameters$palettes <- list(
    chart = c(  project_parameters$colours$accent1
              , project_parameters$colours$accent2
              , project_parameters$colours$accent3
              , project_parameters$colours$accent4
              , project_parameters$colours$accent5
              , project_parameters$colours$accent6
              , project_parameters$colours$accent7
              )
  , twotone1 = colorRampPalette(c(
                project_parameters$colours$accent1
              , project_parameters$colours$accent2
              ))
  , twotone2 = colorRampPalette(c(
                project_parameters$colours$accent3
              , project_parameters$colours$accent4
              ))
);
