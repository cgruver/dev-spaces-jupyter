# R Hello World Demo
cat("Hello, World from R!\n")

# Basic data frame example
df <- data.frame(
  Name = c("Alice", "Bob", "Charlie"),
  Score = c(95, 87, 92)
)
print(df)
cat("\nMean score:", mean(df$Score), "\n")
