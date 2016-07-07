library(stringr)
library(memisc)
library(dplyr)

compute.asc.date <- function (ids) {
    r <- as.integer(str_split_fixed(str_split_fixed(ids, fixed(";"), 3)[,2],
                                    fixed("."), 2)[,1])
    r <- ifelse(r < 891, 891, r)
    25 * (r %/% 25) + 12.5
}


date.text <- function (text, ID) {
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
    year <- ifelse(text %in% c("cochronA"),
                        compute.asc.date(ID),
                   year)

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

read.gen <- function (path) {
    df <- read.delim(path, sep =":", header = FALSE)
    colnames(df) <- c("gen","ID")
    df$text <- str_split_fixed(df$ID, ",", 2)[,1]
    df$text <- factor(str_split_fixed(df$text, "-", 2)[,1])
    df$year <- date.text(df$text, df$ID)

    df <- subset(df, ! (text %in% c("colawine", "coeluc1", "coeluc2")))

    return (df)
}

read.cprel <- function (path) {
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
