# split-dataset refers to diabetes_prediction.R
# load 2 libraries for tree_model:
library(rpart)
library(rpart.plot)

# train model
# glm for logistic reg
tree_model <- rpart(diabetes ~ ., data=train_data, method = "class")

# test model
p <- predict(tree_model, newdata = test_data, type = "class") # change method, type to "class", result show as pos, neg
# >p # print p

# prediction == actual
mean(p == test_data$diabetes) # accuracy 0.74

# confusion matrix
table(pdt,test_data$diabetes, dnn = c("prediction","actual"))
#            actual
# predicted  neg pos     # accuracy (85+29)/(85+26+14+39) = 0.74 
#      neg   85  26      # recall 29/(26+39)
#      pos   14  29      # precision 39/(14+29)
                         # F-1 score 2*((precision*recall)/(precision+recall))

# plot tree
rpart.plot(tree_model)
