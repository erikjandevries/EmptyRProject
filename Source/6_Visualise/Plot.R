n_colours <- length(unique(total$target))
the_plot <- ggplot(total, aes(x=feature, y=feature2)) +
            geom_point(aes(col=target)) +
            scale_color_manual(values=project_config$palettes$twotone1(n_colours))

fileName <- paste(project_output_folder_path(), paste0("total", ".png"), sep="/")
png(filename = fileName
    , width =  6 * project_config$dpi
    , height = 6 * project_config$dpi
    , units = "px"
    , res = project_config$dpi
)
print(the_plot)
dev.off()

rm(n_colours, the_plot)
