pacman::p_load('dplyr', 'tidyr', 'gapminder',
               'ggplot2',  'ggalt',
               'forcats', 'R.utils', 'png',
               'grid', 'ggpubr', 'scales',
               'bbplot2')

bar_df<- read.csv("fiscal_deficit.csv")


bars <- ggplot(bar_df, aes(x = Year, y = count)) +
  geom_bar(stat="identity", 
           position="identity", 
           fill="#1380A1") +
  geom_hline(yintercept = 0, size = 1, colour="#333333") +
  scale_y_continuous(expand = c(0,0), labels = function(x) paste0(x, "%"))+
  labs(title="India is spending more money than it has ",subtitle = "Budget deficit as percentage of GDP, 2007-2021")+
                  reith_style()

bars


finalise_plot(plot_name = bars,
              source = "Source: RBI, Ministry of Finance",
              footnote = "Figures for 2021 is an estimate",
              save_filepath = "fiscal_deficit-nc.png",
              width_pixels = 640,
              height_pixels = 380)