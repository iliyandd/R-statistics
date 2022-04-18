# Task 1
x = c(4, 1, 7, 9)
y = c(10, 3, 2, 11)

hist(x, prob=T)
lines(density(x))

hist(y, prob=T)
lines(density(y))

shapiro.test(x)
shapiro.test(y)

t.test(x, y, var.equal=T)


# Task 2
prop.test(x = c(351, 71), n = c(605, 195), alternative = "two.sided")


# Task 3
x = c(15, 10, 13, 7, 9, 8, 21, 9, 14, 8)
y = c(15, 14, 12, 8, 14, 10, 7, 16, 10, 15, 12)

shapiro.test(x) # p-value > 0.05 значи и Н.Р
shapiro.test(y) # p-value < 0.05 значи и не е Н.Р

t.test(x, y, paired = F, var.equal = T, alternative = "less")


# Task 4
x = c(70, 85, 63, 54, 65, 80, 75, 95, 52, 55)
y = c(72, 86, 62, 55, 63, 80, 78, 90, 53, 57)

shapiro.test(x)
shapiro.test(y)

t.test(x, y, paired = T, var.equal = T)



# Task 5
library("UsingR")

x = ewr$AA
y = ewr$NW


t.test(x, y, paired = F, var.equal = T)
