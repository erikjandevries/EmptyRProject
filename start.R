# Clear the Global Environment
rm(list = ls());
# Clear the console screen
cat("\014");
# Set working directory
# setwd("~/RProjects/_EmptyProject");
# Print working directory;
print(paste("Current working directory:", getwd()));

# Process all steps
source("Source/_ProcessAll.R");

# Exiting
print("Analysis finished.")
