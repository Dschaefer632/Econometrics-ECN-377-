############################################################
# EXPECTED VALUE / VARIANCE / COVARIANCE / CORRELATION
# CHEAT SHEET — Q8–22
############################################################


# ==========================================================
# 1. EXPECTED VALUE OF A CONSTANT
# ==========================================================
# If the problem says:
# "For any constant C, find E[C]"

# Just use:
E[C] = C

# Example:
# C = 5
# E[C] = 5


# ==========================================================
# 2. INDEPENDENT X AND Y -> COVARIANCE
# ==========================================================
# If the problem says:
# "X and Y are independent. Find Cov(X,Y)"

# Independent means:
Cov(X,Y) = 0

# Answer = 0


# ==========================================================
# 3. CORRELATION RANGE
# ==========================================================
# Correlation ALWAYS falls between -1 and 1:

-1 <= Cor(X,Y) <= 1

# Remember:
# +1 = perfect positive correlation
#  0 = no linear correlation
# -1 = perfect negative correlation


# ==========================================================
# 4. CONDITIONAL EXPECTATION
# ==========================================================
# If the problem asks:
# E[Y | X=x]

# This means:
# "Find the average Y when X equals x."

# STEP 1: Find ONLY the Y values where X = x
# STEP 2: Add those Y values
# STEP 3: Divide by the number of observations

# Example:
# Y values = 1, 0, 7, 3

mean(c(1,0,7,3))

# Answer = 2.75


# ==========================================================
# 5. LINEARITY OF EXPECTATION: E[aX + b]
# ==========================================================
# If you see:
# E[aX + b]

# Use:
E[aX + b] = aE[X] + b

# STEP 1: Multiply a × E[X]
# STEP 2: Add b

# Example:
# E[X] = 7, a = 4, b = 4

4 * 7 + 4

# Answer = 32


# ==========================================================
# 6. LINEARITY OF EXPECTATION: E[aX + bY]
# ==========================================================
# If you see:
# E[aX + bY]

# Use:
E[aX + bY] = aE[X] + bE[Y]

# STEP 1: Multiply a × E[X]
# STEP 2: Multiply b × E[Y]
# STEP 3: Add them

# Example:
# E[X] = 7
# E[Y] = 3
# a = 2
# b = 3

2 * 7 + 3 * 3

# Answer = 23


# ==========================================================
# 7. LINEARITY OF EXPECTATION WITH A CONSTANT
# ==========================================================
# If you see:
# E[aX + bY - c]

# Use:
E[aX + bY - c] = aE[X] + bE[Y] - c

# STEP 1: a × E[X]
# STEP 2: b × E[Y]
# STEP 3: subtract c

# Example:
# E[X] = 8
# E[Y] = 3
# a = 1
# b = 5
# c = 3

1 * 8 + 5 * 3 - 3

# Answer = 20


# ==========================================================
# 8. VARIANCE USING E[X] AND E[X²]
# ==========================================================
# If they give you:
# E[X]
# E[X²]
#
# Use:

Var(X) = E[X²] - [E[X]]²

# STEP 1: Take E[X²]
# STEP 2: Subtract E[X] squared

# Example:
# E[X] = 2
# E[X²] = 54

54 - 2^2

# Answer = 50


# ==========================================================
# 9. VARIANCE OF aX + b
# ==========================================================
# If you see:
# Var(aX + b)

# Use:

Var(aX + b) = a²Var(X)

# IMPORTANT:
# The constant b DOES NOT matter for variance.
#
# STEP 1: Square a
# STEP 2: Multiply by Var(X)

# Example:
# Var(X) = 6
# a = 2

2^2 * 6

# Answer = 24


# ==========================================================
# 10. STANDARD DEVIATION
# ==========================================================
# If they give you variance and ask for standard deviation:

sd(X) = sqrt(Var(X))

# STEP 1: Take the square root of variance

# Example:
# Var(X) = 4

sqrt(4)

# Answer = 2


# ==========================================================
# 11. VARIANCE OF X + Y WHEN INDEPENDENT
# ==========================================================
# If they say:
# X and Y are independent
#
# Use:

Var(X + Y) = Var(X) + Var(Y)

# STEP 1: Add the two variances

# Example:
# Var(X) = 6
# Var(Y) = 3

6 + 3

# Answer = 9


# ==========================================================
# 12. COVARIANCE
# ==========================================================
# If they give you:
# E[XY]
# E[X]
# E[Y]
#
# Use:

Cov(X,Y) = E[XY] - E[X]E[Y]

# STEP 1: Multiply E[X] × E[Y]
# STEP 2: Subtract that from E[XY]

# Example:
# E[XY] = 26
# E[X] = 3
# E[Y] = 1

26 - 3 * 1

# Answer = 23


# ==========================================================
# 13. COVARIANCE FROM PAIRED VALUES
# ==========================================================
# If they give you pairs like:
# (X,Y) = (3,0), (1,2), (0,1)
#
# Each pair is equally likely:
# probability = 1/3
#
# You need:
# Cov(X,Y) = E[XY] - E[X]E[Y]

# STEP 1: Find XY for each pair
# (3)(0) = 0
# (1)(2) = 2
# (0)(1) = 0

# STEP 2: Find E[XY]
mean(c(0,2,0))

# E[XY] = 0.6667

# STEP 3: Find E[X]
mean(c(3,1,0))

# E[X] = 1.3333

# STEP 4: Find E[Y]
mean(c(0,2,1))

# E[Y] = 1

# STEP 5: Use covariance formula

mean(c(0,2,0)) - mean(c(3,1,0)) * mean(c(0,2,1))

# Answer = -0.6667
# Rounded = -0.67


# ==========================================================
# 14. COVARIANCE WITH CONSTANTS
# ==========================================================
# If you see:
# Cov(a1X + b1, a2Y + b2)

# Use:

Cov(a1X + b1, a2Y + b2) = a1*a2*Cov(X,Y)

# IMPORTANT:
# b1 and b2 DO NOT MATTER.
#
# STEP 1: Multiply a1 × a2
# STEP 2: Multiply by Cov(X,Y)

# Example:
# Cov(X,Y) = 4
# a1 = 5
# a2 = 4

5 * 4 * 4

# Answer = 80


# ==========================================================
# 15. CORRELATION
# ==========================================================
# If they give you:
# Cov(X,Y)
# sd(X)
# sd(Y)
#
# Use:

Cor(X,Y) = Cov(X,Y) / (sd(X)*sd(Y))

# STEP 1: Multiply the two standard deviations
# STEP 2: Divide covariance by that number

# Example:
# Cov(X,Y) = 3
# sd(X) = 3
# sd(Y) = 3

3 / (3 * 3)

# Answer = 0.33


# ==========================================================
# 16. VARIANCE OF aX + bY
# ==========================================================
# If you see:
# Var(aX + bY)

# Use:

Var(aX + bY) =
  a²Var(X) + b²Var(Y) + 2abCov(X,Y)

# STEP 1: Calculate a²Var(X)
# STEP 2: Calculate b²Var(Y)
# STEP 3: Calculate 2abCov(X,Y)
# STEP 4: ADD all three

# Example:
# Var(X) = 5
# Var(Y) = 3
# Cov(X,Y) = -1
# a = 3
# b = 2

3^2 * 5 + 2^2 * 3 + 2*3*2*(-1)

# Answer = 45


# ==========================================================
# 17. CONDITIONAL EXPECTATION FROM RAW Y VALUES
# ==========================================================
# If they say:
# "Among observations with X=x, the Y values are..."
#
# E[Y | X=x] = average of those Y values

# Example:
# Y = 1, 0, 7, 3

mean(c(1,0,7,3))

# Answer = 2.75


# ==========================================================
# 18. CONDITIONAL EXPECTATION WITH PROBABILITIES
# ==========================================================
# If they give Y values AND probabilities:
#
# Y = 8, 9, 9
# P = 0.2, 0.3, 0.5
#
# Use:

E[Y | X=x] = Σ(Y × probability)

# STEP 1: Multiply each Y by its probability
# STEP 2: Add the results

8 * 0.2 + 9 * 0.3 + 9 * 0.5

# Answer = 8.8


# ==========================================================
# 19. CONDITIONAL EXPECTATION IS LINEAR
# ==========================================================
# If you see:
# E[aY + b | X=x]
#
# Use:

E[aY + b | X=x] =
  aE[Y | X=x] + b

# STEP 1: Multiply a × E[Y|X=x]
# STEP 2: Add b

# Example:
# E[Y|X=x] = 2
# a = 2
# b = 9

2 * 2 + 9

# Answer = 13