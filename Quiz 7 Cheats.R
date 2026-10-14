#Question 1 Richer school districts tend to have smaller classes. Which statement is correct?
The zero conditional mean assumption fails, because the average of U changes with class size.

# Question 2
# Find which line is the OLS line just pick the smallest in the third column
# Enter the sum of squared residuals for each line
squared_residuals <- c(9.71, 9.00, 8.13, 8.35)
# Name each line
names(squared_residuals) <- c("A", "B", "C", "D")
# Find the line with the smallest sum of squared residuals
which.min(squared_residuals)

# Question 3
# Find the standard deviation of aX + b
# Fill in the given numbers
EX <- 3       # E[X]
EX2 <- 34     # E[X^2]
a <- 5        # Number multiplying X
b <- -5       # Constant added to X
# Find the variance of X
var_X <- EX2 - EX^2
# Find the standard deviation of aX + b
answer <- abs(a) * sqrt(var_X)
# Answer
round(answer, 2)

# Question 4
# Find the variance of aX + bY
# Fill in the given numbers
var_X <- 10
var_Y <- 12
cov_XY <- -5.3
a <- 3
b <- -3
# Calculate the variance
answer <- a^2 * var_X + b^2 * var_Y + 2 * a * b * cov_XY
# Answer
round(answer, 2)
answer

# Question 5
# Find the correlation between X and Y
# Enter the values from the table
x <- c(2, 5, 6, 7)
y <- c(12, 9, 1, 12)
p <- c(0.2, 0.3, 0.4, 0.1)
# Find the expected values
EX <- sum(x * p)
EY <- sum(y * p)
# Find the variances
var_X <- sum(x^2 * p) - EX^2
var_Y <- sum(y^2 * p) - EY^2
# Find the covariance
cov_XY <- sum(x * y * p) - EX * EY
# Find the correlation
answer <- cov_XY / sqrt(var_X * var_Y)
# Answer
round(answer, 2)

# Question 6
# regress y on x by ols Find a residual from an OLS regression
# Enter the data
x <- c(4, 5, 6, 8, 9)
y <- c(11, 6, 2, 1, 1)
# Run the regression
model <- lm(y ~ x)
# Find the residual for observation 3
answer <- residuals(model)[3]
# Answer
round(answer, 2)

# Question 7
# Find the missing residual
# Enter the known residuals
residuals_known <- c(-0.7, 1.7, -0.4, 0.3, 2.4)
# Find the missing residual
answer <- -sum(residuals_known)
# Answer
round(answer, 2)

# Question 8
# Find the sum of x times the residuals
# Enter the data
x <- c(4, 6, 10, 11, 13, 14)
y <- c(11, 11, 8, 7, 12, 13)
# Run the OLS regression
model <- lm(y ~ x)
# Multiply each x by its residual and add
answer <- sum(x * residuals(model))
answer

# Question 9
# Find the sum of squared residuals (SSR) A regression has explained sum of squares
SSE <- 111
R2 <- 0.56
# Find the total sum of squares
SST <- SSE / R2
# Find SSR
SSR <- SST - SSE
# Answer
round(SSR, 2)


# Question 10
# Find the total sum of squares (SST)
n <- 31
sample_variance <- 7
# Calculate SST
SST <- sample_variance * (n - 1)
# Answer
round(SST, 2)

# Question 11 Data:wage1 (wage = average hourly earnings in dollars; tenure = years with the current employer) Ru reg <- lm (wage~ tenure, data = wage1) what is the OLS residual of the worker in row 12?
# Find the residual for row 12
# Run the regression
reg <- lm(wage ~ tenure, data = wage1)
# Get the residual for row 12
answer <- residuals(reg)[12]
# Answer
round(answer, 2)

# Question 12 
# Find the sample mean of y
intercept <- 9
slope <- 2.9
mean_x <- 2
# Calculate the sample mean of y
answer <- intercept + slope * mean_x
# Answer
round(answer, 2)