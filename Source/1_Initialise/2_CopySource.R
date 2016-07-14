loginfo("Copying source code to output folder");

file.copy(from="Source"
        , to=project_parameters$folders$output
        , recursive = TRUE
        , copy.mode = TRUE);
