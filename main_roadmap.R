# ------------------------------------------------------------------------------------------------------------------------ #
#                                          Script for creating roadmap Gantt chart                                         #
# ------------------------------------------------------------------------------------------------------------------------ #
#                                                                                                                          #
# Description:  Create Gantt chart based on roadmap (project breakdown scheme) for my work at Amsterdam UMC                #
# Authors:      Stephan van der Zwaard [s.vanderzwaard@amsterdamumc.nl]                                                    #
# Date:         23-02-2024                                                                                                 #
# Version:      1.0                                                                                                        #
# R.version:    4.2.1 (2022-06-23) 
#                                                                                                                          #
# ------------------------------------------------------------------------------------------------------------------------ #


# ------------------------------------------------------------------------------------------------------------------------ #
#                                               Settings & dependencies                                                    #
# ------------------------------------------------------------------------------------------------------------------------ #

        # ------------------------------------------------------
        # Import libraries
        # ------------------------------------------------------   
        
            #install.packages("remotes")
            remotes::install_github("giocomai/ganttrify")
            library(tidyverse)
            library(lubridate)
            library(ganttrify)
            library(readxl)
        
        # ------------------------------------------------------
        # Set options
        # ------------------------------------------------------   
        
        # set options
        options(stringsAsFactors = FALSE)


# ------------------------------------------------------------------------------------------------------------------------ #
#                                                     Create Gantt Chart                                                   #
# ------------------------------------------------------------------------------------------------------------------------ #


            # Get data from database searches
            data       <- read_excel('Gantt-chart-AMC.xlsx', sheet=1)
            milestones <- read_excel('Gantt-chart-AMC.xlsx', sheet=2)
            
        # ------------------------------------------------------
        # Visualisation
        # ------------------------------------------------------   

            png(paste0("Figure1_Roadmap_",format(Sys.Date(),"%d%m%y"),".png"),
                 bg = "white", width = 9, height = 12, unit = "in", pointsize = 12, res = 1200)
            
            print({ganttrify(
                            project = data,
                            spots = milestones %>% select(-label),
                            project_start_date = "2023-06",
                            size_wp = 4.5, 
                            size_activity = 3.25,
                            size_text_relative = 1,
                            axis_text_align = "left",
                            mark_quarters = TRUE,
                            colour_palette = MetBrewer::met.brewer("Homer2",n=5) #("Lakota")
                    )})
            
            dev.off()
        
          