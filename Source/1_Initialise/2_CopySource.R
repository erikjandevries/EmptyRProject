loginfo("Copying source code to output folder");

file.copy(  from="Source"
          , to=project_config$folders$output
          , recursive = TRUE
          , copy.mode = TRUE);

flist <- c(  list.files(  getwd(), "^start.*[.]R$"
                          , full.names = TRUE
                          , ignore.case = TRUE)
           , list.files(  getwd(), "^.+[.]yml$"
                        , full.names = TRUE
                        , ignore.case = TRUE));
file.copy(  from=flist
          , to=project_config$folders$output
          , recursive = TRUE
          , copy.mode = TRUE);
rm(flist);
