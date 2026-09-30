#Claude r code
#In OLS, the fitted value is:the model's prediction of y at each xi

# residuals = actual - fitted

#Positive residual → Under-predicted. Actual is above the line, so û = actual − fitted > 0. The model guessed too low.
#Negative residual → Over-predicted. Actual is below the line, so û < 0. The model guessed too high.
#Zero residual → Fit exactly. Actual = fitted, so the model made an error of exactly zero.

#Question: R² is:
#Answer: The fraction of the sample variation in y explained by x (your paste dropped the variable names, but it's the third choice)

#SST= sse + ssr

#The sum of the OLS residuals is always: 0

#R² < 0      Can't happen in OLS (with an intercept)
#R² = 0      Explains nothing
#R² near 0   Explains very little (bad fit)
#R² > 0      Explains some
#R² = 0.5    Explains about half
#R² near 1   Explains almost everything (good fit)
#R² = 1      Perfect fit, all residuals are 0

#The point (Xbar, Ybar) always falls on the OLS regression line

#CALCULATION PROBLEMS__________________________________

#Find the OLS slope
x <- c(2, 2, 4)
y <- c(1, 7, 7)

num <- sum((x - mean(x)) * (y - mean(y)))   # numerator
den <- sum((x - mean(x))^2)                 # denominator
b1  <- num / den                            # slope
round(b1, 2)                                # ANSWER

coef(lm(y ~ x))[2] 

#Find the OLS intercept
x <- c(1, 6, 5)
y <- c(6, 6, 10)

b1 <- sum((x - mean(x)) * (y - mean(y))) / sum((x - mean(x))^2)  # slope first
b0 <- mean(y) - b1 * mean(x)                                     # intercept
round(b0, 2)                                                     # ANSWER

coef(lm(y ~ x))[1]                                               # check

#Fit the OLS line and predict ŷ at a given x
x <- c(1, 2, 6)
y <- c(10, 10, 10)
x_new <- 7

b1 <- sum((x - mean(x)) * (y - mean(y))) / sum((x - mean(x))^2)
b0 <- mean(y) - b1 * mean(x)
round(b0 + b1 * x_new, 2)                                        # ANSWER

predict(lm(y ~ x), newdata = data.frame(x = x_new))              # check

#A fitted line is ŷ = ...", "find the fitted value ŷ at x = ...",
#Fitted value from a given line
#2 is intercept b1 is slope x is the value of x they give you
b0 <- 2
b1 <- 5/10
x  <- 14
round(b0 + b1 * x, 2)   # ANSWER

#Residual from a given line
#A fitted line is ŷ = ...", "a person has x = ... and actual y = ...", "find the residual û = y − ŷ
b0 <- 4
b1 <- 9/10
x  <- 12
y  <- 13          # the ACTUAL value

y_hat <- b0 + b1 * x
round(y - y_hat, 2)   # ANSWER (actual - fitted)

#Predicted change in y from a change in x
#A fitted slope is β̂₁ = ...", "using Δŷ = β̂₁Δx", "predicted change in y when x rises by
b1      <- 7/10
delta_x <- 6      # use a negative number if x falls

round(b1 * delta_x, 2)   # ANSWER

#SSR from a given line and points
#For the fitted line ŷ = ... and the three points (x, y), ...", "find SSR = Σ(Yᵢ − Ŷᵢ)²
b0 <- 0
b1 <- 3/10
x  <- c(8, 5, 4)
y  <- c(11, 10, 11)

y_hat <- b0 + b1 * x
resid <- y - y_hat
round(sum(resid^2), 2)   # ANSWER

#A regression has SST = ... and SSR = ...", "find the explained sum of squares SSE
#SST = SSE + SSR
sst <- 346
ssr <- 134

round(sst - ssr, 2)   # ANSWER (SSE)

#Find R² from SST and SSR
#Use R² = 1 − SSR/SST.
sst <- 337
ssr <- 115

round(1 - ssr/sst, 2)   # ANSWER (R-squared)

#R² from SSE and SST
#Use R² = SSE/SST
sse <- 130
sst <- 241
round(sse / sst, 2)

#Fraction of variation UNEXPLAINED
#A regression has SST = ... and SSR = ...", "What fraction of the variation in Y is UNEXPLAINED
sst <- 258
ssr <- 72
#round(1 - ssr / sst, 2)   # explained, if they ask for that instead
round(ssr / sst, 2)   # ANSWER (unexplained)

#Find SSR from SST and R²
sst <- 268
r2  <- 13/100
#round(sst * r2, 2)         # SSE, if they ask for explained instead
round(sst * (1 - r2), 2)   # ANSWER (SSR)
