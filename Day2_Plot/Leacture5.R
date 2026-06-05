# 1. Import the dataset returndaily.xlsx. Name the generated dataframe as returndaily
# 2. Plot the histogram and kernel density plot of variable SZ_return_daily from the 
# returndaily dataset.
# 3. Check the mean, variance, standard deviation, skewness, and kurtosis of variable 
# SZ_return_daily.
# 4. Determine whether the variable follows a normal distribution.

library(readxl)
returndaily <- read_excel("returndaily.xlsx")

sz_daily <- returndaily$SZ_return_daily

# Histogram
hist(sz_daily,
     breaks = seq(min(sz_daily), max(sz_daily), length.out = 101),
     freq = FALSE,
     main = "Histogram & Density of SZ Stock Return",
     xlab = "SZ Stock Return Daily",
     col = "green",
     border = "white"
     )
lines(density(sz_daily), col = "gray", lwd = 2)

# Calculation
# install.packages("fBasics")
library(fBasics)

describe <- function(x) {
  m1 <- mean(x)
  v1 <- var(x)
  sd1 <- sd(x)
  ske1 <- skewness(x)
  kur1 <- kurtosis(x)
  #Calculate P value
  jb_test <- jarqueberaTest(x)
  p1 <- jb_test@test$p.value
  
  return(c("Mean" = m1, 
           "Variance" = v1,
           "Standard Deviation" = sd1,
           "Skewness" = ske1,
           "kurtosis" = kur1,
           "P_Value" = p1))
}

describe(sz_daily)

# P < 0.05, thus SZ_return_daily doesn't follow normal distribution.