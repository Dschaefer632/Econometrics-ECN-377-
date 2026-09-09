#The SAMPLE variance divides the sum of squared deviations from the mean by: n-1
#Which R command computes the SAMPLE variance of a numeric vector x? var(x)
#Which R command computes the correlation between numeric vectors x and y? cor(x, y) 
#The correlation between two variables is always: between -1 and 1
#For a discrete random variable X the expected value E[X] equals The sum of each value times its probability 
#For a discrete random variable X E[X^2] equals The sum of each SQUARED value times its probability 
#True or False: in R, sd(x) gives the SAMPLE standard deviation TRUE
#Sample Mean:
#x <- c(9, 9, 1)
#mean(x)
#Sample Variance 
#x <- c(9, 9, 1)
#var(x)
#SD
#x <- c(9, 9, 1)
#sd(x)
#Covariance 
#x <- c(1, 0, 2)
#y <- c(1, 0, 5)
#cov(x, y)
#Correlation
#x <- c(6, 1, 1)
#y <- c(2, 7, 5)
#cor(x, y)
#Probability Questions
#x <- c(2, 0)
#p <- c(0.5, 0.5)
#sum(x * p)
#If the E[X^2]
#x <- c(2, 0)
#p <- c(0.5, 0.5)
#sum(x^2 * p)

#Sample Variance 
x <- c(0, 3, 0)
var(x)
#SD
x <- c(1, 1, 0)
sd(x)
#Covariance 
x <- c(6, 6, 4)
y <- c(2, 3, 3)
cov(x, y)
#Correlation
x <- c(5, 7, 5)
y <- c(3, 8, 4)
cor(x, y)
#Probability Questions
x <- c(8, 7)
p <- c(0.5, 0.5)
sum(x * p)
#If the E[X^2]
x <- c(1, 6, 3)
p <- c(.2, .5, .3)
sum(x^2 * p)

4*(9/10)
0*((10-9)/10)
1^2*.2
6^2*.5
3^2*.3
.2+3+.9
.2+18+2.7
