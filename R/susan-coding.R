library(memisc)
library(stringr)
library(dplyr)
library(ggplot2)
library(reshape2)

read.susan.coding <- function (path) {
    df <- read.delim(path, sep =":", header = FALSE)
    colnames(df) <- c("clausetype",
                      "verbtype",
                      "ip1",
                      "ip3",
                      "ip4",
                      "vp1",
                      "pos2wd",
                      "sb1",
                      "col9",
                      "sbj",
                      "col11",
                      "col12",
                      "col13",
                      "col14",
                      "col15",
                      "col16",
                      "col17",
                      "vtoc",
                      "col19",
                      "col20",
                      "ID")
    df$IP1.pro <- memisc::recode(str_sub(df$ip1, 1, 2),
                             "3f" -> "old",
                             "3i" -> "new")
    ## TODO: not robust to changes in levels
    df$IP1 <- memisc::recode(df$ip1,
                             c("3f1","3f2") -> "old",
                             c("3i1","3i2") -> "new")
    df$IP2 <- df$IP1
    df$IP1.main <- df$IP1
    df$IP1[! df$clausetype %in% c("m", "c")] <- NA
    df$IP1.main[! df$clausetype %in% c("m")] <- NA
    df$IP2[df$clausetype != "s"] <- NA

    df$IP3 <- memisc::recode(str_sub(df$ip3, 1, 2),
                             "4f" -> "old",
                             "4i" -> "new")
    df$IP3[df$clausetype != "s"] <- NA

    df$IP3.old <- memisc::recode(df$ip3,
                                 "4f" -> "old",
                                 "4i" -> "new")
    df$IP3.old[df$clausetype != "s"] <- NA

    df$IP4 <- memisc::recode(str_sub(df$ip4, 1, 2),
                             "5f" -> "old",
                             "5i" -> "new")
    df$IP4[df$clausetype != "s"] <- NA

    df$VP1 <- memisc::recode(str_sub(df$vp1, 1, 2),
                             "6f" -> "old",
                             "6i" -> "new")

    df$VP2 <- memisc::recode(str_sub(df$pos2wd, 1, 2),
                             "7f" -> "old",
                             "7i" -> "new")

    df$SB1 <- memisc::recode(str_sub(df$sb1, 1, 2),
                             "8s" -> "old",
                             "8n" -> "new")
    df$SB2 <- df$SB1
    df$SB1.main <- df$SB1
    df$SB1[! df$clausetype %in% c("m", "c")] <- NA
    df$SB1.main[! df$clausetype %in% c("m")] <- NA
    df$SB2[df$clausetype != "s"] <- NA


    df$SB3 <- memisc::recode(str_sub(df$col9, 1, 2),
                             "9s" -> "old",
                             "9n" -> "new")
    df$SB4 <- df$SB3
    df$SB3.main <- df$SB3
    df$SB3[! df$clausetype %in% c("m", "c")] <- NA
    df$SB3.main[! df$clausetype %in% c("m")] <- NA
    df$SB4[df$clausetype != "s"] <- NA

    df$SUB <- memisc::recode(str_sub(df$col17, 1, 3),
                             "17c" -> "canonical",
                             "17n" -> "noncanonical")

    df$V.C <- memisc::recode(df$vtoc,
                             "18v1" -> "old",
                             c("18vx1") -> "new")

    df$V.C2 <- memisc::recode(df$col20,
                             "20v1" -> "old",
                             c("20vx1a","20vx1b","20vx1c") -> "new")

    ## df$V.C <- memisc::recode(df$col20,
    ##                          "20v1" -> "old",
    ##                          c("20vx1a","20vx1b","20vx1c") -> "new")


    df$text <- str_split_fixed(df$ID, ",", 2)[,1]
    df$text <- factor(str_split_fixed(df$text, "-", 2)[,1])
    df$year <- date.text(df$text, df$ID)

    df <- subset(df, ! (text %in% c("colawine", "coeluc1", "coeluc2")))
}

read.susan.gen <- function (path) {
    df <- read.delim(path, sep =":", header = FALSE)
    colnames(df) <- c("gen","ID")
    df$text <- str_split_fixed(df$ID, ",", 2)[,1]
    df$text <- factor(str_split_fixed(df$text, "-", 2)[,1])
    df$year <- date.text(df$text, df$ID)

    df <- subset(df, ! (text %in% c("colawine", "coeluc1", "coeluc2")))

    return (df)
}

read.susan.cprel <- function (path) {
    df <- read.delim(path, sep =":", header = FALSE)
    colnames(df) <- c("cprel","ID")
    df$text <- str_split_fixed(df$ID, ",", 2)[,1]
    df$text <- factor(str_split_fixed(df$text, "-", 2)[,1])
    df$year <- date.text(df$text, df$ID)

    df$cprel <- memisc::recode(df$cprel,
                               c("se","se-the") -> "old",
                               "the" -> "new")

    df <- subset(df, ! (text %in% c("colawine", "coeluc1", "coeluc2")))

    return (df)
}


beo <- read.csv("../data/beowulf.csv")

compare.plot <- function(susan, zimm, gen, cprel, beo) {
    pm <- melt(zimm, id.vars = c("X", "Estimated_Year"))
    pm <- subset(pm, variable != "Period")
    colnames(pm)[1:2] <- c("text","year")

    indiv.pts <- NULL

    for (i in c("IP1","IP2","IP3","IP4",
                "SB1","SB2","SB3","SB4",
                "V.C")) {
        vals <- susan[,i] == "new"
        indiv.pts <- rbind(indiv.pts,
                           data.frame(text = susan$text,
                                      year = susan$year,
                                      variable = i,
                                      value = vals))
    }

    indiv.pts <- rbind(indiv.pts,
                       data.frame(text = gen$text,
                                  year = gen$year,
                                  variable = "GEN",
                                  value = gen$gen == "1b"))

    indiv.pts <- rbind(indiv.pts,
                       data.frame(text = cprel$text,
                                  year = cprel$year,
                                  variable = "REL",
                                  value = cprel$cprel == "new"))

    indiv.pts <- subset(indiv.pts, !is.na(value))

    indiv.pts$type <- "SP&AE"

    summ <- susan %>%
    group_by(text, year) %>%
    dplyr::summarize(IP1.new = sum(IP1 == "new", na.rm = TRUE),
              IP1.n = sum(!is.na(IP1)),

              ## IP1.main.new = sum(IP1.main == "new", na.rm = TRUE),
              ## IP1.main.n = sum(!is.na(IP1.main)),

              IP2.new = sum(IP2 == "new", na.rm = TRUE),
              IP2.n = sum(!is.na(IP2)),

              IP3.new = sum(IP3 == "new", na.rm = TRUE),
              IP3.n = sum(!is.na(IP3)),

              IP4.new = sum(IP4 == "new", na.rm = TRUE),
              IP4.n = sum(!is.na(IP4)),

              VP1.new = sum(VP1 == "new", na.rm = TRUE),
              VP1.n = sum(!is.na(VP1)),

              VP2.new = sum(VP2 == "new", na.rm = TRUE),
              VP2.n = sum(!is.na(VP2)),

              SB1.new = sum(SB1 == "new", na.rm = TRUE),
              SB1.n = sum(!is.na(SB1)),

              ## SB1.main.new = sum(SB1.main == "new", na.rm = TRUE),
              ## SB1.main.n = sum(!is.na(SB1.main)),

              SB2.new = sum(SB2 == "new", na.rm = TRUE),
              SB2.n = sum(!is.na(SB2)),

              SB3.new = sum(SB3 == "new", na.rm = TRUE),
              SB3.n = sum(!is.na(SB3)),

              ## SB3.main.new = sum(SB3.main == "new", na.rm = TRUE),
              ## SB3.main.n = sum(!is.na(SB3.main)),

              SB4.new = sum(SB4 == "new", na.rm = TRUE),
              SB4.n = sum(!is.na(SB4)),

              V.C.new = sum(V.C == "new", na.rm = TRUE),
              V.C.n = sum(!is.na(V.C))) %>%
    dplyr::mutate(IP1 = IP1.new / IP1.n,
           # IP1.main = IP1.main.new / IP1.main.n,
           IP2 = IP2.new / IP2.n,
           IP3 = IP3.new / IP3.n,
           IP4 = IP4.new / IP4.n,
           VP1 = VP1.new / VP1.n,
           VP2 = VP2.new / VP2.n,
           SB1 = SB1.new / SB1.n,
           # SB1.main = SB1.main.new / SB1.main.n,
           SB2 = SB2.new / SB2.n,
           SB3 = SB3.new / SB3.n,
           # SB3.main = SB3.main.new / SB3.main.n,
           SB4 = SB4.new / SB4.n,
           V.C = V.C.new / V.C.n)

    summ.melt <- melt(summ, id.vars = c("year","text"),
                      measure.vars = c("IP1","IP2","IP3","IP4",
                                       "VP1","VP2",
                                       "SB1","SB2","SB3","SB4",
                                       "V.C"
                                       ))

    summ.n <- melt(summ, id.vars = c("year","text"),
                   measure.vars = c("IP1.n","IP2.n","IP3.n","IP4.n",
                                    "VP1.n","VP2.n",
                                    "SB1.n","SB2.n","SB3.n","SB4.n",
                                    "V.C.n"
                                    ),
                   value.name = "n")

    summ.n$variable <- str_sub(summ.n$variable, 1, -3)

    summ.melt <- inner_join(summ.melt, summ.n)

    summ.gen <- gen %>%
    group_by(text, year) %>%
    dplyr::summarize(GEN.new = sum(gen == "1b"),
              n = n()) %>%
    dplyr::mutate(GEN = GEN.new / n) %>%
    melt(id.vars = c("year","text","n"),
         measure.vars = c("GEN"))

    summ.melt <- rbind(summ.melt, summ.gen)

    summ.cprel <- cprel %>%
    group_by(text, year) %>%
    dplyr::summarize(REL.new = sum(cprel == "new", na.rm = TRUE),
              n = sum(!is.na(cprel))) %>%
    dplyr::mutate(REL = REL.new / n) %>%
    melt(id.vars = c("year","text","n"),
         measure.vars = c("REL"))

    summ.melt <- rbind(summ.melt, summ.cprel)

    pm$type <- "Zimmermann"
    pm$n <- 1
    summ.melt$type <- "SP&AE"

    summ.melt$variable <- memisc::recode(summ.melt$variable,
                                         "IP1" -> "Vfin1-main",
                                         "IP3" -> "Vfin2",
                                         "IP4" -> "Vfin3",
                                         "V.C" -> "ProInv-main",
                                         "SB1" -> "Pro1-main",
                                         "SB2" -> "Pro1-sub",
                                         "SB3" -> "Pro2-main",
                                         "SB4" -> "Pro2-sub",
                                         "GEN" -> "Gen",
                                         "REL" -> "Rel")

    pm$variable <- memisc::recode(pm$variable,
                                  "IP1" -> "Vfin1-main",
                                  "IP3" -> "Vfin2",
                                  "IP4" -> "Vfin3",
                                  "V.C" -> "ProInv-main",
                                  "SB1" -> "Pro1-main",
                                  "SB2" -> "Pro1-sub",
                                  "SB3" -> "Pro2-main",
                                  "SB4" -> "Pro2-sub",
                                  "GEN" -> "Gen",
                                  "REL" -> "Rel")


    pd <- plyr::rbind.fill(pm, summ.melt)

    pd <- subset(pd, !is.na(variable) & variable != "Vfin1-sub")

    pd <- subset(pd, is.na(n) | n > 5 | type == "Zimmermann")

    ggplot(pd,
           aes(x = year, y = value, shape = type, linetype = type)) +
    geom_point(alpha = 0.5) +
    facet_wrap(~variable, ncol = 2) +
    coord_cartesian(ylim = c(-0.05,1.05)) +
    # geom_smooth(se = FALSE, color = "black") +
    geom_smooth(method = "lm", se = FALSE, color = "black") +
    geom_hline(aes(yintercept = value), data = subset(beo, variable != "Vfin1-sub"), linetype = "dotted") +
    theme_bw() +
    theme(legend.position = "bottom") +
    ylab("Proportion innovative") + xlab("Year") +
    scale_linetype_manual("Dataset", values = c("solid","dashed")) +
    scale_shape_discrete("Dataset")
}

png("Figure1.png", width = 6, height = 9, units = "in", res = 600, family = "Times New Roman")
compare.plot(susan, zimm, gen, cprel, beo)
dev.off()
