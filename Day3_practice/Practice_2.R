library("fBasics")

myvars <- c("mpg", "hp", "wt")

mydata <- mtcars[myvars]

head(mydata)

basicStats(mydata)