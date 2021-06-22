pacman::p_load('dplyr', 'tidyr', 'gapminder',
               'ggplot2',  'ggalt',
               'forcats', 'R.utils', 'png',
               'grid', 'ggpubr', 'scales',
               'bbplot2')


multiple_line_df <- read.csv("financial_inclusion.csv")
multiple_line_df$Date <- as.Date(multiple_line_df$Date, format = "%d/%m/%y")

#Make plot
multiple_line <- ggplot(multiple_line_df, aes(x = Year, y = count, colour = type)) +
  geom_line(size = 1)+
  facet_wrap(~ type, ncol = 2, scales = "free")+
  
  scale_colour_manual(values = c("#FAAB18", "#1380A1", "#BB1919")) +
  scale_y_continuous(labels = scales::comma)+
  bbc_style() +
  reith_style()+
  all_reith_underneath()+
  labs(title="Most Indians now have a bank account", subtitle = "Bank accounts and deposits under Jan Dhan scheme,\n2015-2021" )
multiple_line

multiple_line_without_label <- multiple_line+theme(legend.position = "none")

finalise_plot(plot_name = multiple_line_without_label,
              source = "Source: Government of India",
              save_filepath = "deposits_accounts-nc.png",
              width_pixels = 640,
              height_pixels = 400)