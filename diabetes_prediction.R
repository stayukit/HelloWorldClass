# binary classification
# predict diabetes

diabetes <- read.csv("diabetes.csv") # import dataset and assign "<-" to diabetes
# load data set # ctrl+ent # 768 obs. of 9 variables
head(diabetes)
tail(diabetes)

# review data types in our dataframe
str(diabetes) # str:structure /check dataset type

diabetes$diabetes <- as.factor(diabetes$diabetes)
# change type from char to Factor on diabetes column
# and reassign to diabetes column
str(diabetes) # type: Factor

# table() count frequency
table(diabetes$diabetes) # neg =500, pos=268
table(diabetes$diabetes)/nrow(diabetes) # nrow=768
# neg=0.6510, pos=0.3489

# split data to train and test
set.seed(42)
n <- nrow(diabetes)
train_id <- sample(1:n, size = 0.8*n)
train_data <- diabetes[train_id, ]
test_data <- diabetes[-train_id, ]

# train model
# glm for logistic reg. Print model, show value as coefficient
logisticmodel <- glm(diabetes ~ glucose + insulin + age, data=train_data, family = "binomial")
# binomial or binary classification: end-result expresses in 2 groups
# test model. print model, show value as probability
p <- predict(logisticmodel, newdata = test_data, type = "response")

pdt <- ifelse(p > 0.5, "pos", "neg") # set threshold
pdt[1:20] # print predict

# compare prediction to actual; pdt == test_data$diabetes
mean(pdt == test_data$diabetes) # accuracy about 0.77

# after train model, could build confusion matrix
table(pdt,test_data$diabetes, dnn = c("predicted","actual"))
#            actual
# predicted  neg pos     # accuracy (87+32)/(87+23+12+32) = 0.77 
#      neg   87  23      # recall 32/(23+32)
#      pos   12  32      # precision 32/(12+32)
                         # F-1 score 2*((precision*recall)/(precision+recall))

# example of dataset
# pregnant glucose pressure triceps
# 1        6     148       72      35
# 2        1      85       66      29
# 3        8     183       64       0
# 4        1      89       66      23
# 5        0     137       40      35
# 6        5     116       74       0
# insulin mass pedigree age diabetes
# 1       0 33.6    0.627  50      pos
# 2       0 26.6    0.351  31      neg
# 3       0 23.3    0.672  32      pos
# 4      94 28.1    0.167  21      neg
# 5     168 43.1    2.288  33      pos
# 6       0 25.6    0.201  30      neg
