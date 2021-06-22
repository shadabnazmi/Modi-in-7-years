pacman::p_load('dplyr', 'tidyr', 'gapminder',
               'ggplot2',  'ggalt',
               'forcats', 'R.utils', 'png',
               'grid', 'ggpubr', 'scales',
               'bbplot2')


multiple_line_df <- read.csv("unemployment.csv")


#Make plot
multiple_line <- ggplot(multiple_line_df, aes(x = Year, y = count, colour = type)) +
  geom_line(size = 1)+
  
  
  scale_colour_manual(values = c("#588300", "#1380A1", "#FAAB18")) +
  scale_y_continuous(expand = c(0,0) 
                     limits = c(0,12), labels = function(x) paste0(x, "%"))+
  bbc_style() +
  reith_style()+
  all_reith_underneath()+
  
  labs(title="Unemployment has been on the rise ", subtitle = "Quarterly unemployment rate, 2016-2021")
multiple_line

multiple_line_annotation <- multiple_line +
  geom_label(aes(x = 2016, y = 9.5, label = "Demonetisation"), 
                                                                                              hjust = -0.4, 
                                                                                              vjust = 0.5, 
                                                                                              colour = "#555555", 
                                                                                              fill = "white", 
                                                                                              label.size = NA, 
                                                                                            
            size = 5)+geom_curve(aes(x = 2017, y = 4, xend = 2017, yend = 6.5), 
                                                                                                                   colour = "#555555", 
                                                                                                                   size=0.3, 
                                                                                                                   curvature = -0.4,
                                                                                                                   arrow = arrow(length = unit(0.02, "npc")))+geom_curve(aes(x = 2016, y = 6.70, xend = 2017, yend = 8.7), 
                                                                                                                                                                          colour = "#555555", 
                                                                                                                                                                          size=0.3, 
                                                                                                                                                                          curvature = 0.4,
                                                                                                                                                                          arrow = arrow(length = unit(0.02, "npc")))+
  geom_label(aes(x = 2017, y = 6.9, label = "GST introduced"), 
             hjust = 0.2, 
             vjust = 0.5, 
             colour = "#555555", 
             fill = "white", 
             label.size = NA, 
             
             size = 5)+
  geom_vline(xintercept = 2020, size = 0.4, colour = "#588300", linetype = "dashed")+
  geom_label(aes(x = 2020, y = 7, label = "First lockdown\nimposed"), 
             hjust = 0, 
             vjust = 0.5, 
             colour = "#555555", 
             fill = "white", 
             label.size = NA, 
             
             size = 5)
  
  
  


finalise_plot(plot_name = multiple_line_annotation,
              source = "Source: CMIE",
              save_filepath = "unemployment_latest-nc.png",
              width_pixels = 976,
              height_pixels = 400)