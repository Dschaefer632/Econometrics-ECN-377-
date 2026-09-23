#In the simple linear regression model Y = β₀ + β₁X + U, the 
# DEPENDENT variable is:
Y

#In Y = β₀ + β₁X + U, the error term U represents:
Factors OTHER than X that affect Y

#In Y = β₀ + β₁X + U, the slope β₁ measures:
The ceteris paribus effect of X on Y

#The zero conditional mean assumption E[U | X] = 0 says:
The average of U does not depend on X

#Under the SLR model with E[U | X] = 0, the conditional mean E[Y | X = x] equals:
β₀ + β₁x

#The OLS slope estimate β̂₁ can be written as:
cov(x,y) / var(x)

#We must ESTIMATE β₀, β₁ (rather than compute them exactly) because:
They are population quantities; we observe only a sample

#In Y = (β₀ + β₁X) + U, the term β₀ + β₁X is:
The part of Y EXPLAINED by X (its conditional mean)

#The OLS slope is β̂₁ = cov(x,y) / var(x)just divide the two
Given cov(x,y) = 12 and var(x) = 2, find β̂₁ (round to the hundredths
Covxy = 12
varx = 2
Covxy/varx

#The OLS intercept is β̂₀ = ȳ − β̂₁x̄. Given ȳ = 3, x̄ = 10, and slope β̂₁ = 3/10, find β̂₀. (round to the hundr
#0
y_bar <- 3
x_bar <- 10
beta1_hat <- 3/10
beta0_hat <- y_bar - beta1_hat*x_bar
beta0_hat

#For the sample x = (2,1,5), y = (2,5,7), find the OLS slope
#β̂₁ = Σ(xᵢ − x̄)(yᵢ − ȳ) / Σ(xᵢ − x̄)²
# Answer: 0.77
x <- c(2,1,5)
y <- c(2,5,7)
beta1_hat <- cov(x,y)/var(x)
beta1_hat

#For that same sample x = (6,8,6), y = (9,11,10), find the OLS intercept
#β̂₀ = ȳ − β̂₁
x <- c(6,8,6)
y <- c(9,11,10)
beta1_hat <- cov(x,y)/var(x)
beta0_hat <- mean(y) - beta1_hat*mean(x)
beta0_hat

# A fitted regression line is ŷ = β̂₀ + β̂₁x.
# With β̂₀ = 5 and β̂₁ = 7/10, find the predicted ŷ at x = 2.
# Answer: 6.40

beta0_hat <- 5
beta1_hat <- 7/10
x <- 2
y_hat <- beta0_hat + beta1_hat*x
y_hat

# For the sample x = (6,8,6), y = (2,0,5), fit the OLS line
# and predict ŷ at x = 7. (round to the hundredths)
# Answer: 1.75
x <- c(6,8,6)
y <- c(2,0,5)
model <- lm(y ~ x)
predict(model, newdata = data.frame(x = 7))

# E[colGPA | hsGPA] = 17/10 + (6/10)*hsGPA
# Find the expected colGPA at hsGPA = 37/10.
# Answer: 3.92
beta0 <- 17/10
beta1 <- 6/10
hsGPA <- 37/10
expected_colGPA <- beta0 + beta1*hsGPA
expected_colGPA

# In wage = β₀ + β₁educ + U the estimated slope is β̂₁ = 5/10.
# Ceteris paribus, if educ rises by 6 year(s), by how much does predicted wage change?
# (round to the hundredths)
# Answer: 3.00
beta1_hat <- 5/10
change_in_educ <- 6
change_in_wage <- beta1_hat*change_in_educ
change_in_wage

# X and Y have the joint probability distribution below.
# x    y    P(X=x,Y=y)
# 2    8       0.2
# 6    7       0.3
# 5    7       0.5
# Find E[X]. (round to the hundredths)
# Answer: 4.30
x <- c(2,6,5)
p <- c(0.2,0.3,0.5)
expected_x <- sum(x*p)
expected_x

# X and Y have the joint probability distribution below.
# x = (5,4,3), y = (5,1,2)
# P = (0.2,0.3,0.5)
# Find Cov(X,Y) = E[XY] − E[X]E[Y]
# Answer: 1.13
x <- c(5,4,3)
y <- c(5,1,2)
p <- c(0.2,0.3,0.5)
EX <- sum(x*p)
EY <- sum(y*p)
EXY <- sum(x*y*p)
cov_xy <- EXY - EX*EY
cov_xy

# x = (4,3,6), y = (3,6,6)
# P = (0.2,0.3,0.5)
# β₁ = Cov(X,Y) / Var(X)
# Answer: 0.23
x <- c(4,3,6)
y <- c(3,6,6)
p <- c(0.2,0.3,0.5)
EX <- sum(x*p)
EY <- sum(y*p)
EXY <- sum(x*y*p)
cov_xy <- EXY - EX*EY
EX2 <- sum(x^2*p)
var_x <- EX2 - EX^2
beta1 <- cov_xy/var_x
beta1


# Review (sample). For x = (2,0,6), y = (1,6,6), find the SAMPLE covariance
# Sxy = 1/(n−1) Σ(xi − x̄)(yi − ȳ). (round to the hundredths)
# Answer: 1.67
x <- c(2,0,6)
y <- c(1,6,6)
Sxy <- cov(x,y)
Sxy


