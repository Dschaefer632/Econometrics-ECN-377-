Absolutely — since your exam is **open notes + open R**, I’d make your notes very practical: **formula → what it means → R command → quick reminder**. You can paste this directly into an R script and use comments as your cheat sheet.

ECN 377 Exam I — R + Formula Notes

# ECN 377 — Exam I Notes

# Exam: Wed 10/7

# Through Day 12 ONLY

# Logs/units of measurement from Day 13 are NOT on exam

############################################################

# 1\. FOUNDATIONS — DAYS 1–3

############################################################

# ECONOMETRICS:

# Use data to learn about economic relationships.

# CORRELATION vs. CAUSATION:

# Correlation = variables move together.

# Causation = changing X actually causes a change in Y.

# Confounding variable = affects both X and Y, making the relationship misleading.

# Ceteris paribus = "all else equal" / holding other factors fixed.

# DATA TYPES:

# Cross-sectional = many individuals at one point in time

# Time series = one variable/unit over many time periods

# Panel = many individuals observed over multiple time periods

# Population = entire group

# Sample = subset of population

# SUMMATION:

# sum(x) = Σxi

# length(x) = n

# Sample mean:

mean(x)

# LINEAR FUNCTION:

# y = β0 + β1x

# β0 = intercept

# β1 = slope

#

# Change:

# Δy = β1 Δx

#

# With multiple variables:

# y = β0 + β1x1 + β2x2

# Change in x1:

# Δy = β1Δx1

# (intercept drops out of a change)

# PROPORTION vs PERCENTAGE:

# Percent change = (new - old) / old × 100

#

# Percentage-point change:

# new percentage - old percentage

#

# Example:

# unemployment goes from 5% to 7%

# percentage-point change = 2 percentage points

# percent change = (7-5)/5 × 100 = 40%

############################################################

# 2\. DESCRIBING DATA — DAY 4

############################################################

# SAMPLE VARIANCE:

# Var(X) = Σ(xi - x̄)^2 / (n-1)

#

# In R:

var(x)

# SAMPLE STANDARD DEVIATION:

# SD = sqrt(variance)

#

sd(x)

# SAMPLE COVARIANCE:

# Measures whether X and Y move together.

#

cov(x, y)

# COVARIANCE SIGN:

# Positive = X and Y tend to move together

# Negative = when X rises, Y tends to fall

# Near 0 = little linear relationship

# CORRELATION:

# Correlation = standardized covariance

# Range: -1 to +1

# No units

#

cor(x, y)

# Interpretation:

# +1 = perfect positive linear relationship

# 0 = no linear correlation

# -1 = perfect negative linear relationship

############################################################

# 3\. PROBABILITY — DAYS 5–7

############################################################

# NATURAL LOG / EXPONENTIAL:

# ln(x) = log(x)

# e^x = exp(x)

#

log(x)\
exp(x)

# RANDOM VARIABLE:

# A variable whose value depends on chance.

# EXPECTED VALUE:

# E\[X\] = Σ x × P(X=x)

#

# If you have values x and probabilities p:

sum(x \* p)

# EXPECTED VALUE OF X^2:

sum((x^2) \* p)

# PROPERTIES OF EXPECTATION:

#

# E\[aX + b\] = aE\[X\] + b

#

# E\[aX + bY\] = aE\[X\] + bE\[Y\]

# VARIANCE:

# Var(X) = E\[X²\] - \[E(X)\]²

#

# Standard deviation:

# SD(X) = sqrt(Var(X))

# VARIANCE RULES:

#

# Var(aX + b) = a² Var(X)

# Adding a constant does NOT change variance.

#

# Var(aX + bY)

# = a²Var(X) + b²Var(Y) + 2ab Cov(X,Y)

# IMPORTANT:

# If X and Y are independent:

# Cov(X,Y) = 0

#

# Therefore:

# Var(aX + bY)

# = a²Var(X) + b²Var(Y)

# CONDITIONAL EXPECTATION:

# E\[Y | X=x\] = average Y among observations where X=x

#

# Think:

# "What's the average Y for people/groups with this X?"

# CONDITIONAL VARIANCE:

# Measures how spread out Y is within a particular X group.

# COMMON DISTRIBUTIONS:

# Normal

# t

# F

############################################################

# 4\. SIMPLE LINEAR REGRESSION — DAYS 8–10

############################################################

# MODEL:

#

# Y = β0 + β1X + U

#

# Y = dependent variable

# X = explanatory/independent variable

# U = error term

# β0 = intercept

# β1 = slope

# β1:

# The ceteris paribus effect of X on Y.

#

# "How much does predicted Y change when X increases by 1?"

# ZERO CONDITIONAL MEAN:

#

# E\[U | X\] = 0

#

# Means that, conditional on X, the average error is zero.

#

# If E\[U|X\] = 0:

#

# E\[Y|X\] = β0 + β1X

#

# This allows us to interpret β1 as the ceteris paribus effect.

#

# It FAILS when X is related to the error term U.

# This can happen because of omitted/confounding variables.

############################################################

# OLS — ORDINARY LEAST SQUARES

############################################################

# OLS chooses the line that minimizes:

#

# Σ(yi - ŷi)²

#

# In words:

# OLS minimizes the SUM OF SQUARED RESIDUALS.

# Regression in R:

#

reg \<- lm(y \~ x, data = dataset)

# Example:

library(wooldridge)\
data("wage1")

reg \<- lm(wage \~ educ, data = wage1)

# LOOK AT COEFFICIENTS:

reg$coefficients

# Intercept:

reg$coefficients\[1\]

# Slope:

reg$coefficients\[2\]

# OR:

coef(reg)

############################################################

# OLS COEFFICIENT FORMULAS

############################################################

# SLOPE:

#

# β̂1 = Cov(X,Y) / Var(X)

#

# In sample:

cov(x,y) / var(x)

# INTERCEPT:

#

# β̂0 = ȳ - β̂1 x̄

#

mean(y) - coef(reg)\[2\] \* mean(x)

# IMPORTANT:

# β̂1 tells you predicted change in Y from a 1-unit

# increase in X.

############################################################

# FITTED VALUES / PREDICTIONS / RESIDUALS

############################################################

# Fitted (predicted) value:

#

# ŷ = β̂0 + β̂1X

# In R:

reg$fitted.values

# Residual:

#

# û = y - ŷ

#

# Actual Y minus predicted Y.

reg$residuals

# Prediction for a specific X:

#

# β̂0 + β̂1X

# Example: predicted wage for 12 years education:

coef(reg)\[1\] + coef(reg)\[2\] \* 12

# Or use predict():

predict(reg, newdata = data.frame(educ = 12))

# ROUND TO HUNDREDTHS:

round(predict(reg, newdata = data.frame(educ = 12)), 2)

############################################################

# PREDICTED CHANGES

############################################################

# VERY IMPORTANT:

#

# Δŷ = β̂1 Δx

#

# If X increases by 5:

#

# Δŷ = β̂1 × 5

# Example:

round(coef(reg)\[2\] \* 5, 2)

# The intercept DOES NOT matter for a change.

# If slope = -0.5 and X increases by 5:

# Change = -0.5 × 5 = -2.5

#

# Predicted Y decreases by 2.5 units.

############################################################

# EXAMPLE: BWGHT AND CIGS

############################################################

# bwght = baby's birth weight in ounces

# cigs = cigarettes smoked per day

data("bwght")

reg2 \<- lm(bwght \~ cigs, data = bwght)

# See coefficients:

coef(reg2)

# Change in predicted birth weight from 5 MORE cigarettes:

round(coef(reg2)\["cigs"\] \* 5, 2)

# OR:

round(coef(reg2)\[2\] \* 5, 2)

# Remember:

# slope × change in X = change in predicted Y

############################################################

# 5\. GOODNESS OF FIT — DAYS 11–12

############################################################

# OLS PROPERTIES:

#

# 1\. Residuals sum to zero:

sum(reg$residuals)

# Should be approximately 0.

# 2\. X and residuals are uncorrelated:

cor(wage1$educ, reg$residuals)

# Should be approximately 0.

# 3\. (x̄, ȳ) lies on the OLS regression line.

#

# At x = mean(x), predicted y = mean(y)

############################################################

# SST, SSE, SSR

############################################################

# SST = Total Sum of Squares

#

# Measures TOTAL variation in Y.

#

# SST = Σ(yi - ȳ)²

# SSE = Sum of Squared Errors / Residual Sum of Squares

#

# Measures variation NOT explained by regression.

#

# SSE = Σ(yi - ŷi)²

# SSR = Regression Sum of Squares

#

# Measures variation explained by regression.

#

# SSR = Σ(ŷi - ȳ)²

# KEY DECOMPOSITION:

#

# SST = SSE + SSR

############################################################

# R-SQUARED

############################################################

# R² tells you the fraction/proportion of variation

# in Y explained by X in the regression.

# Formula:

#

# R² = SSR / SST

#

# OR:

#

# R² = 1 - SSE/SST

# In R:

summary(reg)$r.squared

# Example interpretation:

#

# R² = 0.40

#

# "40% of the sample variation in Y is explained

# by X in this regression."

# IMPORTANT:

# A LOW R² IS NOT NECESSARILY BAD IN ECONOMICS.

# Human/economic outcomes are affected by many factors,

# so a lot of unexplained variation can be normal.

############################################################

# 6\. R SKILLS — IMPORTANT COMMANDS

############################################################

# VECTORS:

x \<- c(1, 2, 3, 4, 5)

# SUM:

sum(x)

# NUMBER OF OBSERVATIONS:

length(x)

# LOAD WOOLDRIDGE:

library(wooldridge)

# LOAD DATASET:

data("wage1")

# ACCESS A COLUMN:

wage1$wage\
wage1$educ

# NUMBER OF ROWS / SAMPLE SIZE:

nrow(wage1)

# MEAN:

mean(wage1$wage)

# VARIANCE:

var(wage1$wage)

# STANDARD DEVIATION:

sd(wage1$wage)

# COVARIANCE:

cov(wage1$wage, wage1$educ)

# CORRELATION:

cor(wage1$wage, wage1$educ)

# REGRESSION:

reg \<- lm(wage \~ educ, data = wage1)

# COEFFICIENTS:

reg$coefficients

# or

coef(reg)

# FITTED VALUES:

reg$fitted.values

# RESIDUALS:

reg$residuals

# R-SQUARED:

summary(reg)$r.squared

# SAVE A RESULT:

b1 \<- coef(reg)\[2\]

# REUSE IT:

b1 \* 5

# ROUND:

round(b1 \* 5, 2)

############################################################

# 7\. QUICK EXAM FORMULA SHEET

############################################################

# MEAN:

# x̄ = Σxi / n

# VARIANCE:

# Var(X) = E\[X²\] - \[E(X)\]²

# STANDARD DEVIATION:

# SD(X) = sqrt(Var(X))

# COVARIANCE:

# Cov(X,Y)

# CORRELATION:

# Corr(X,Y) = Cov(X,Y) / \[SD(X)SD(Y)\]

# Range = -1 to +1

# REGRESSION:

# Y = β0 + β1X + U

# PREDICTED Y:

# ŷ = β̂0 + β̂1X

# SLOPE:

# β̂1 = Cov(X,Y) / Var(X)

# INTERCEPT:

# β̂0 = ȳ - β̂1x̄

# PREDICTED CHANGE:

# Δŷ = β̂1Δx

# RESIDUAL:

# û = y - ŷ

# SUM OF SQUARED RESIDUALS:

# SSE = Σ(yi - ŷi)²

# TOTAL SUM OF SQUARES:

# SST = Σ(yi - ȳ)²

# REGRESSION SUM OF SQUARES:

# SSR = Σ(ŷi - ȳ)²

# DECOMPOSITION:

# SST = SSE + SSR

# R-SQUARED:

# R² = SSR/SST

# R² = 1 - SSE/SST

############################################################

# 8\. EXAM QUESTION SHORTCUTS

############################################################

# "How much does predicted Y change when X increases by \_\_\_?"

#

# ANSWER:

# slope × change in X

#

# R:

round(coef(reg)\[2\] \* change\_in\_x, 2)

# "What is predicted Y when X = \_\_\_?"

#

# ANSWER:

# intercept + slope × X

#

# R:

round(coef(reg)\[1\] + coef(reg)\[2\] \* X, 2)

#

# OR:

predict(reg, newdata = data.frame(x = X))

# "What is the slope?"

#

# R:

coef(reg)\[2\]

# "What is the intercept?"

#

# R:

coef(reg)\[1\]

# "What is R²?"

#

# R:

summary(reg)$r.squared

# "What is the residual?"

#

# Actual - predicted

#

# R:

reg$residuals

# "What does the slope mean?"

#

# A 1-unit increase in X is associated with a

# β̂1-unit change in predicted Y, holding other

# included variables fixed.

############################################################

# 9\. ROUNDING

############################################################

# ALWAYS round numeric answers to hundredths:

#

round(answer, 2)

# Example:

round(3.14159, 2)

# 3.14

############################################################

# 10\. MOST IMPORTANT THINGS TO MEMORIZE

############################################################

# 1\. Regression:

# Y = β0 + β1X + U

# 2\. Predicted value:

# ŷ = β̂0 + β̂1X

# 3\. Predicted change:

# Δŷ = β̂1Δx

# 4\. Residual:

# û = y - ŷ

# 5\. Slope:

# β̂1 = Cov(X,Y)/Var(X)

# 6\. Intercept:

# β̂0 = ȳ - β̂1x̄

# 7\. Goodness of fit:

# SST = SSE + SSR

# 8\. R²:

# R² = SSR/SST = 1 - SSE/SST

# 9\. Zero conditional mean:

# E\[U|X\] = 0

# 10\. R commands:

# mean()

# var()

# sd()

# cov()

# cor()

# lm()

# coef()

# predict()

# summary()$r.squared

# nrow()

# length()

# sum()

# round()

############################################################

This version is designed to be **searchable during the exam**—for example, if you see “predicted change,” you can Ctrl+F that phrase and immediately get the formula and R command.