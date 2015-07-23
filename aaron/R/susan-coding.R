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
                      "ID")
    df$IP1.pro <- memisc::recode(str_sub(df$ip1, 1, 2),
                             "3f" -> "old",
                             "3i" -> "new")
    ## TODO: not robust to changes in levels
    df$IP1 <- memisc::recode(df$ip1,
                             c("3f1","3f2","3f3","3f4") -> "old",
                             c("3i1","3i2","3i3","3i4") -> "new")
    df$IP2 <- df$IP1
    df$IP1.main <- df$IP1
    df$IP1[! df$clausetype %in% c("m", "c")] <- NA
    df$IP1.main[! df$clausetype %in% c("m")] <- NA
    df$IP2[df$clausetype != "s"] <- NA

    df$IP3 <- memisc::recode(str_sub(df$ip3, 1, 2),
                             "4f" -> "old",
                             "4i" -> "new")
    df$IP4 <- memisc::recode(str_sub(df$ip4, 1, 2),
                             "5f" -> "old",
                             "5i" -> "new")

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
                             "v1" -> "old",
                             "vx1" -> "new")


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

compare.plot <- function(susan, zimm, gen, cprel) {
    pm <- melt(zimm, id.vars = c("X", "Estimated_Year"))
    pm <- subset(pm, variable != "Period")
    colnames(pm)[1:2] <- c("text","year")

    summ <- susan %>%
    group_by(text, year) %>%
    summarize(IP1.new = sum(IP1 == "new", na.rm = TRUE),
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
    mutate(IP1 = IP1.new / IP1.n,
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
                                        # ,"IP1.main","SB1.main","SB3.main"
                                       "V.C"
                                       ))

    summ.gen <- gen %>%
    group_by(text, year) %>%
    summarize(GEN.new = sum(gen == "1b"),
              GEN.n = n()) %>%
    mutate(GEN = GEN.new / GEN.n) %>%
    melt(id.vars = c("year","text"),
         measure.vars = c("GEN"))

    summ.melt <- rbind(summ.melt, summ.gen)

    summ.cprel <- cprel %>%
    group_by(text, year) %>%
    summarize(REL.new = sum(cprel == "new"),
              REL.n = sum(!is.na(cprel))) %>%
    mutate(REL = REL.new / REL.n) %>%
    melt(id.vars = c("year","text"),
         measure.vars = c("REL"))

    summ.melt <- rbind(summ.melt, summ.cprel)

    pm$type <- "Zimmermann"
    summ.melt$type <- "SP&AE"


    ## summ.melt$type[summ.melt$variable %in% c("IP1.main","SB1.main","SB3.main")] <- "main only"
    ## summ.melt$variable[summ.melt$variable == "IP1.main"] <- "IP1"
    ## summ.melt$variable[summ.melt$variable == "SB1.main"] <- "SB1"
    ## summ.melt$variable[summ.melt$variable == "SB3.main"] <- "SB3"

    ggplot(rbind(pm, summ.melt),
           aes(x = year, y = value, color = type)) +
    geom_point() +
    facet_wrap(~variable, ncol = 5) +
    coord_cartesian(ylim = c(-0.05,1.05)) +
    geom_smooth(se = FALSE) +
    geom_smooth(method = "lm", linetype = "dashed", se = FALSE) +
    geom_hline(aes(yintercept = value), data = beo, linetype = "dashed")
}
