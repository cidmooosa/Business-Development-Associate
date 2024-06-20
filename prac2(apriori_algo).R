install.packages("arules")
install.packages("arulesViz")
install.packages("RColorBrewer")
library("arules")
library("arulesViz")
library("RColorBrewer")
data("Groceries")
Groceries
summary(Groceries)
class("Groceries")
rules=apriori(Groceries,parameter=list(supp=0.02,conf=0.2))
summary("rules")
inspect(rules[1:10])
itemFrequencyPlot(Groceries, 
                  topN = 20, 
                  col = brewer.pal(8, 'Pastel2'), 
                  main = 'Relative Item Frequency Plot', 
                  type = "relative", 
                  ylab = "Item Frequency (Relative)")

# Find frequent itemsets with specified parameters
itemset <- apriori(Groceries, 
                   parameter = list(minlen = 1, 
                                    maxlen = 1, 
                                    support = 0.02, 
                                    target = "frequent itemsets"))
inspect(itemset[1:10])
itemset_3 <- apriori(Groceries, 
                     parameter = list(minlen = 3, 
                                      maxlen = 3, 
                                      support = 0.02, 
                                      target = "frequent itemsets"))

summary(itemset_3)
inspect(itemset_3)