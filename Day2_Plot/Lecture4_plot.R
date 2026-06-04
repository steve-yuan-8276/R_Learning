# 1. Use the `mtcars` dataset to create a scatter plot.
# 2. Modify the point styles in the above plot, setting the point shapes to values from 1 to 16. Display the final result in a multi-plot layout on a single page. An example is shown below.
# 3. Import the `stock.xlsx` dataset and generate a data frame named `stock_data`.
# 4. Using the `stock` dataset, create a line chart of the investor confidence index (`investor_confidence_index`). The x-axis represents time and the y-axis represents the investor confidence index (`investor_confidence_index`). Add a title and axis labels accordingly.

# Using tccars datasetto finish following plot

# Use the `mtcars` dataset to create a scatter plot, 
# with `qsec` as the x-axis variable and `mpg` as the y-axis variable
plot(mtcars$qsec, mtcars$mpg, 
     main = "Scatter Plot - MPG per 1/4 mile time", 
     xlab = "1/4 Mile Time", ylab = "MPG")

# 2. Modify the point styles in the above plot, setting the point shapes to values 
# from 1 to 16. Display the final result in a multi-plot layout on a single page. 
par(mfrow = c(4, 4))
for (i in 1:16) {
  plot(mtcars$qsec, mtcars$mpg, 
       main = "Scatter Plot", 
       xlab = "1/4 Mile Time", ylab = "MPG",
       col = "green",
       pch = i)
}


# using stock dataset to finish the rest homework.

library(readxl)
# Import the `stock.xlsx` dataset and generate a data frame named `stock_data`.
stock_data <- read_excel("stock.xlsx")

View(stock_data)


# Using the `stock` dataset, create a line chart of the investor confidence index
# (`investor_confidence_index`). The x-axis represents time and the y-axis 
# represents the investor confidence index (`investor_confidence_index`). 
# Add a title and axis labels accordingly.
plot(
  stock_data$date, stock_data$SH_closing_price,
  ylim = c(1500, 13000),
  type = "l",
  col = "red",
  main = "Investor Confidence Index per Time",
  xlab = "Year", ylab = "Investor Confidence Index"
)
lines(stock_data$date, stock_data$SZ_closing_price, col = "blue")


# Create a new vector: SH_Closing_Class
# if SH_Closing < 2500, then marked 1
# else if SH_closing >= 2500 and SH_closing < 3500, then 2
# else marked 3
stock_data$SH_closing_class <- ifelse(stock_data$SH_closing_price < 2500, '1',
                                      ifelse(stock_data$SH_closing_price >= 3500, '2', '3'))

select_col <- c('date', 'SH_closing_price', 'SH_closing_class')
selected_data <- stock_data[, select_col]
View(selected_data)

plot(selected_data$date, selected_data$SH_closing_price,
     col = c('green', 'red', 'yellow')[as.numeric(selected_data$SH_closing_class)],
     pch = 15,
     main = "SH Stock Price Trends",
     xlab = "Data", ylab = "Closing Price")


# Dual Axis Chart
par(mar = c(5, 4, 4, 4))
plot(stock_data$date, stock_data$SH_closing_price, 
     type = "l", lty = 1,
     main = "SH Stock Price vs Investor Confidence Index over Time",
     xlab = "Year", ylab = "SH Stock Cloing Price")

# Reference Line
abline(v = as.POSIXct("2016-01-01"),
       col = "gray", lty = 2, lwd = 1.5)

par(new = T)
plot(stock_data$date, stock_data$investor_confidence_index,
     type = "l", lty = 2, col = "green",
     ann = F, xaxt = "n", yaxt = "n")

# Add right axis
axis(4)
mtext("Investor Confidence Index", side = 4, line = 2.5)
# par()$marÍ


