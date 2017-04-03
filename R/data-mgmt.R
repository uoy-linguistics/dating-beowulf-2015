library(stringr)
library(memisc)
library(dplyr)
library(tidyr)

text.period <- function (dates) {
    return (ifelse(dates < 900, "P1",
            ifelse(dates < 990, "P2",
            ifelse(dates < 1100, "P3", NA))))
}

date.text <- function (text) {
    year <- as.numeric(as.character(
        memisc::recode(text,
                       c("coalex","comarvel","cochad","cochristoph",
                         "cosolsat2","comart") -> 870,
                       c("coprefcura","cocura") -> 891,
                       "cobede" -> 895,
                       "coboeth" -> 897,
                       "coorosiu" -> 898,
                       c("coprefsolilo","cosolilo") -> 899,
                       ## TODO: Charters1, LeechEarly
                       c("coherbar","coquadru") -> 940,
                       c("conicodA","covinsal") -> 945,
                       "coblick" -> 950,
                       "coverhom" -> 995,
                       "cobenrul" -> 965,
                       ## TODO: Charters2
                       "cochdrul" -> 985,
                       c("comary","coeuphr","cosevensl") -> 989,
                       "cowsgosp" -> 990,
                       c("coprefcath1","cocathom1","coaelhom") -> 991,
                       c("coprefcath2","cocathom2") -> 994,
                       "codicts" -> 995,
                       "cotempo" -> 996,
                       c("copreflives","coaelive") -> 997,
                       "coinspolX" -> 1008,
                       ## TODO: LeechLate
                       c("cocanedgX","cowulf") -> 1010,
                       "cobyrhtf" -> 1011,
                       "colaw6atr" -> 1014,
                       "colacnu" -> 1020,
                       "coapollo" -> 1025,
                       ## TODO "conicodD" -> 1030,
                       c("corood","cojames","coeust","comargaT") -> 1030,
                       ## TODO: Charters3
                       c("comargaC","coleofri") -> 1060,
                       "coneot" -> 1065,
                       "coalcuin" -> 1070,
                       ## Texts below this point estimated by AE, not
                       ## from RZ's data
                       "coaugust" -> 875,
                       ## TODO: RZ has 1108?
                       c("coeluc1", "coeluc2") -> 1150,
                       c("coprefgen", "coepigen") -> 995,
                       c("cogregdC","cogredH") -> 891,
                       c("colaw1cn","colaw2cn") -> 1018,
                       "colaw5atr" -> 1008,
                       c("colawaf","colawafint") -> 896,
                       "colawger" -> 1000,
                       "colawine" -> 700,
                       "colawnorthu" -> 1023,
                       "colawwllad" -> 1066,
                       c("cosolsat1") -> 870,
                       c("colsigef","colsigewB","colsigewZ","colwgeat","colwsigeT",
                         "colwsigeXa","colwstan1","colwstan2") -> 1000)))

    return (year)
}

read.clausal <- function (path) {
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
    df$IP1 <- as.character(memisc::recode(str_sub(df$ip1, 1, 2),
                                          "3f" -> "old",
                                          "3i" -> "new"))
    df$IP1.main <- ifelse(df$clausetype == "m", df$IP1, NA)
    df$IP1.conj <- ifelse(df$clausetype == "c", df$IP1, NA)
    df$IP1.sub  <- ifelse(df$clausetype == "s", df$IP1, NA)

    df$IP3 <- memisc::recode(str_sub(df$ip3, 1, 2),
                             "4f" -> "old",
                             "4i" -> "new")
    df$IP3[df$clausetype != "s"] <- NA

    df$IP4 <- memisc::recode(str_sub(df$ip4, 1, 2),
                             "5f" -> "old",
                             "5i" -> "new")
    df$IP4[df$clausetype != "s"] <- NA

    df$VP1 <- as.character(memisc::recode(str_sub(df$vp1, 1, 2),
                                          "6f" -> "old",
                                          "6i" -> "new"))
    df$VP1.main <- ifelse(df$clausetype == "m", df$VP1, NA)
    df$VP1.conj <- ifelse(df$clausetype == "c", df$VP1, NA)
    df$VP1.sub  <- ifelse(df$clausetype == "s", df$VP1, NA)


    df$VP2 <- as.character(memisc::recode(str_sub(df$pos2wd, 1, 2),
                                          "7f" -> "old",
                                          "7i" -> "new"))
    df$VP2.main <- ifelse(df$clausetype == "m", df$VP2, NA)
    df$VP2.conj <- ifelse(df$clausetype == "c", df$VP2, NA)
    df$VP2.sub  <- ifelse(df$clausetype == "s", df$VP2, NA)

    df$Scram1 <- as.character(memisc::recode(str_sub(df$sb1, 1, 2),
                                             "8s" -> "old",
                                             "8n" -> "new"))
    df$Scram1.main <- ifelse(df$clausetype == "m", df$Scram1, NA)
    df$Scram1.conj <- ifelse(df$clausetype == "c", df$Scram1, NA)
    df$Scram1.sub  <- ifelse(df$clausetype == "s", df$Scram1, NA)


    df$Scram2 <- as.character(memisc::recode(str_sub(df$col9, 1, 2),
                                             "9s" -> "old",
                                             "9n" -> "new"))
    df$Scram2.main <- ifelse(df$clausetype == "m", df$Scram2, NA)
    df$Scram2.conj <- ifelse(df$clausetype == "c", df$Scram2, NA)
    df$Scram2.sub  <- ifelse(df$clausetype == "s", df$Scram2, NA)

    df$SUB <- memisc::recode(str_sub(df$col17, 1, 3),
                             "17c" -> "new",
                             "17n" -> "old")

    df$V.C <- memisc::recode(df$vtoc,
                             "18v1" -> "old",
                             c("18vx1") -> "new")

    df$V.C2 <- memisc::recode(df$col20,
                             "20v1" -> "old",
                             c("20vx1a","20vx1b","20vx1c") -> "new")

    df$text <- str_split_fixed(df$ID, ",", 2)[,1]
    df$text <- factor(str_split_fixed(df$text, "-", 2)[,1])
    df$year <- date.text(df$text)

    df <- subset(df, ! (text %in% c("colawine", "coeluc1", "coeluc2")))

    df$period <- text.period(df$year)

    return (df)
}

read.gen <- function (path) {
    df <- read.delim(path, sep =":", header = FALSE)
    colnames(df) <- c("gen","ID")
    df$text <- str_split_fixed(df$ID, ",", 2)[,1]
    df$text <- factor(str_split_fixed(df$text, "-", 2)[,1])
    df$year <- date.text(df$text)
    df$period <- text.period(df$year)

    df <- subset(df, ! (text %in% c("colawine", "coeluc1", "coeluc2")))

    return (df)
}

read.clausal2 <- function (path) {
    df <- read.delim(path, sep = ":", header = FALSE)
    colnames(df) <- c("IP1.main",
                      "IP1.conj",
                      "IP1.sub",
                      "IP3.main",
                      "IP3.sub",
                      "VP1",
                      "VtoC",
                      "text",
                      "period")
    df$IP1.main <- memisc::recode(df$IP1.main,
                                  "final" -> "old",
                                  "initial" -> "new")
    df$IP1.conj <- memisc::recode(df$IP1.conj,
                                  "final" -> "old",
                                  "initial" -> "new")
    df$IP1.sub  <- memisc::recode(df$IP1.sub,
                                  "final" -> "old",
                                  "initial" -> "new")
    df$IP3.main <- memisc::recode(df$IP3.main,
                                  "AuxV" -> "new",
                                  "VAux" -> "old")
    df$IP3.sub  <- memisc::recode(df$IP3.sub,
                                  "AuxV" -> "new",
                                  "VAux" -> "old")
    df$VP1      <- memisc::recode(df$VP1,
                                  "final" -> "old",
                                  "initial" -> "new")
    df$VtoC     <- memisc::recode(df$VtoC,
                                  "Vspro" -> "old",
                                  "sproV" -> "new")

    ## df$period <- memisc::recode(df$period,
    ##                             "P1" -> 1,
    ##                             "P2" -> 2,
    ##                             "P3" -> 3)

    return (df)
}


read.cprel <- function (path) {
    df <- read.delim(path, sep =":", header = FALSE)
    colnames(df) <- c("cprel","ID")
    df$text <- str_split_fixed(df$ID, ",", 2)[,1]
    df$text <- factor(str_split_fixed(df$text, "-", 2)[,1])
    df$year <- date.text(df$text)
    df$period <- text.period(df$year)

    df$cprel <- memisc::recode(df$cprel,
                               c("se","se-the") -> "old",
                               "the" -> "new")

    df <- subset(df, ! (text %in% c("colawine", "coeluc1", "coeluc2")))

    return (df)
}

tabulate.clausal.raw <- function (clausal) {
    return (clausal %>%
            gather(variable, value,
                   IP1.main, IP1.conj, IP1.sub,
                   IP3, IP4,
                   VP1.main, VP1.conj, VP1.sub,
                   VP2.main, VP2.conj, VP2.sub,
                   Scram1.main, Scram1.conj, Scram1.sub,
                   Scram2.main, Scram2.conj, Scram2.sub,
                   SUB, V.C) %>%
            filter(!is.na(value)) %>%
            group_by(text, year, period, variable) %>%
            dplyr::summarize(new = sum(value == "new", na.rm = TRUE), n = n()) %>%
            mutate(p = new / n))
}

tabulate.clausal.raw2 <- function (clausal) {
    return (clausal %>%
            gather(variable, value,
                   IP1.main, IP1.conj, IP1.sub,
                   IP3.main, IP3.sub,
                   VP1, VtoC) %>%
            filter(!is.na(value)) %>%
            group_by(text, period, variable) %>%
            dplyr::summarize(new = sum(value == "new", na.rm = TRUE), n = n()) %>%
            mutate(p = new / n))
}

tabulate.clausal2 <- function (clausal) {
    return (tabulate.clausal.raw2(clausal) %>%
            select(-new, -n) %>%
            spread(variable, p))
}

tabulate.clausal <- function (clausal) {
    return (tabulate.clausal.raw(clausal) %>%
            select(-new, -n) %>%
            spread(variable, p))
}

tabulate.clausal.n <- function (clausal) {
    return (tabulate.clausal.raw(clausal) %>%
            select(-new, -p))
}

tabulate.clausal.n2 <- function (clausal) {
    return (tabulate.clausal.raw2(clausal) %>%
            select(-new, -p))
}

tabulate.clausal.n2 <- function (clausal) {
    return (tabulate.clausal.raw2(clausal) %>%
            select(-new, -p))
}

tabulate.gen.raw <- function(gen) {
    return (gen %>%
            group_by(text, year, period) %>%
            dplyr::summarize(new = sum(gen == "1b", na.rm = TRUE), n = n()) %>%
            mutate(p = new / n))
}

tabulate.gen <- function (gen) {
    return (tabulate.gen.raw(gen) %>%
            select(-new, -n) %>%
            dplyr::rename(GEN = p))
}

tabulate.gen.n <- function (gen) {
    return (tabulate.gen.raw(gen) %>%
            select(-new, -p))
}

tabulate.rel.raw <- function (rel) {
    return (rel %>%
            group_by(text, year, period) %>%
            dplyr::summarize(new = sum(cprel == "new", na.rm = TRUE), n = n()) %>%
            mutate(p = new / n))
}

tabulate.rel <- function (rel) {
    return (tabulate.rel.raw(rel) %>%
            select(-new, -n) %>%
            dplyr::rename(REL = p))
}

tabulate.rel.n <- function (rel) {
    return (tabulate.rel.raw(rel) %>%
            select(-new, -p))
}

tabulate.all <- function (clausal, gen, rel) {
    tc <- tabulate.clausal(clausal)
    tg <- tabulate.gen(gen)
    tr <- tabulate.rel(rel)

    return(ungroup(full_join(full_join(tc, tg), tr)))
}

tabulate.all2 <- function (clausal, gen, rel) {
    tc <- tabulate.clausal2(clausal)
    tg <- tabulate.gen(gen)
    tr <- tabulate.rel(rel)

    return(inner_join(inner_join(tc, tg), tr))
}

tabulate.all.n <- function (clausal, gen, rel) {
    tc <- tabulate.clausal.n(clausal)
    tg <- tabulate.gen.n(gen)
    tr <- tabulate.rel.n(rel)

    tg$variable <- "GEN"
    tr$variable <- "REL"


    return(rbind(tc, tg, tr))
}
