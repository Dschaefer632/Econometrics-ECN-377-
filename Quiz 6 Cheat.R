# Question 1
# A problem that asks what the fitted value Ŷᵢ means.
# Ŷᵢ = β̂₀ + β̂₁Xᵢ
# Answer:
# The model's PREDICTION of Y at Xᵢ


# Question 2
# A problem that asks for the OLS residual.
# Ûᵢ = Yᵢ - Ŷᵢ
# Answer:
# Yᵢ - Ŷᵢ (actual minus fitted)


# Question 3
# A problem that asks what a POSITIVE residual means.
# Ûᵢ > 0 means:
# Yᵢ > Ŷᵢ
# Actual > fitted
# Therefore, OLS UNDER-PREDICTED Yᵢ
# Answer:
# Under-predicted Yᵢ (actual > fitted)
# Positive residual = under-predicted
# Negative residual = over-predicted

# Question 4
# A problem that asks what R² means.
# R² = the fraction of the sample variation in Y explained by X
# Answer:
# The fraction of the sample variation in Y explained by X

# Question 5
# A problem that asks how total sum of squares (SST) decomposes.
# SST = SSE + SSR
# Answer:
# SSE + SSR

# Question 6
# A problem that asks what the sum of OLS residuals is always equal to.
# Σᵢ Ûᵢ = 0
# Answer:
# 0

# Question 7
# A problem that asks what an R² close to 0 means.
# R² close to 0 means:
# The OLS line explains little of the variation in Y.
# This is common, and does NOT necessarily mean the model is bad.
# Answer:
# The OLS line explains little of the variation in Y
# -- common, and not necessarily a bad model

# Question 8
# A problem that asks about the point (X̄, Ȳ).
# The OLS regression line ALWAYS passes through (X̄, Ȳ).
# Answer:
# Always lies on the OLS regression line

# Question 9
# A problem that asks you to calculate the OLS slope β̂₁.
# Formula:
# β̂₁ = Σ(Xᵢ - X̄)(Yᵢ - Ȳ) / Σ(Xᵢ - X̄)²
# Given:
# x = (8, 8, 3)
# y = (4, 3, 4)
# In R:
x <- c(8, 8, 3)
y <- c(4, 3, 4)
# Calculate the OLS slope:
beta1 <- sum((x - mean(x)) * (y - mean(y))) / sum((x - mean(x))^2)
beta1
# Answer:
# 0.10

# Question 10
# A problem that asks you to find the OLS intercept β̂₀.
# Formula:
# β̂₀ = Ȳ - β̂₁X̄
# Given:
# x = (4, 2, 2)
# y = (7, 6, 0)
x <- c(4, 2, 2)
y <- c(7, 6, 0)
# First find β̂₁:
beta1 <- sum((x - mean(x)) * (y - mean(y))) / sum((x - mean(x))^2)
# Then find β̂₀:
beta0 <- mean(y) - beta1 * mean(x)
beta0
# Answer:
# -1.00

# Question 11
# A problem that gives x and y, asks you to fit the OLS line,
# and then predict ŷ at a specific x value.
# Given:
# x = (6, 7, 1)
# y = (4, 9, 8)
# Find ŷ when x = 3.
x <- c(6, 7, 1)
y <- c(4, 9, 8)
# Find β̂₁:
beta1 <- sum((x - mean(x)) * (y - mean(y))) / sum((x - mean(x))^2)
# Find β̂₀:
beta0 <- mean(y) - beta1 * mean(x)
# Predict ŷ when x = 3:
yhat <- beta0 + beta1 * 3
yhat
# Answer:
# 7.24

# Question 12
# A problem that gives you the fitted line and asks for ŷ.
# Given:
# ŷ = 7 + (8/10)x
# Find ŷ when x = 6.
# Plug in x = 6:
yhat <- 7 + (8/10) * 6
yhat
# Answer:
# 11.80

# Question 13
# A problem that asks you to find the residual.
# Residual formula:
# Ûᵢ = Yᵢ - Ŷᵢ
# Given:
# ŷ = 3 + (7/10)x
# x = 8
# y = 7
# First find ŷ:
yhat <- 3 + (7/10) * 8
# Then find the residual:
u_hat <- 7 - yhat
u_hat
# Answer:
# -1.60


# Question 14
# A problem that asks for the predicted change in y
# when x changes by a certain amount.
# Formula:
# Δŷ = β̂₁ Δx
# Given:
# β̂₁ = 6/10
# Δx = 6
change_y <- (6/10) * 6
change_y
# Answer:
# 3.60


# Question 15
# A problem that asks you to find SSR.
# Formula:
# SSR = Σ(Yᵢ - Ŷᵢ)²
# Given fitted line:
# ŷ = 3 + (3/10)x
# Points:
# (7, 13), (3, 3), (4, 7)
x <- c(7, 3, 4)
y <- c(13, 3, 7)
# Find the fitted values:
yhat <- 3 + (3/10) * x
# Find SSR:
SSR <- sum((y - yhat)^2)
SSR
# Answer:
# 71.06

# Question 16
# A problem that gives SST and SSR and asks you to find SSE.
# Formula:
# SST = SSR + SSE
# Rearrange:
# SSE = SST - SSR
SST <- 341
SSR <- 175
SSE <- SST - SSR
SSE
# Answer:
# 166.00


# Question 17
# A problem that gives SST and SSR and asks you to find R².
# Formula:
# SST = SSE + SSR
# Since SSE is the EXPLAINED sum of squares:
# R² = SSE / SST
SST <- 258
SSR <- 29
SSE <- SST - SSR
R2 <- SSE / SST
R2
# Answer:
# 0.89


# Question 18
# A problem that gives SSE and SST and asks you to find R².
# Formula:
# R² = SSE / SST
SSE <- 60
SST <- 315
R2 <- SSE / SST
R2
# Answer:
# 0.19


# Question 19
# A problem that asks for the fraction of variation in Y
# that is UNEXPLAINED.
# SSR = unexplained variation
# SST = total variation
# Formula:
# Unexplained fraction = SSR / SST
SST <- 373
SSR <- 147
unexplained <- SSR / SST
unexplained
# Answer:
# 0.39


# Question 20
# A problem that gives SST and R² and asks you to find SSR.
# R² = SSE / SST
# First find SSE:
# SSE = R² × SST
# Then:
# SSR = SST - SSE
SST <- 291
R2 <- 42/100
SSE <- R2 * SST
SSR <- SST - SSE
SSR
# Answer:
# 168.78