#Problem set 10 Quiz Cheat Sheet
12,13,14,15
# -----Question 1------
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

# ---------- Question 6 ----------
# Under SLR1-SLR5 Var(beta1-hat) = sigma^2 / SST_x. Which changes make Var(beta1 hat) LARGER? (select all)
# Answers: smaller sample (smaller SST_x); larger error variance sigma^2;
#          X values bunched tighter (smaller SST_x).
# NOT would make var(b1 hat smaller): larger true slope, larger sample.

# ---------- Question 7 ----------
# n = 8, sigma-hat = 6.8, sample sd of X = 2.8. Find se(beta1-hat).
n <- 8; sigma_hat <- 6.8; sd_x <- 2.8
SST_x <- (n - 1) * sd_x^2
round(sigma_hat / sqrt(SST_x), 2) 

# ---------- Question 9 ----------
# sd(beta1-hat) = 1.09. If the sample were 16 times as large (SST_x 16x as large),
# what is the new sd? (sd scales with 1/sqrt(SST_x))  -- read the end of your question
old_sd <- 1.09; factor <- 16
round(old_sd / sqrt(factor), 2)  

# ---------- Question 12 ----------
# A multiple regression gives y hat 7+1.4x1 +0.4x2 find the predicted value y hat at x1= 10 and x2 = 1 y-hat = 7 + 1.4 x1 + 0.4 x2. Find y-hat at x1 = 10, x2 = 1.
#b0= first number b1 = second number b2 = 3rd number
b0 <- 7; b1 <- 1.4; b2 <- 0.4; x1 <- 10; x2 <- 1
round(b0 + b1 * x1 + b2 * x2, 2)        # 21.40

# ---------- Question 13 ----------
# a mulitple regression gives y-hat = 6 + 2.9 x1 - 1.1 x2. If x1 rises by 4 and x2 rises by 2, how much does y-hat change?
b1 <- 2.9; b2 <- -1.1; dx1 <- 4; dx2 <- 2
round(b1 * dx1 + b2 * dx2, 2)           # 9.40

# ---------- Question 14 ----------
# Data: wage1 (wage = average hourly earnings in dollars; educ = years of education;
# exper = years of experience; tenure = years with the current employer).
# Run reg <- lm(wage ~ educ + exper + tenure, data = wage1).
# What is the predicted hourly wage of a worker with 14 years of education,
# 10 years of experience and 5 years of tenure? (round to the hundredths)
# Hint: e.g. save the coefficients with b <- reg$coefficients, then do something
# like b[1] + b[2]*14 + b[3]*10 + b[4]*5.
data("wage1")
reg <- lm(wage ~ educ + exper + tenure, data = wage1)
b <- reg$coefficients
round(b[1] + b[2]*14 + b[3]*10 + b[4]*5, 2)

# ---------- Question 15 ----------
# Same regression: change in predicted wage when tenure rises by 3 years,
# holding educ and exper fixed?
round(b[4] * 3, 2)
