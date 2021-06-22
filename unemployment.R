pacman::p_load('dplyr', 'tidyr', 'gapminder',
               'ggplot2',  'ggalt',
               'forcats', 'R.utils', 'png',
               'grid', 'ggpubr', 'scales',
               'bbplot2')

grouped_bar_df<- read.csv("unemployment.csv")

grouped_bars <- ggplot(grouped_bar_df, 
                       aes(x = Year, 
                           y = count, 
                           fill = as.factor(type))) +
  geom_bar(stat="identity", position="dodge") +
  geom_hline(yintercept = 0, size = 1, colour="#333333") +
  scale_y_continuous(expand= c(0,0), labels = function(x) paste0(x, "%"))+
                       reith_style()+
  scale_fill_manual(values = c("#1380A1", "#FAAB18", "#BB1919")) +
  labs(title="Unemployment has been on the rise ",
       subtitle = "Quarterly unemployment rate, 2016-2021")

grouped_bars


finalise_plot(plot_name = grouped_bars,
              source = "Source: CMIE",
              save_filepath = "unemployment-nc.png",
              width_pixels = 640,
              height_pixels = 380)