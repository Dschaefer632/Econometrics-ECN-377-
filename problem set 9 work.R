# ============================================================
# Problem Set 10 - R code (change the numbers at the top of each
# question and re-run to solve a similar problem)
# Setup: install.packages("wooldridge") once, then:
# ============================================================
file.create("Problem Set 9 Cheat Code.R")
library(wooldridge)

# ---------- Question 1 ----------
# A regression gives test score = 12 + 8 log(income). What does the 8 mean?
# LEVEL-LOG: a 1% rise in x -> change in y of about beta1/100 points
b1 <- 8
b1 / 100          # 0.08 points per 1% rise in income
# Answer: "A 1% rise in income is associated with a rise of about 0.08 points..."

# ---------- Question 2 ----------
# A log-level regression gives log(y) = 1.1 + 0.08x. By about what percent does y
# change when x falls by 1? (round to hundredths)
b1 <- 0.08; dx <- -1
round(100 * b1 * dx, 2)    # -8

# ---------- Question 3 ----------
# bwght = birth weight (oz); faminc = family income (thousands $).
# Run lm(log(bwght) ~ log(faminc), data = bwght). By about what percent does
# predicted birth weight change when family income rises by 20%?
data("bwght")
reg <- lm(log(bwght) ~ log(faminc), data = bwght)
pct_change_x <- 20
round(coef(reg)[2] * pct_change_x, 2)   # log-log: %dy = beta1 * %dx

# ---------- Question 4 ----------
# 1,000 random samples, beta1-hat in each. If OLS is unbiased, which is correct?
# Answer: "The average of the 1,000 estimates is close to beta1."
# (unbiased = right on average; estimates still vary, and aren't all equal)

# ---------- Question 5 ----------
# Why prefer an unbiased estimator with a smaller variance?
# Answer: "Its estimates land closer to beta1 from sample to sample,
#          so any one estimate is more reliable."

# ---------- Question 6 ----------
# Var(beta1-hat) = sigma^2 / SST_x. Which changes make it LARGER? (select all)
# Answers: smaller sample (smaller SST_x); larger error variance sigma^2;
#          X values bunched tighter (smaller SST_x).
# NOT: larger true slope, larger sample.

# ---------- Question 7 ----------
# n = 8, sigma-hat = 6.8, sample sd of X = 2.8. Find se(beta1-hat).
n <- 8; sigma_hat <- 6.8; sd_x <- 2.8
SST_x <- (n - 1) * sd_x^2
round(sigma_hat / sqrt(SST_x), 2)       # 0.92

# ---------- Question 8 ----------
# x = (1,2,6,7,9), SSR = 103. Find se(beta1-hat).
x <- c(1, 2, 6, 7, 9); SSR <- 103
n <- length(x)
sigma_hat <- sqrt(SSR / (n - 2))
SST_x <- sum((x - mean(x))^2)
round(sigma_hat / sqrt(SST_x), 2)       # 0.86

# ---------- Question 9 ----------
# sd(beta1-hat) = 1.09. If the sample were 16 times as large (SST_x 16x as large),
# what is the new sd? (sd scales with 1/sqrt(SST_x))  -- read the end of your question
old_sd <- 1.09; factor <- 16
round(old_sd / sqrt(factor), 2)         # 0.27

# ---------- Question 10 ----------
# Data: ceosal1 (salary = a CEO's 1990 salary in thousands of dollars;
# roe = the firm's return on equity, in percent; sales = firm sales in millions of dollars).
# Run reg <- lm(salary ~ roe, data = ceosal1). Compute the standard error se(beta1-hat)
# by hand from sigma-hat and SST_x. (round to the hundredths)
# Hint: sigma-hat = sqrt(SSR/(n-2)) and SST_x = sum((ceosal1$roe - mean(ceosal1$roe))^2).
# Then se(beta1-hat) = sigma-hat / sqrt(SST_x). Check it against summary(reg) (column "Std. Error").
library(wooldridge)
data("ceosal1")
reg <- lm(salary ~ roe, data = ceosal1)

SSR       <- sum(resid(reg)^2)
n         <- nrow(ceosal1)
sigma_hat <- sqrt(SSR / (n - 2))
SST_x     <- sum((ceosal1$roe - mean(ceosal1$roe))^2)
round(sigma_hat / sqrt(SST_x), 2)   # <- your answer

summary(reg)   # check: the "Std. Error" for roe should match

# ---------- Question 11 ----------
# In wage-hat = b0 + b1 educ + b2 exper, what does b1 measure?
# Answer: "The predicted change in wage from one more year of education,
#          holding experience fixed."

# ---------- Question 12 ----------
# y-hat = 7 + 1.4 x1 + 0.4 x2. Find y-hat at x1 = 10, x2 = 1.
b0 <- 7; b1 <- 1.4; b2 <- 0.4; x1 <- 10; x2 <- 1
round(b0 + b1 * x1 + b2 * x2, 2)        # 21.40

# ---------- Question 13 ----------
# y-hat = 6 + 2.9 x1 - 1.1 x2. If x1 rises by 4 and x2 rises by 2, how much
# does y-hat change?
b1 <- 2.9; b2 <- -1.1; dx1 <- 4; dx2 <- 2
round(b1 * dx1 + b2 * dx2, 2)           # 9.40

# ---------- Question 14 ----------
# wage1: reg <- lm(wage ~ educ + exper + tenure, data = wage1). Predicted wage for
# 14 yrs education, 10 yrs experience, 5 yrs tenure?
data("wage1")
reg <- lm(wage ~ educ + exper + tenure, data = wage1)
b <- reg$coefficients
round(b[1] + b[2]*14 + b[3]*10 + b[4]*5, 2)

# ---------- Question 15 ----------
# Same regression: change in predicted wage when tenure rises by 3 years,
# holding educ and exper fixed?
round(b[4] * 3, 2)

# ---------- Question 16 ----------
# ceosal1: reg <- lm(log(salary) ~ log(sales) + roe, data = ceosal1).
# By about what percent does predicted salary change when roe rises by 10 points,
# holding sales fixed? (unrounded coefficient)
data("ceosal1")
reg <- lm(log(salary) ~ log(sales) + roe, data = ceosal1)
b <- reg$coefficients
round(100 * b[3] * 10, 2)               # log-level: 100 * beta * d(roe)

# ---------- Question 17 ----------
# Predicted salary (thousands $) for sales = 5000 and roe = 15 (unrounded coefs).
round(exp(b[1] + b[2]*log(5000) + b[3]*15), 2)

# ---------- Question 18 ----------
# beta1-tilde = beta1-hat + beta2-hat * delta1-tilde, with beta1-hat = 0.83,
# beta2-hat = -1.16, delta1-tilde = -0.66. Find the simple-regression slope.
b1_hat <- 0.83; b2_hat <- -1.16; d1_tilde <- -0.66
round(b1_hat + b2_hat * d1_tilde, 2)    # 1.60

# ---------- Question 19 ----------
# In the population, Y = b0 + b1 X1 + b2 X2 + U with b2 = 1.97.
# You omit X2 and regress Y on X1 alone, and the slope from regressing X2 on X1
# is delta1-tilde = -0.29. What is the bias of the simple-regression slope,
# Bias(beta1-tilde) = E[beta1-tilde] - beta1? (round to the hundredths)
# Hint: Bias(beta1-tilde) = beta2 * delta1-tilde. A negative answer means the
# slope is biased downward.
beta2       <- 1.97
delta1_tilde <- -0.29
round(beta2 * delta1_tilde, 2)   # -0.57

# ---------- Question 20 ----------
# An omitted variable X2 lowers Y (beta2 < 0), and X2 is positively correlated
# with X1 (delta1-tilde > 0). The simple-regression slope on X1 is:
#   biased upward / impossible to sign without the data / unbiased / biased downward
# Bias = beta2 * delta1-tilde. Plug in only the SIGNS to find the direction.
beta2_sign   <- -1   # X2 lowers Y         (beta2 < 0)
delta1_sign  <- +1   # X2 positively correlated with X1 (delta1 > 0)
bias_sign <- beta2_sign * delta1_sign
if (bias_sign > 0) "biased upward" else if (bias_sign < 0) "biased downward" else "unbiased"
# Answer: biased downward  (negative * positive = negative)


# ---------- Question 21 ----------
# wage1: run lm(wage ~ educ + exper) and lm(exper ~ educ). Compute
# beta2-hat * delta1-tilde (exper coef from 1st times educ slope from 2nd).
multi  <- lm(wage ~ educ + exper, data = wage1)
aux    <- lm(exper ~ educ, data = wage1)
round(coef(multi)["exper"] * coef(aux)["educ"], 2)

# Check with (3.23): simple educ slope minus multiple-regression educ slope
simple <- lm(wage ~ educ, data = wage1)
round(coef(simple)["educ"] - coef(multi)["educ"], 2)   # should match