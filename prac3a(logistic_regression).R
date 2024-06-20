studentmarks<- read.csv("C:\\Users\\Vinish\\Downloads\\studentmarks.csv")
head(studentmarks)
nrow(studentmarks)
install.packages("caTools")
library(caTools) 
split <- sample.split(studentmarks, SplitRatio = 0.75) 
split
training_reg<- subset(studentmarks, split=="TRUE")
test_reg<- subset(studentmarks, split=="FALSE")
fit_logistic_model<- glm(admit ~., data = training_reg, family="binomial")
predict_reg<- predict(fit_logistic_model, test_reg, type="response") 
predict_reg
cdplot(as.factor(admit)~ gpa, data=studentmarks)
cdplot(as.factor(admit)~ gre, data=studentmarks)
cdplot(as.factor(admit)~ rank, data=studentmarks)
predict_reg<- ifelse(predict_reg> 0.5, 1, 0)
predict_reg
table(test_reg$admit, predict_reg)
