pacman::p_load('dplyr', 'tidyr', 'gapminder',
               'ggplot2',  'ggalt',
               'forcats', 'R.utils', 'png',
               'grid', 'ggpubr', 'scales',
               'bbplot2')


multiple_line_df <- read.csv("GDP_retail_inflation.csv")
multiple_line_df$Date <- as.Date(multiple_line_df$Date, format = "%d/%m/%y")

#Make plot
multiple_line <- ggplot(multiple_line_df, aes(x = Date, y = count, colour = type)) +
  geom_line(size = 1)+
  geom_hline(yintercept = 0, size = 1, colour="#333333")+
   scale_colour_manual(values = c("#1380A1", "#BB1919")) +
  scale_y_continuous(labels = function(x) paste0(x, "%"))+
  
  
  bbc_style() +
  reith_style()+
  all_reith_underneath()+
  labs(title="India’s GDP is too low and its inflation\ntoo high", subtitle = "GDP growth and retail inflation, 2011-2020")
multiple_line



finalise_plot(plot_name = multiple_line,
              source = "Source: IMF, MOSPI",
              save_filepath = "GDP_retail_inflation_gdp-nc.png",
              width_pixels = 640,
              height_pixels = 400)