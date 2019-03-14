
#title: Make-Shot-charts-Script.R
#description: This script is  create a pdf and png file of players shot charts. 
#inputs: andre-iguodala.csv, draymond-green.csv, kevin-durant.csv, klay-thompson.csv, stephen-curry.csv, nba-court.jpg
#outputs: klay-thompson-shot-chart.pdf, kevin-durant-shot-chart.pdf, stephen-curry-shot-chart.pdf, draymond-green-shot-chart.pdf, andre-iguodala-shot-chart.pdf, gsw-shot-charts.pdf, gsw-shot-charts.png 





library(ggplot2)
library(dplyr)
library(jpeg)
library(grid)


#klay shot charts

klay_scatterplot <- ggplot(data = thompson)+
  geom_point(aes(x = x, y = y, color = shot_made_flag))

court_file <- "../images/nba-court.jpg"

court_image <- rasterGrob(
  readJPEG(court_file),
  width = unit(1, "npc"),
  height = unit(1, "npc"))

klay_shot_chart <- ggplot(data = thompson)+
  annotation_custom(court_image, -250, 250, -50, 420)+
  geom_point(aes(x = x, y = y, color = shot_made_flag))+
  ylim(-50, 420)+
  ggtitle('shot chart: Klay Thompson (2016 season)')+
  theme_minimal()

pdf(file = '../images/klay-thompson-shot-chart.pdf', width = 6.5, height = 5)
klay_shot_chart
dev.off




#durant shot charts
durant_shot_chart <- ggplot(data = durant)+
  annotation_custom(court_image, -250, 250, -50, 420)+
  geom_point(aes(x = x, y = y, color = shot_made_flag))+
  ylim(-50, 420)+
  ggtitle('shot chart: Kevin Durant (2016 season)')+
  theme_minimal()

pdf(file = '../images/kevin-durant-shot-chart.pdf ', width = 6.5, height = 5)
durant_shot_chart
dev.off


# curry shot charts
curry_shot_chart <- ggplot(data = curry)+
  annotation_custom(court_image, -250, 250, -50, 420)+
  geom_point(aes(x = x, y = y, color = shot_made_flag))+
  ylim(-50, 420)+
  ggtitle('shot chart: Stephen Curry (2016 season)')+
  theme_minimal()

pdf(file = '../images/stephen-curry-shot-chart.pdf', width = 6.5, height = 5)
curry_shot_chart
dev.off

# iguodala shot charts
iguodala_shot_chart <- ggplot(data = iguodala)+
  annotation_custom(court_image, -250, 250, -50, 420)+
  geom_point(aes(x = x, y = y, color = shot_made_flag))+
  ylim(-50, 420)+
  ggtitle('shot chart: Andre Iguodala (2016 season)')+
  theme_minimal()

pdf(file = '../images/andre-iguodala-shot-chart.pdf ', width = 6.5, height = 5)
iguodala_shot_chart
dev.off

# green shot charts
green_shot_chart <- ggplot(data = green)+
  annotation_custom(court_image, -250, 250, -50, 420)+
  geom_point(aes(x = x, y = y, color = shot_made_flag))+
  ylim(-50, 420)+
  ggtitle('shot chart: Draymond Green (2016 season)')+
  theme_minimal()

pdf(file = '../images/draymond-green-shot-chart.pdf', width = 6.5, height = 5)
green_shot_chart
dev.off

# team shot charts

team_shot <- ggplot(data = shots_data)+
  annotation_custom(court_image, -250, 250, -50, 420)+
  geom_point(aes(x = x, y = y, color = shot_made_flag))+
  ylim(-50, 420)+
  ggtitle('shot chart: GSW (2016 season)')+
  theme_minimal() + facet_wrap(~name)



pdf(file = '../images/gsw-shot-charts.pdf', width = 8, height = 7)

team_shot

dev.off()



team_shot <- ggplot(data = shots_data)+
  annotation_custom(court_image, -250, 250, -50, 420)+
  geom_point(aes(x = x, y = y, color = shot_made_flag))+
  ylim(-50, 420)+
  ggtitle('shot chart: GSW (2016 season)')+
  theme_minimal() + facet_wrap(~name)



ggsave(file = '../images/gsw-shot-charts.png', width = 8, height = 7)

team_shot

dev.off()