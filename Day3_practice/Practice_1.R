# Plot

with(mtcars, {
  plot(wt, mpg)
  abline(lm(mpg~wt))
})

x <- 1:10
y <- c(3, 7, 2, 8, 5, 9, 1, 6, 4, 10)

par(mfrow = c(3, 3))   # 一次性排成3x3的九宫格
types <- c("p", "l", "b", "c", "o", "h", "s", "S", "n")
for (t in types) {
  plot(x, y, type = t, main = paste0('type = "', t, '"'),
       col = "steelblue", pch = 19, lwd = 2)
}

library(RColorBrewer)
n <- 7
mycolors <- brewer.pal(n, "Set1")
barplot(rep(1,n), col=mycolors)

with(mtcars, {
  opar <- par(no.readonly = TRUE)
  par(mfrow = c(2,2))
  plot(wt, mpg, main = "scatterplot of wt vs. mpg")
  plot(wt, disp, main = "scatterplot of wt vs. disp")
  hist(wt, main = "histogram of wt")
  boxplot(wt, main = "boxplot of wt")
  par(opar)
})



with(mtcars, {
  opar <- par(no.readonly = TRUE)
  par(fig = c(0, 0.8, 0, 0.8))
  plot(wt, mpg, xlab = "Car Weight", ylab = "Miles per Gallon")
  par(fig = c(0, 0.8, 0.55, 1), new = TRUE)
  boxplot(wt, horizontal = TRUE, axes = FALSE)
  par(fig = c(0.65, 1, 0, 0.8), new = TRUE)
  boxplot(mpg, axes = FALSE)
  mtext("Enhanced Scatterplot", side = 3, outer = TRUE, line = -3)
  par(opar)
})

# Histogram
with(mtcars, {
  opar <- par(no.readonly = TRUE)
  par(mfrow = c(2, 2))
  
  # histogram
  hist(mpg, col = "green", main = "Basic Histogram")
  
  # histogram with assigned color
  hist(mpg,
       breaks = 12,
       col = "green",
       xlab = "Miles per Gallon",
       main = "Histogram with assigned color")
  
  # Histogram + Rug Plot + Density Curve
  hist(mpg,
       freq = F,
       breaks = 12,
       col = "green",
       xlab = "Miles per Gallon",
       main = "Histogram with Rug Plot")
  rug(jitter(mpg))
  lines(density(mpg), col = "blue", lwd = 2)
  
  # Histogram with normal distribution curve
  x <- mpg
  h <- hist(x,
            breaks = 12,
            col = "green",
            xlab = "Miles per Gallon",
            main = "Histogram with Normal Distribution Curve")
  # Normal distribution 
  # 在 x（也就是 mpg）的最小值到最大值之间，均匀取 40 个点，作为画曲线用的横坐标
  xfit <- seq(min(x), max(x), length = 40)
  # dnorm() 是正态分布的概率密度函数（PDF）。给定均值和标准差，它会算出每个 xfit 
  # 点对应的密度值
  yfit <- dnorm(xfit, mean = mean(x), sd = sd(x))
  # 缩放，让曲线能叠加到直方图上
  # diff(h$mids[1:2]) —— 算出每个柱子的宽度（bin width）
  # h$mids 是 hist() 算出来的每根柱子的**中点（midpoint）**位置，是一个向量——因为
  # 所有柱子宽度相等，这个差值正好等于单个柱子的宽度
  # yfit <- yfit * 柱宽 * 样本量把密度值换算成"频次"
  yfit <- yfit * diff(h$mids[1:2]) * length(x)
  
  # line
  lines(xfit, yfit, col = "blue", lwd = 2)
  
  par(opar)
})


# BoxPlot
boxplot(
  mpg ~ cyl, data = mtcars,
  main = "Box Plot of Car Mileage",
  xlab = "Number of Cylinders",
  ylab = "Miles per Gallon"
)

# Dual factor box plot

# Create factor of # cylinder
mtcars$cyl.f <- factor(mtcars$cyl,
                       levels = c(4, 6, 8),
                       labels = c("4", "6", "8"))

# Create factor of auto type: auto gearbox or manual gearbox
mtcars$am.f <- factor(mtcars$am,
                      levels = c(0, 1),
                      labels = c("Auto", "Manual"))

# Boxplot with dual factor
boxplot(
  mpg ~ cyl.f * am.f, data = mtcars,
  varwidth = T,
  col = c("green", "blue"),
  main = "Box Plot by Auto Type: Auto Gearbox vs. Manual Gearbox",
  xlab = "Auto Type",
  ylab = "Miles per Gallon"
)


help(mtcars)

