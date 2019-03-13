# title: Shot Charts
## description: charts depicting NBA data on shots
### inputs:
### outputs:

library(grid)
library(jpeg)

download.file("https://raw.githubusercontent.com/ucb-stat133/stat133-hws/master/images/nba-court.jpg",
              destfile = "../images/nba-court.jpg")

court_file <- "../images/nba-court.jpg"

court_image <- rasterGrob(
  readJPEG(court_file),
  width = unit(1, "npc"),
  height = unit(1, "npc")
)

library(ggplot2)

iguodala_shot_chart <- ggplot(data = iguodala) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) + ggtitle("Shot Chart: Andre Iguodala (2016 season)") +
  theme_minimal()
green_shot_chart <- ggplot(data = green) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) + ggtitle("Shot Chart: Draymond Green (2016 season)") +
  theme_minimal()
durant_shot_chart <- ggplot(data = durant) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) + ggtitle("Shot Chart: Kevin Durant (2016 season)") +
  theme_minimal()
thompson_shot_chart <- ggplot(data = thompson) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) + ggtitle("Shot Chart: Klay Thompson (2016 season)") +
  theme_minimal()
curry_shot_chart <- ggplot(data = curry) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) + ggtitle("Shot Chart: Stephen Curry (2016 season)") +
  theme_minimal()

pdf(file = "../images/andre-iguodala-shot-chart.pdf", width = 6.5, height = 5)
iguodala_shot_chart
dev.off()

pdf(file = "../images/draymond-green-shot-chart.pdf", width = 6.5, height = 5)
green_shot_chart
dev.off()

pdf(file = "../images/kevin-durant-shot-chart.pdf", width = 6.5, height = 5)
durant_shot_chart
dev.off()

pdf(file = "../images/klay-thompson-shot-chart.pdf", width = 6.5, height = 5)
thompson_shot_chart
dev.off()

pdf(file = "../images/stephen-curry-shot-chart.pdf", width = 6.5, height = 5)
curry_shot_chart
dev.off()

all_shot_chart <- ggplot(data = all_data) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) + ggtitle("Shot Charts: GSW (2016 season)") +
  theme_minimal() + facet_grid(.~ name)

pdf(file = "../images/gsw-shot-charts.pdf", width = 8, height = 7)
all_shot_chart
dev.off()

png(file = "../images/gsw-shot-charts.png", width = 8, height = 7, units = "in", res = 200)
all_shot_chart
dev.off()

png(file = "../images/andre-iguodala-shot-chart.png", width = 8, height = 7, units = "in", res = 200)
iguodala_shot_chart
dev.off()

png(file = "../images/draymond-green-shot-chart.png", width = 8, height = 7, units = "in", res = 200)
green_shot_chart
dev.off()

png(file = "../images/kevin-durant-shot-chart.png", width = 8, height = 7, units = "in", res = 200)
durant_shot_chart
dev.off()

png(file = "../images/klay-thompson-shot-chart.png", width = 8, height = 7, units = "in", res = 200)
thompson_shot_chart
dev.off()

png(file = "../images/stephen-curry-shot-chart.png", width = 8, height = 7, units = "in", res = 200)
curry_shot_chart
dev.off()



