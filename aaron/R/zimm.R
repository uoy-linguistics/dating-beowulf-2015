library(reshape2)
library(ggplot2)

zd <- read.csv("../data/zimmermann-dates.csv", header = TRUE)

zimm <- read.csv("../data/zimmermann.csv", header = TRUE)
zimm <- subset(zimm, Estimated_Year < 1100)

pm <- melt(zimm, id.vars = c("X", "Estimated_Year"))

ggplot(aes(x = Estimated_Year, y = value),
       data = subset(pm, !is.na(value) & variable != "Period")) +
    geom_point() +
    facet_wrap(~variable, ncol = 5) +
    coord_cartesian(ylim = c(-0.05,1.05)) +
    geom_smooth(se = FALSE) +
    geom_smooth(method = "lm", color = "red", se = FALSE)
