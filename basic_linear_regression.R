# linear regression model, lm
# binary linear regression: 1:1 y:x variable 
imdb = read.csv("imdb.csv")
head(imdb)
# score = f(length)
lmmodel <- lm(SCORE ~ LENGTH, data = imdb)
# SCORE, LENGTH from imdb data
# score = 8.162965 + 0.002624*length
# length = 120, score = ?
coef(lmmodel)
# (Intercept)      LENGTH 
# 8.162964914 0.002624016 
coef(lmmodel)[1] # show intercept
coef(lmmodel)[2] # show length

coef(lmmodel)[1] + coef(lmmodel)[2]*120
