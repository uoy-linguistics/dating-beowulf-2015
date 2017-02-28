library(ggplot2)
library(caret)
library(dplyr)
library(tidyr)

source("data-mgmt.R")

clausal <- read.clausal("../data/final.cod.ooo")

clausal.texts <- tabulate.text(clausal) %>% filter(!is.na(year))

ip <- clausal.texts %>%
    select(text, year, IP2, IP3, IP4)

ipTrainingIndices <- createDataPartition(ip$year, p = 0.8, list = FALSE)[,1]

ipTrain <- ip[ipTrainingIndices,]
ipTrainOutcome <- ipTrain$year
ipTrain$year <- NULL

ipTest <- ip[-ipTrainingIndices,]
ipTestOutcome <- ipTest$year
ipTest$year <- NULL

## ipTrain <- preProcess(method = c("center", "scale", "knnImpute"))

m <- train(ipTrain[,-1], ipTrainOutcome,
           method = "glmnet",
           preProcess = c("center", "scale", "knnImpute"),
           trControl = trainControl(method = "repeatedcv"),
           tuneGrid = expand.grid(alpha = seq(0, 1, 0.1),
                                  lambda = seq(1, 20, 0.2)))

pred <- predict(m, ipTest[,-1])

train.supermeasure <- function (df) {

    trainingIndices <- createDataPartition(df$year,
                                           p = 0.8,
                                           list = FALSE)[,1]

    train <- df[trainingIndices,]
    trainOutcome <- train$year
    train$year <- NULL

    test <- df[-trainingIndices,]
    testOutcome <- test$year
    test$year <- NULL

    m <- train(train %>% select(-text), trainOutcome,
               method = "glmnet",
               preProcess = c("center", "scale", "knnImpute"),
               trControl = trainControl(method = "repeatedcv"),
               tuneGrid = expand.grid(alpha = seq(0, 1, 0.1),
                                      lambda = seq(1, 20, 0.2)))

    pred <- predict(m, test %>% select(-text))

    return (list(model = m,
                 predictions = pred,
                 train = train,
                 trainOut = trainOutcome,
                 test = test,
                 testOut = testOutcome))

}
