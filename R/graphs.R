library(dplyr)
library(ggplot2)

graph.p.pro <- function (data) {
    plot.data <- data %>%
      group_by(text, year) %>%
      summarize(p.pro = sum(p.pro.order == "p-pro"),
                pro.p = sum(p.pro.order == "pro-p")) %>%
      mutate(n = p.pro + pro.p)

    ggplot(plot.data, aes(x = year, y = p.pro / n)) +
      geom_point(aes(size = n)) +
      scale_size_area() +
      geom_smooth(aes(weight = n))
}

graph.gen.n <- function (data) {
    plot.data <- data %>%
      group_by(text, year) %>%
      summarize(gen.n = sum(n.gen.order == "gen-n"),
                n.gen = sum(n.gen.order == "n-gen")) %>%
      mutate(n = gen.n + n.gen)

    ggplot(plot.data, aes(x = year, y = gen.n / n)) +
      geom_point(aes(size = n)) +
      scale_size_area() +
      geom_smooth(aes(weight = n))
}
