loginfo("Copying source code to output folder");

outputFolder <- paste(project_config$folders$output, "Source", sep="/");
ensure_folder(outputFolder);

file.copy(  from="Source"
          , to=outputFolder
          , recursive = TRUE
          , copy.mode = TRUE);

flist <- c(  list.files(  getwd(), "^start.*[.]R$"
                          , full.names = TRUE
                          , ignore.case = TRUE)
           , list.files(  getwd(), "^.+[.]yml$"
                        , full.names = TRUE
                        , ignore.case = TRUE));
file.copy(  from=flist
          , to=outputFolder
          , recursive = TRUE
          , copy.mode = TRUE);
rm(flist);
