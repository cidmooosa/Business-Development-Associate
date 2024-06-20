studentmarks<- read.csv("C:\\Users\\Vinish\\Downloads\\studentmarks.csv")
head(studentmarks)
nrow(studentmarks)
library(caTools) 
split <- sample.split(studentmarks, SplitRatio = 0.75) 
split
training_reg<- subset(studentmarks, split=="TRUE")
test_reg<- subset(studentmarks, split=="FALSE")
fit_MRegressor_model<- lm(formula = admit ~ gre+gpa+rank, data = training_reg)
predict_reg<- predict(fit_MRegressor_model,  newdata = test_reg)
predict_reg
cdplot(as.factor(admit)~ gpa, data=studentmarks)
cdplot(as.factor(admit)~ gre, data=studentmarks)
cdplot(as.factor(admit)~ rank, data=studentmarks)
