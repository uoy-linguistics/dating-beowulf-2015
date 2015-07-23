library(memisc)
library(stringr)
library(dplyr)
library(ggplot2)

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
                      "ID")
    df$IP1.pro <- memisc::recode(df$ip1,
                             c("3f1","3f2","3f3","3f4","3f5") -> "old",
                             c("3i1","3i2","3i3","3i4","3i5") -> "new")
    df$IP1 <- memisc::recode(df$ip1,
                             c("3f1","3f2","3f3","3f4") -> "old",
                             c("3i1","3i2","3i3","3i4") -> "new")
    df$IP2 <- df$IP1
    df$IP1[df$clausetype != "m"] <- NA
    df$IP2[df$clausetype != "s"] <- NA

    df$IP3 <- memisc::recode(df$ip3, "4f" -> "old", "4i" -> "new")
    df$IP4 <- memisc::recode(df$ip4,
                             c("5f1","5f2","5f3a","5f3b","5f4") -> "old",
                             c("5i1","5i2","5i3a","5i3b","5i4") -> "new")

    df$VP1 <- memisc::recode(df$vp1,
                             c("6f1","6f2","6f3","6f4","6f5") -> "old",
                             c("6i1","6i2","6i3","6i4","6i5") -> "new")

    df$VP2 <- memisc::recode(df$pos2wd,
                             "7f" -> "old",
                             "7i" -> "new")

    df$SB1 <- memisc::recode(df$sb1,
                             c("8s1","8s2","8s3","8s4","8s5") -> "old",
                             "8n" -> "new")
    df$SB2 <- df$SB1
    df$SB1[df$clausetype != "m"] <- NA
    df$SB2[df$clausetype != "s"] <- NA

    df$SB3 <- memisc::recode(df$col9,
                             "9s" -> "old",
                             "9n" -> "new")
    df$SB4 <- df$SB3
    df$SB3[df$clausetype != "m"] <- NA
    df$SB4[df$clausetype != "s"] <- NA

    df$sub.fin <- memisc::recode(df$sbj,
                                 "10c" -> "canonical",
                                 "10n" -> "noncanonical")

    df$sub2.fin <- memisc::recode(df$col11,
                                  c("11c1","11c2","11c3","11c4") -> "canonical",
                                  "11n" -> "noncanonical")

    df$text <- str_split_fixed(df$ID, ",", 2)[,1]
    df$text <- factor(str_split_fixed(df$text, "-", 2)[,1])
    df$year <- date.text(df$text, df$ID)

    df <- subset(df, ! (text %in% c("colawine", "coeluc1", "coeluc2")))
}

compare.plot <- function(susan, zimm) {
    pm <- melt(zimm, id.vars = c("X", "Estimated_Year"))
    pm <- subset(pm, variable != "Period")
    colnames(pm)[1:2] <- c("text","year")

    summ <- susan %>%
    group_by(text, year) %>%
    summarize(IP1.new = sum(IP1 == "new", na.rm = TRUE),
              IP1.n = sum(!is.na(IP1)),

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

              SB2.new = sum(SB2 == "new", na.rm = TRUE),
              SB2.n = sum(!is.na(SB2)),

              SB3.new = sum(SB3 == "new", na.rm = TRUE),
              SB3.n = sum(!is.na(SB3)),

              SB4.new = sum(SB4 == "new", na.rm = TRUE),
              SB4.n = sum(!is.na(SB4))) %>%
    mutate(IP1 = IP1.new / IP1.n,
           IP2 = IP2.new / IP2.n,
           IP3 = IP3.new / IP3.n,
           IP4 = IP4.new / IP4.n,
           VP1 = VP1.new / VP1.n,
           VP2 = VP2.new / VP2.n,
           SB1 = SB1.new / SB1.n,
           SB2 = SB2.new / SB2.n,
           SB3 = SB3.new / SB3.n,
           SB4 = SB4.new / SB4.n)

    summ.melt <- melt(summ, id.vars = c("year","text"),
                      measure.vars = c("IP1","IP2","IP3","IP4",
                                       "VP1","VP2",
                                       "SB1","SB2","SB3","SB4"))

    pm$type <- "Zimmermann"
    summ.melt$type <- "SP&AE"

    ggplot(rbind(pm, summ.melt),
           aes(x = year, y = value, color = type)) +
    geom_point() +
    facet_wrap(~variable, ncol = 5) +
    coord_cartesian(ylim = c(-0.05,1.05)) +
    geom_smooth(se = FALSE) +
    geom_smooth(method = "lm", linetype = "dashed", se = FALSE)
}
