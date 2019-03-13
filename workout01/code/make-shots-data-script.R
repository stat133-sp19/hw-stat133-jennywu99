# title: NBA Data
## description: data of select NBA players
### inputs: csv files of player daya, dplyr functions
### outputs: data.frame, .csv, and .txt files of player data
  
iguodala <- read.csv("../data/andre-iguodala.csv", stringsAsFactors = FALSE)
green <- read.csv("../data/draymond-green.csv", stringsAsFactors = FALSE)
durant <- read.csv("../data/kevin-durant.csv", stringsAsFactors = FALSE)
thompson <- read.csv("../data/klay-thompson.csv", stringsAsFactors = FALSE)
curry <- read.csv("../data/stephen-curry.csv", stringsAsFactors = FALSE)

library(dplyr)

iguodala <- mutate(iguodala, name = "Andre Iguodala")
green <- mutate(green, name = "Draymond Green")
durant <- mutate(durant, name = "Kevin Durant")
thompson <- mutate(thompson, name = "Klay Thompson")
curry <- mutate(curry, name = "Stephen Curry")

iguodala$shot_made_flag <- replace(iguodala$shot_made_flag, iguodala$shot_made_flag == "n", "shot_no")
green$shot_made_flag <- replace(green$shot_made_flag, green$shot_made_flag == "n", "shot_no")
durant$shot_made_flag <- replace(durant$shot_made_flag, durant$shot_made_flag == "n", "shot_no")
thompson$shot_made_flag <- replace(thompson$shot_made_flag, thompson$shot_made_flag == "n", "shot_no")
curry$shot_made_flag <- replace(curry$shot_made_flag, curry$shot_made_flag == "n", "shot_no")

iguodala$shot_made_flag <- replace(iguodala$shot_made_flag, iguodala$shot_made_flag == "y", "shot_yes")
green$shot_made_flag <- replace(green$shot_made_flag, green$shot_made_flag == "y", "shot_yes")
durant$shot_made_flag <- replace(durant$shot_made_flag, durant$shot_made_flag == "y", "shot_yes")
thompson$shot_made_flag <- replace(thompson$shot_made_flag, thompson$shot_made_flag == "y", "shot_yes")
curry$shot_made_flag <- replace(curry$shot_made_flag, curry$shot_made_flag == "y", "shot_yes")

iguodala <- mutate(iguodala, minute = period*12 - minutes_remaining)
green <- mutate(green, minute = period*12 - minutes_remaining)
durant <- mutate(durant, minute = period*12 - minutes_remaining)
thompson <- mutate(thompson, minute = period*12 - minutes_remaining)
curry <- mutate(curry, minute = period*12 - minutes_remaining)

sink(file = "../output/andre-iguodala-summary.txt")
summary(iguodala)
sink()

sink(file = "../output/draymond-green-summary.txt")
summary(green)
sink()

sink(file = "../output/kevin-durant-summary.txt")
summary(durant)
sink()

sink(file = "../output/klay-thompson-summary.txt")
summary(thompson)
sink()

sink(file = "../output/stephen-curry-summary.txt")
summary(curry)
sink()

all_data <- rbind(iguodala, green, durant, thompson, curry)

write.csv(x = all_data, file = "../data/shots-data.csv")

sink(file = "../output/shots-data-summary.txt")
summary(all_data)
sink()
