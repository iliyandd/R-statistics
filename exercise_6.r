# 4
pnorm(20, 25, 6)
qnorm(0.6, 25, 6)

# 3
library("UsingR")
ages = babies$age[babies$age < 90]


# a)
hist(ages, probability = T)
lines(density(ages))

qqnorm(ages)
qqline(ages)

# => ages are not normal distributed

# b)
ht = babies$ht[babies$ht < 99]
hist(ht, probability = T)
lines(density(ht))


qqnorm(ht)
qqline(ht)


shapiro.test(ht)
shapiro.test(ages)

# => ht are not normal distributed



# 2
x = replicate(700, sum(runif(1000, 2, 7)))
hist(x, probability = T)
lines(density(x))
