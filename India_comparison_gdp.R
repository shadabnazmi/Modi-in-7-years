pacman::p_load('dplyr', 'tidyr', 'gapminder',
               'ggplot2',  'ggalt',
               'forcats', 'R.utils', 'png',
               'grid', 'ggpubr', 'scales',
               'bbplot2')


multiple_line_df <- read.csv("India_comparison_GDP.csv")
multiple_line_df$Date <- as.Date(multiple_line_df$Date, format = "%d/%m/%y")

#Make plot
multiple_line <- ggplot(multiple_line_df, aes(x = Year, y = count, colour = country)) +
  geom_line(size = 1)+
 
  
  scale_colour_manual(values = c("#588300", "#1380A1")) +
  scale_y_continuous(expand = c(0,0), 
                     limits = c(0,26), labels = function(x) paste0(x, "%"))+
  bbc_style() +
  reith_style()+
  all_reith_underneath()+
  labs(title="Bangladesh has become a major export rival", subtitle = "Exports as percentage of GDP, 2011-2021")
multiple_line



finalise_plot(plot_name = multiple_line,
              source = "Source: IMF, MOSPI",
              save_filepath = "gdp_india_ban-nc.png",
              width_pixels = 640,
              height_pixels = 400)