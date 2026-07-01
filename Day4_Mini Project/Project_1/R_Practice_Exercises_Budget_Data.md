# R Practice Exercises — Chapters 1–7 Review



## Exercise 1–2: Data Import & Vector Basics

**1.** Import `budget_data.csv` using `read.csv()`. Use `str()` and `head()` to inspect the structure. What data types are the `Date` column and the `Profit/Losses` column?

**2.** Extract the `Profit.Losses` column as a standalone vector named `profit`. Find its length, maximum, and minimum values. Which month corresponds to the maximum value? (Hint: use `which.max()`)

---

## Exercise 3: Data Frame Operations

**3.** Create a new column called `Profit_Positive` that logically indicates whether each month was profitable (`TRUE`) or a loss (`FALSE`). Count how many months were profitable vs. how many were losses.

---

## Exercise 4: Descriptive Statistics (fBasics)

**4.** Load the `fBasics` package and run `basicStats()` on the `profit` vector. Explain what each of the following means, and interpret the results:
- Mean, Median, Stdev
- Skewness — is the distribution left-skewed or right-skewed?
- Kurtosis — is it more peaked or flatter than a normal distribution?

---

## Exercise 5: Visualization

**5.** Plot a histogram (`hist()`) and a boxplot (`boxplot()`) of `profit`.
- Does the histogram look roughly normal?
- Does the boxplot reveal any outliers?

---

## Exercise 6: Normality Check (t-test Assumption)

**6.** Create a QQ plot using `qqnorm()` + `qqline()`, and run a `shapiro.test()`.
- Based on the QQ plot and the Shapiro-Wilk p-value, does this data satisfy the normality assumption? What does this imply for running a t-test later?

---

## Exercise 7: CLT Simulation (Central Limit Theorem)

**7.** Write a loop (or use `replicate()`) that draws samples **with replacement** from `profit`, taking 15 values each time and computing the mean, repeated 1,000 times. Plot a histogram of these 1,000 sample means.
- Compare the shape of this distribution to the histogram of the raw data. What changed? This is the Central Limit Theorem in action.

---

## Exercise 8: One-Sample t-test

**8.** Run a one-sample t-test to check whether the company's average monthly profit is significantly different from 0 (`t.test(profit, mu = 0)`).
- State your H0 and H1.
- Interpret the p-value and confidence interval, and draw a conclusion.

---
