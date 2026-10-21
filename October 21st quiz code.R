############################################################
# ECN MASTER SCRIPT — QUESTIONS 1–19
# Question wording is reconstructed from the screenshots
# and our conversation where the original wording isn't
# fully available.
############################################################
#14 In a regression of y on the x, the OLS slope is B1= 0.14 every value of x is then divided by 1000 (for example, percent to decimal when the divisor is 100) what is the new OLS slope round to the hundreds
old_slope <- 0.14
divisor <- 1000

new_slope <- old_slope * divisor

round(new_slope, 2)

# A log-level regression gives log(y)= 2.1+0.07x By about what percent does y change when x rises by 1
#Question 17: Log-level regression

beta1 <- 0.07
change_x <- 1

percent_change_y <- 100 * beta1 * change_x

round(percent_change_y, 2)
# Answer: 7

# Question 19: Level-log regression
#A level-log regression gives y =178 +28.1 log(x) by about how many units does y change when x rises by 18%?

beta1 <- 28.1
percent_change_x <- 18

change_y <- (beta1 / 100) * percent_change_x

round(change_y, 2)
# Answer: 5.06


# QUESTION 1
# Reconstructed: Changing CEO salary from thousands of
# dollars to dollars in a log-log regression.
# Answer: b1 stays the same b0 is changed The slope stays the same. The intercept increases
# by log(1000).

old_intercept <- 4.93
new_intercept <- old_intercept + log(1000)
round(new_intercept, 2)

# QUESTION 5
# a log log regression gives log(y) = 4.3 +0.26log(x) by about what percent does y change when x falls by 18%? (Give a percent; it can be negative)
# Reconstructed: Calculate the percentage change in y
# in a log-log model when x changes by a given percentage.
# Formula: beta1 * percentage change in x

beta <- 0.26
percent_change_x <- -18
round(beta * percent_change_x, 2)


# QUESTION 6
#Data ceosal1 (salary = a ceo's 1990 salary in thousands of dollars; roe = the firms return on equity, in percent; sales = firm sales in millions of dollars). Run the log-level regression lm(log(salary) ~ roe, data = ceosal1) By about what percent does predicted salary change when return on equity rises by 5 points?
# Reconstructed: Use ceosal1 to estimate the log(salary)
# regression on roe and calculate the approximate
# percentage change in salary for a 5-point increase in ROE.
#Salary is the dependent variable 

library(wooldridge)
data(ceosal1)

reg6 <- lm(log(salary) ~ roe, data = ceosal1)
round(100 * coef(reg6)[2] * 5, 2)



# QUESTION 9
#In wage = B0 +B1 educ+U which of the following is the most likely to contriibute omitted variable bias to the OLS Slope on educ
#The workers ability which raises wages and tends to be higher for people with more education
# Reconstructed: Which omitted variable could cause
# bias when estimating the effect of education on wages?
#
# Answer: The worker's ability.
# Ability may affect wages and be correlated with education.


# QUESTION 13
#holding everything else fixed which change makes Var(B1) smaller
#more spread out values of X larger SST x
# Reconstructed: What change makes the variance of
# the OLS slope estimator smaller, holding other
# factors fixed?
#
# Answer: Increase the spread of X (increase SST_X).
#
# Formula:
# Var(beta_hat_1) = sigma_squared / SST_X


# QUESTION 14
#Under SLR1-SLR5 the error standard deviation is o=3 a sample has the five X values x = (3,6,7,9,10) find sd(b1) 
# Reconstructed from the screenshot: Calculate the
# standard deviation of the OLS slope estimator using
# the given X values and error standard deviation.

x <- c(3, 6, 7, 9, 10)
sigma <- 3

SST_X <- sum((x - mean(x))^2)
round(sigma / sqrt(SST_X), 2)


# QUESTION 15
#a simple regression on n = 44 observations has SSR = 109 find the estimate of the error variance, o^2 
# Reconstructed: Calculate the estimated error variance.
# Formula: SSR / (n - 2)

SSR <- 109
n <- 44
round(SSR / (n - 2), 2)


# QUESTION 16
#a simple regression on n =14 observations has SSR= 626 and SSTx = 10 find the standard error se(B1) 
# Reconstructed: Calculate the standard error of the
# OLS slope estimator.
# Formula: sqrt(SSR / (n - 2)) / sqrt(SST_X)

SSR <- 626
n <- 14
SST_X <- 10

sigma_hat <- sqrt(SSR / (n - 2))
round(sigma_hat / sqrt(SST_X), 2)

