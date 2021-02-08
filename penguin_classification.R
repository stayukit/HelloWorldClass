# load penguin dataset
penguins <- read.csv("penguins.csv", stringsAsFactors = TRUE)
head(penguins)

# delete NA rows
penguins <- na.omit(penguins)

# review structure

str(penguins)

# subset data (select column)
# penguins[1:10, 1:3] # row, column
# penguins[1:10, -c(2,8)]

penguins <- penguins[ , -c(2,8)]

# split data
set.seed(42)
n <- nrow(penguins)
train_id <- sample(1:n, size = 0.8*n)
train_data <- penguins[train_id, ]
test_data <- penguins[-train_id, ]

## train model decision tree
tree_model_penguins <- rpart(species ~ ., data=train_data, method = "class")

rpart.plot(tree_model_penguins)

## test model decision tree

p <- predict(tree_model_penguins, newdata=test_data, type="class")

## accuracy

mean(p == test_data$species)
