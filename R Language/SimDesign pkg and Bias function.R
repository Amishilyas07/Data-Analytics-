install.packages("SimDesign")
library(SimDesign)

actual_sales <- c(150,203,440,560,950,254)
predicted_sales <- c(400,120,430,220,160,278)
bias(actual_sales,predicted_sales)