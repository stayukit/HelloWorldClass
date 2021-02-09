# linear regression model, lm
 
imdb = read.csv("imdb.csv") # import dataset
head(imdb)
# score = f(length)
lmModel <- lm(SCORE ~ LENGTH, data = imdb)
# SCORE, LENGTH from imdb data
# score = 8.162965 + 0.002624*length
# length = 120, score = ?
coef(lmModel) # can use index [0], [1] like python
# (Intercept)      LENGTH 
# 8.162964914 0.002624016 
coef(lmModel)[1] # show intercept
coef(lmModel)[2] # show length

coef(lmModel)[1] + coef(lmModel)[2]*120
