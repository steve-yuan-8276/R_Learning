# Q1:Create two 3 * 4 matrix by using 1-12, matrix m1 is filled by column, m2 is filled by rows.
m1 <- matrix(1:12, nrow = 3, ncol = 4, byrow = F)
m2 <- matrix(1:12, nrow = 3, ncol = 4, byrow = T)


# Q2: Update all elements in the first column of m2 to 100.
m2[,1] <- 100

# Q3: Create a data frame and name it wtdata. The first and third columns should be of numeric type, and the second column should be of character type.
wtdata = data.frame(ID = c(1001, 1002, 1003),
                    NAME = c('Steve', 'Grace', 'Lee'),
                    SCORE = c(100, 101, 99))
View(wtdata)

# Q4: Display the information for rows 1 and 3 of the data frame wgtdata.
wtdata[c(1, 3),]

# Q5: Create a list and name it wtlist with a length of 3:
#The 1st element of the list is Matrix m1
#The 2nd element of the list is Matrix m2
#The 3rd element of the list is wtdata
wtlist <- list(m1, m2, wtdata)

# Q6: Return the information of the 1st element of the list wtlist.
wtlist[[1]]

