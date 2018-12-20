# Assignment on Predictive analytics

library(dplyr)

setwd("C:\\Maadhu\\Jigsaw\\Assignments\\JS\\Predictive")

actual_data <- read.csv("goodforu.csv")

str(actual_data)
head(actual_data)
tail(actual_data)
summary(actual_data)
length(actual_data)
class(actual_data)

glimpse(actual_data)

brand_info <- actual_data[, c('X2', 'X9', 'X16', 'X23', 'X30')]

glimpse(brand_info)

#Question 1

#Column X41 is the answer (Wrong)

#Column X23 is the answer

#Question 2

#summary(actual_data$X41)

#actual_data %>% group_by(X41) %>% summarise(n())

summary(actual_data$X23)

actual_data %>% group_by(X23 <= 4) %>% summarise(n())

nrow(actual_data)/2

#12160 > 12057 - So, True.

# Answer is True


#Question 3

#From above, 11954


#Question 8

#X2 - Made with farm grown ingredients
#X9 - Have 0 grams trans fat
#X16 - Made with Natural Oils
#X30 - 1 - Minimally processed to 10 Heavily processed

#From X23 variable, assuming that values <= 5 are bad, and values > 5 are good

#brand_info$goodorbad <- ifelse(brand_info$X23 <= 5, 0, 1)

#Changed to 4

brand_info$goodorbad <- ifelse(brand_info$X23 <= 4, 0, 1)

sum(brand_info$goodorbad == 1) #Good count is 6123
sum(brand_info$goodorbad == 0) #Bad count is 17991

perception <- glm(goodorbad ~ X9+X2+X16+X30, family = binomial, data = brand_info)

summary(perception)

#Question 9

sum(actual_data$X2 == 1)

#19126

#Question 10

sum(actual_data$X16 == 1)

#10645

#Question 11

sum(actual_data$X9 == 1)

#7625