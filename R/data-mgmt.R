library(stringr)
library(memisc)

read.data <- function (filename) {
    data <- read.csv(filename, header = FALSE, sep = ":")
    colnames(data) <- c("year",
                        "text",
                        "clause.type",
                        "v1",
                        "verb.type",      ## 5
                        "mood",
                        "polarity",
                        "unused.8",
                        "unused.9",
                        "n.gen.order",    ## 10
                        "p.pro.order",
                        "unused.12",
                        "unused.13",
                        "unused.14",
                        "unused.15",      ## 15
                        "infl.particle",
                        "infl.stranded.p",
                        "infl.meg.obj",
                        "infl.pro.obj",
                        "ID")
    data$text <- str_split_fixed(data$ID, ",", 1)
    ## data$year <- as.integer(as.character(data$year))
    data$year <- memisc::recode(data$text,
                                c("coalex","comarvel","cochad","cochristoph",
                                  "cosolsat2","comart") -> 870,
                                ## TODO: chronicle1
                                c("coprefcura","cocura") -> 891,
                                "cobede" -> 895,
                                "coboeth" -> 897,
                                "coorosiu" -> 898,
                                c("coprefsolilo","cosolilo") -> 899,
                                ## TODO: Charters1, LeechEarly, Chronicle2
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
                                c("copreflives","coaelives") -> 997,
                                ## TODO: AelfLetters, OldTest, Chronicle3
                                "coinspolX" -> 1008,
                                ## TODO: LeechLate
                                c("cocanedgX","cowulf") -> 1010,
                                "cobryhtf" -> 1011,
                                "colaw6atr" -> 1014,
                                "colacnu" -> 1020,
                                "coapollo" -> 1025,
                                "conicodD" -> 1030,
                                c("corood","cojames","coeust","comargaT") -> 1030,
                                ## TODO: Charters3
                                c("comargaC","coleofri") -> 1060,
                                "coneot" -> 1065,
                                "coalcuin" -> 1070
                                ## TODO: Chronicle4
                                )

    return (data)
}
