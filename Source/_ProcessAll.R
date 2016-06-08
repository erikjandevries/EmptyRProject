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

tl <- data.frame(stepnr=c(), step=c(), user=c(), system=c(), elapsed=c());
for (i in 1:length(project_timelog)) {
  tli <- data.frame(  stepnr=c(i)
                    , step=c(project_timelog[[i]]$name)
                    , user=c(round(project_timelog[[i]]$time[[1]],3))
                    , system=c(round(project_timelog[[i]]$time[[2]],3))
                    , elapsed=c(round(project_timelog[[i]]$time[[3]],3))
                    );
  tl <- rbind(tl, tli);
}; rm(i, tli);

print(tl);
print("");

outputFolder <- project_parameters$folders$output
project_ensure_folder(outputFolder);
fileName <- paste(outputFolder, "project_timelog.csv", sep="/");
write.csv(tl, file = fileName, row.names = FALSE);

rm(tl);
