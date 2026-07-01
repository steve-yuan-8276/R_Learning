# Mini Project - Descriptive Statistics with R

# Load Package
library('fBasics')

# Exercise 1–2: Data Import & Vector Basics
# 1. Import `budget_data.csv` using `read.csv()`. Use `str()` and `head()` to inspect the structure. 
# What data types are the `Date` column and the `Profit/Losses` column?
budget_data <- read.csv('budget_data.csv', header = TRUE, sep = ',')

head(budget_data)

typeof(budget_data$Profit.Losses)  #type: integer
# 2. Extract the `Profit.Losses` column as a standalone vector named `profit`. Find its length, 
# maximum, and minimum values. Which month corresponds to the maximum value? (Hint: use `which.max()`)
profit <- budget_data$Profit.Losses

head(profit)

# Find the length
length(profit)   #length = 86

# Find the max value and min value
max(profit)
min(profit)

# Which month corresponds to the maximum value
print(budget_data$Date[which.max(budget_data$Profit.Losses)])

# Exercise 3: Data Frame Operations
  
# 3. Create a new column called `Profit_Positive` that logically indicates whether each month was 
# profitable (`TRUE`) or a loss (`FALSE`). Count how many months were profitable vs. how many were losses.
budget_data['profit_positive'] <- ifelse(budget_data$Profit.Losses > 0, TRUE, FALSE)

head(budget_data)
# Exercise 4: Descriptive Statistics (fBasics)
  
# 4.** Load the `fBasics` package and run `basicStats()` on the `profit` vector. Explain what each 
# of the following means, and interpret the results:
# - Mean, Median, Stdev
# - Skewness — is the distribution left-skewed or right-skewed?
# - Kurtosis — is it more peaked or flatter than a normal distribution?

basicStats(profit)
# Mean         2.623744e+05
# Median       4.528330e+05
# Stdev        6.244057e+05
# Skewness    -6.856180e-01     right-skewed
# Kurtosis    -6.304340e-01     more flater than a normal distribution


## Exercise 5: Visualization
  
# 5.Plot a histogram (`hist()`) and a boxplot (`boxplot()`) of `profit`.
# Does the histogram look roughly normal?
hist(budget_data$Profit.Losses,
     breaks = 12,
     col = 'gray',
     freq = FALSE,
     xlab = 'Profit/Loss',
     main = 'Histogram of Profit')
rug(jitter(budget_data$Profit.Losses))
lines(density(budget_data$Profit.Losses), col = 'red', lwd = 2)

dev.off() 
# No, the histogram does not look roughly normal. it's left-skewed.

# Does the boxplot reveal any outliers?
boxplot(budget_data$Profit.Losses,
        col = 'gray',
        main = 'Boxplot of Profits',
        ylab = 'Profit')

# No, the boxplot does not reveal any outliers. There are no points plotted beyond 
# the wiskers.

# Exercise 6: Normality Check (t-test Assumption)
  
# 6.Create a QQ plot using `qqnorm()` + `qqline()`, and run a `shapiro.test()`.
# Based on the QQ plot and the Shapiro-Wilk p-value, does this data satisfy the normality 
# assumption? What does this imply for running a t-test later?
qqnorm(budget_data$Profit.Losses,
       main = 'The QQ plot of profits')
qqline(budget_data$Profit.Losses, 
       col = 'red', lwd = 2)
sha_result <- shapiro.test(budget_data$Profit.Losses)  
mtext(paste('p-value = ', sha_result$p.value),
      side = 3, line = 0.3, cex = 0.9)
      
# No, the data doesn't satisfy the normality assumption. The QQ Plot shows systematic 
# deviation from the reference line, particularly the tails, indicating heavier than 
# normal tails. 
# Meanwhile, the data size is 86, but the p-value < 0.5, which leads us to the null 
# hypothesis of normality.


# Exercise 7: CLT Simulation (Central Limit Theorem)

# 7.Write a loop (or use `replicate()`) that draws samples **with replacement** from `profit`, 
# taking 15 values each time and computing the mean, repeated 1,000 times. Plot a histogram 
# of these 1,000 sample means.
# Compare the shape of this distribution to the histogram of the raw data. What changed? 

# This is the Central Limit Theorem in action.

set.seed(42)

sample_mean <- replicate(1000, {
  sample_15 <- sample(budget_data$Profit.Losses, size = 15, replace = TRUE)
  mean(sample_15)
})

length(sample_mean)
head(sample_mean)

# histogram
par(mfrow = c(1, 2))  # 2 columns, 1 row

# Histogram with original data
hist(budget_data$Profit.Losses,
     breaks = 20,
     freq = FALSE,
     col = 'gray',
     xlab = 'Profits',
     main = 'Histogram of Profits with original data')
lines(density(budget_data$Profit.Losses), col = 'green', lwd = 2)

sha_result1 <- shapiro.test(budget_data$Profit.Losses)
mtext(paste('p-value = ', format(sha_result1$p.value, digits = 4, scientific = FALSE)),
      side = 3, line = 0.3, cex = 0.9)

hist(sample_mean,
     breaks = 20,
     freq = FALSE,
     col = 'gray',
     xlab = 'Mean of profits',
     main = 'Histogram of Profits with sample mean')
lines(density(sample_mean), col = 'red', lwd = 2)

sha_result2 <- shapiro.test(sample_mean)
mtext(paste('p-value = ', format(sha_result2$p.value, digits = 4, scientific = FALSE)),
      side = 3, line = 0.3, cex = 0.9)

par(mfrow = c(1,1))

# Although the histogram of sample mean visually approximates a normal distribution,
# the Shapiro-Wilk test still yields a significant p-calue(P-value = 0.00021). Due to the
# large sample size (n = 1000), which give the test very high power to detect even minor
# deviations from normality. This illustrates that statistical significance does not always 
# align with pratictical/visual normality.

  
# Exercise 8: One-Sample t-test
  
# 8.Run a one-sample t-test to check whether the company's average monthly profit is 
# significantly different from 0 (`t.test(profit, mu = 0)`).
t.test(budget_data$Profit.Losses, mu = 0)

# H0: The true mean monthly profit is equal to 0 (mu = 0)
# H1: The true mean monthly profit is not equal to 0

# The one-sample t-test produced a p-value of 0.0001938, which is far below the significance
# level of a = 0.05. Therefore, we reject the statically significantly different from 0.

# The 95% confidence interval is [128501.5 396247.2], which lies entirely above 0. This 
# supports the conclusion that the true mean monthly profit is not only different from 0,
# but specifically positive -- the company is, on average , generating a statistically 
# significant profit each month.

# With a sample mean 262374.4, and given the sample size(n = 86), this result can be 
# considered reasonably reliable.



