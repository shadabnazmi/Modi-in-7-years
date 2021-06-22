pacman::p_load('dplyr', 'tidyr', 'gapminder',
               'ggplot2',  'ggalt',
               'forcats', 'R.utils', 'png',
               'grid', 'ggpubr', 'scales',
               'bbplot2')

area <- read.csv("health_exp.csv")

plot_area <- ggplot(area, aes(x = Year, y = GDP))+
  geom_bar(stat = "identity", position = "identity", fill = "#D1700E")+
  
  scale_y_continuous(expand= c(0,0), labels = function(x) paste0(x, "%"), ylim(c(0,4)))+
  

  labs(title = "India has always spent too little on health", subtitle = "Health spending as percentage of GDP, 2014-2021")+
  reith_style()
plot_area
  

finalise_plot(plot_name = plot_area,
              source = "Source: IMF, MOSPI",
              save_filepath = "health_gdp-nc.png",
              width_pixels = 640,
              height_pixels = 380)