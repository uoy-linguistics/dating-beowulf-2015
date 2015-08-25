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

read.data <- function (filename) {
    data <- read.csv(filename, header = FALSE, sep = ":")
    colnames(data) <- c("unused.1",
                        "unused.2",
                        "clause.type",
                        "v1",
                        "verb.type",      ## 5
                        "mood",
                        "polarity",
                        "conj",
                        "unused.9",
                        "n.gen.order",    ## 10
                        "p.pro.order",
                        "unused.12",
                        "unused.13",
                        "unused.14",
                        "first.elt",      ## 15
                        "infl.particle",
                        "infl.stranded.p",
                        "infl.neg.obj",
                        "infl.pro.obj",
                        "unused.20",
                        "unused.21",
                        "unused.22",
                        "unused.23",
                        "unused.24",
                        "infl.part.big",
                        "unused.26",
                        "unused.27",
                        "unused.28",
                        "unused.29",
                        "unused.30",
                        "ID")
    data <- within(data, rm(unused.1, unused.2, unused.9, unused.12, unused.13,
                            unused.14, unused.20, unused.21, unused.22,
                            unused.23, unused.24, unused.26,
                            unused.27, unused.28, unused.29, unused.30))
    data$text <- str_split_fixed(data$ID, ",", 2)[,1]
    data$text <- factor(str_split_fixed(data$text, "-", 2)[,1])

    data$year <- date.text(df$text, data$ID)

    ## ## We should exclude the Laws of Ine and Elucidarium: they are an outlier
    ## ## in terms of their date (if indeed they are dated correctly)
    data <- subset(data, ! (text %in% c("colawine", "coeluc1", "coeluc2")))

    return (data)
}
