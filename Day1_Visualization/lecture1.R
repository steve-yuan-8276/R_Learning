# Q1: Create vector named a: seq 1 to 100
a <- seq(1, 100, by=1)

# Q2: change the first element in vector a into 0
a[1] <- 0

# Q3: delete the element 1-20 in vector a
a <- a[-(1:20)]

# Q4: create vector b, which is old number between 1 to 100
b <- a[a%%2 ==1]

# Q5: create vector d, which contains elements 1, "abc"
d <- c(1, "abc")

# check vector d's data type
class(d)