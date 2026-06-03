# 1. Import tianmaoTV.xlsx and name the dataset tc_data. All following operations are based on the tc_data dataset.
# 2. Extract all observations where the current price (current_price) is less than 1000.
# 3. In the dataset tc_data, create a new column named stock_class.
#    When stock (stock) equals 0, the value of stock_class is 'Out of Stock';
#    When stock (stock) is less than 100, the value of stock_class is 'Low Stock';
#    When stock (stock) is greater than or equal to 100, the value of stock_class is 'High Stock'.
# 4. Extract the two columns stock and stock_class from tc_data.
# 5. Drop the two columns named "shop_id" and "shop_name".

# import package
library(readxl)

# read data
tc_data <- read_excel("tianmaoTV.xlsx", skip = 1)

# Extract all observations where the current price (current_price) is less than 1000.
select_price_range <- tc_data$current_price < 1000
tc_data[select_price_range, ]

# 3. In the dataset tc_data, create a new column named stock_class.
#    When stock (stock) equals 0, the value of stock_class is 'Out of Stock';
#    When stock (stock) is less than 100, the value of stock_class is 'Low Stock';
#    When stock (stock) is greater than or equal to 100, the value of stock_class is 'High Stock'.
tc_data$stock_class <- ifelse(
  tc_data$stock == 0, 'Out of Stock',
  ifelse(tc_data >= 100, 'High Stock', 'Low Stock')
)

View(tc_data)

# Extract the two columns stock and stock_class from tc_data.
selected_col <- c('stock', 'stock_class')
selected_data <- tc_data[, selected_col]
View(selected_data)

# Drop the two columns named "shop_id" and "shop_name".
delete_col <- c('shop_id', 'shop_name')
new_data <- tc_data[ ,!names(tc_data) %in% delete_col]
View(new_data)
