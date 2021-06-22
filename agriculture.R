pacman::p_load('dplyr', 'tidyr', 'gapminder',
               'ggplot2',  'ggalt',
               'forcats', 'R.utils', 'png',
               'grid', 'ggpubr', 'scales',
               'bbplot2')

bar_df<- read.csv("agriculture.csv")


bars <- ggplot(bar_df, aes(x = Year, y = count)) +
  geom_bar(stat="identity", 
           position="identity", 
           fill="#983302") +
  geom_hline(yintercept = 0, size = 1, colour="#333333") +
  scale_y_continuous(expand = c(0,0), labels = function(x) paste0(x, "%"))+
  labs(title="Farming has grown little over the years",subtitle = "Agriculture growth as percentage of GDP, 2014-2021")+
  reith_style()

bars


finalise_plot(plot_name = bars,
              source = "Source: World Bank, Economic Survey of India 2020-21",
              save_filepath = "agriculture-nc.png",
              width_pixels = 640,
              height_pixels = 380)