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

graph.ip1.particle <- function (data) {
    data %>%
      group_by(text, year) %>%
      filter(v1 != "v1", first.elt == "_", clause.type == "mat", polarity == "pos",
             mood == "indicative", verb.type == "lexical", conj == "_")  %>%
      summarize(infl.medial = sum(infl.particle == "infl-medial"),
                infl.final  = sum(infl.particle == "infl-final")) %>%
      mutate(n = infl.medial + infl.final) %>%
      ggplot(aes(x = year, y = infl.medial / n)) +
        geom_point(aes(size = n)) +
        scale_size_area() +
        geom_smooth(aes(weight = n))
}

zimm.plot <- function (data, zimm) {
    z <- zimm %>% select(text, IP1)
    d <- data %>%
      group_by(text, year) %>%
      filter(v1 == "_", first.elt == "_", clause.type == "mat", conj == "_") %>%
      summarize(infl.medial = sum(infl.part.big == "infl-medial"),
                infl.final  = sum(infl.part.big == "infl-final")) %>%
      mutate(n = infl.medial + infl.final, p = infl.medial / n)

    m <- inner_join(z, d)
    ggplot(m, aes(x = p, y = IP1)) +
      geom_point() +
      coord_cartesian(xlim = 0:1, ylim = 0:1) +
      geom_abline(slope = 1, intercept = 0)
}

graph.ip1.prep <- function (data) {
    data %>%
      group_by(text, year) %>%
      filter(v1 != "v1", first.elt == "_", clause.type == "mat")  %>%
      summarize(infl.medial = sum(infl.stranded.p == "infl-medial"),
                infl.final  = sum(infl.stranded.p == "infl-final")) %>%
      mutate(n = infl.medial + infl.final) %>%
      ggplot(aes(x = year, y = infl.medial / n)) +
        geom_point(aes(size = n)) +
        scale_size_area() +
        geom_smooth(aes(weight = n))
}
