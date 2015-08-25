zd <- read.csv("../data/zimmermann-dates.csv", header = TRUE)

zimm <- read.csv("../data/zimmermann.csv", header = TRUE)
zimm <- subset(zimm, Estimated_Year < 1100)
