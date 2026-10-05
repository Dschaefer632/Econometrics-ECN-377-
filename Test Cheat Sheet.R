#----------------------Master Code For Econometrics Exam----------------------------------------------

#Quiz 1 Notes-------------------
#Econometrics combines data, economics and Statistics
#In economics, "ceteris paribus" means: Holding all other factors fixed
#Confounding variable: Variable that is not included in the data set but effects the data
#Correlation does not equal causation
#Types of data------------
#Cross-section: many units, one point in time. Example: 300 students' heights measured today.
#Time series: one unit, many points in time. Example: U.S. unemployment rate every month for 20 years.
#Panel: many units, each followed over time. Example: the same 500 workers' wages every year from 2010 to 2020.
#we use the sample we have in order to learn about the larger population we care about
#The whole group we care about, but usually cannot fully observe, is called the Population
#adding up numbers 
x = c(2,2,8,4)
sum(x)
#mean
x = c(2,2,8,4)
mean(x)
#R command gives a quick snapshot (minimum, mean, maximum, and so on)
Summary()
#Quiz 2 notes---------------------
#for y=B0+B1(x1)+B2(x2) B1 is The effect of x1 on y holding x2 fixed
#Percentage point change and percent change
old <- 4
new <- 6
new - old                    # percentage point change: 1
(new - old) / old * 100      # percent change: 20
#in y= B0 +B1x B0 does not effect the change in y
#sample variance
x =c(6,2,6)
var(x)
sd(x)
#Covarariance
x = c(3,1,3)
y = c(3,2,2)
cov(x,y)
#Quiz 3 notes -----------------
#The sample variance divides the sum of squared deviations from the mean by n-1
#The correlation between two variables is always between -1 and 1
#For a discrete random variable X E[X^2] equals The sum of each SQUARED value times its probability 
#Sample variance 
x = c(1,1,0)
var(x)
sd(x)
#sample correlation
x = c(5,7,5)
y = c(3,8,4)
cor(x,y)
#Probability problems E[x]
x = c(8, 7)
p = c(.5, .5)
sum(x*p)
#Probability problems E[x^2]
x = c(1,6,3)
p = c(.2,.5,.3)
sum(x^2*p)
#Quiz 4 Notes------------------
#The variance of a random variable X equals E[x^2]- E[X]^2
#E[YI X=x] The average of Y among observations with X=x
#Variance=E(X^2)−[E(X)]^2
EX <- 5
EX2 <- 70
variance <- EX2 - EX^2
variance
#Variance= Var(aX+b)=a2Var(X)
var_x <- 2
a <- 2
a^2 * var_x
#Cov(X,Y)=E[XY]−E[X]E[Y]
EXY <- 16
EX <- 4
EY <- 1
EXY - EX * EY
#covariance 
x <- c(3,1,3)
y <- c(3,2,2)
cov <- mean(x*y) - mean(x)*mean(y)
round(cov, 2)
#COR = COV ÷ (SDx × SDy)
cov <- 0
sd_x <- 3
sd_y <- 2
cov / (sd_x * sd_y)
#given variance and a and b what is Var(aX+bY)
a = 1
X = 6
b = 1
Y = 2
(a*X)+ (b*Y)
#expected values
Y =c(1,4,8)
P = c(.2,.3,.5)
sum(Y*P)
#Quiz 5 notes----------------
#B1 is The ceteris paribus effect of X on Y (the change in Y per one-unit rise in X, holding other factors fixed)
# The zero conditional mean assumption says The average error does not depend on X / is zero given X.
# OLS Slope  = Cov(X,Y) ÷ Var(X)
x = c()
y = c()
cov= cov(x,y)
var= var(x)
cov/var
#(only if given cov and var)
cov= -3
var= 9
cov/var  #answer
#OLS Intercept
ybar <- 4
xbar <- 9
slope <- 2/10
ybar - slope*xbar
#OLS Line
x = c(2, 2, 5)
y = c(1, 1, 4)
OLSLINE = lm(y ~ x)
predict(OLSLINE, data.frame(x = 8))
#Change in Y=slope×change in X "by how much does predicted wage change"
beta1 <- 7/10
change_x <- 6
change_y <- beta1 * change_x
round(change_y, 2)
#Expected value (The chart with x, y and P(X=x) (Y=y))
x = c(4, 5, 6)
p = c(.2, .3, .5)
EX = sum(x * p)
round(EX, 2)
#covariance with the chart
x = c(5, 4, 0)
y = c(1, 8, 5)
p = c(.2, .3, .5)
EX = sum(x * p)
EY = sum(y * p)
EXY = sum(x * y * p)
cov = EXY - EX * EY
cov
#Quiz 6 Notes--------------
#a negative residual means OLS Over predicted Y1
#a postive residual means OLS under predicted Y1
#SST = SSE + SSR
#the sum of the OLS Residuals is always 0
#OLS Intercept 
x = c(5,3,4)
y = c(1,10,12)
model <- lm(y ~ x)
coef(model)[1]
#OLS Residual 
y = 5
y_hat = 1 +(8/10)*8
residual <- y - y_hat
residual
#predicted change
b1= 8/10
change= 4
b1*change
#Find the SSR
x = c(4, 7, 3)
y = c(9, 14, 6)
y_hat = (5/10) * x
SSR = sum((y - y_hat)^2)
round(SSR, 2)
#SSE = SST - SSR
SST = 342
SSR = 164
SSE = SST - SSR
SSE