project_timelog = list();

# Set parameters
project_timelog[[1]] = list(name="Initialise");
project_timelog[[1]]$time = system.time(source("Source/1_Initialise/_Initialise.R"));

# Load the required libraries
project_timelog[[2]] = list(name="LoadLibraries");
project_timelog[[2]]$time = system.time(source("Source/2_LoadLibraries/_LoadLibraries.R"));

# Read the data source files
project_timelog[[3]] = list(name="ReadData");
project_timelog[[3]]$time = system.time(source("Source/3_ReadData/_ReadData.R"));

# Clean the data
project_timelog[[4]] = list(name="PrepareData");
project_timelog[[4]]$time = system.time(source("Source/4_PrepareData/_PrepareData.R"));

# Analyse
project_timelog[[5]] = list(name="Analyse");
project_timelog[[5]]$time = system.time(source("Source/5_Analyse/_Analyse.R"));

# Visualise
project_timelog[[6]] = list(name="Visualise");
project_timelog[[6]]$time = system.time(source("Source/6_Visualise/_Visualise.R"));

# Finalise
project_timelog[[7]] = list(name="Finalise");
project_timelog[[7]]$time = system.time(source("Source/7_Finalise/_Finalise.R"));


print("");
print("Project Timelog");

n <- list();
t <- list();
for (i in 1:length(project_timelog)) {
  n <- rbind(n, paste("Step", i, ":", project_timelog[[i]]$name))
  t <- rbind(t, project_timelog[[i]]$time);
}; rm(i);
print(cbind(n,t));
print("");
rm(n,t);
