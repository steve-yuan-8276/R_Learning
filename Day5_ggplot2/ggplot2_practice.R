# Load package
library("ggplot2")

# load the dataset
data("iris")
View("iris")

# scatter plot
p.scatter <- ggplot(iris) +
  geom_point(aes(x = Sepal.Length, y = Sepal.Width, color = Species)) +
  labs(title = "Speal Width vs Sepal Length by Species",
       x = "Length",
       y = "Width") +
  theme(plot.title = element_text(hjust = 0.5))   # 0：左对齐， 1: 右对齐
p.scatter

# Boxplot
p.box <- ggplot(iris) +
  geom_boxplot(aes(x = Species, y = Petal.Length, color = Species)) +
  labs(titie = "Boxplot of speal width by species",
       x = "Species",
       y = "Width") +
  theme(plot.title = element_text(hjust = 0.5))
p.box

# box plot + jitter combo
p.box.jitter <- p.box +
  geom_jitter(aes(x = Species, y = Petal.Length, color = Species))
p.box.jitter

# Violin plot
p.violin <- ggplot(iris) +
  geom_violin(aes(x = Species, y = Petal.Length, color = Species),
              draw_quantiles = c(0.25, 0.5, 0.75)) +
  labs(title = "Violin Plot",
       x = "Species",
       y = "Length") +
  theme(plot.title = element_text(hjust = 0.5))
p.violin

# Better way: Violin + box plot
p.violin.box <- ggplot(iris, aes(x = Species, y = Petal.Length)) +
  geom_violin(aes(color = Species)) +
  geom_boxplot(width = 0.1, outlier.shape = NA) +
  labs(title = "Violin Plot",
       x = "Species",
       y = "Length") +
  theme(plot.title = element_text(hjust = 0.5))
p.violin.box




