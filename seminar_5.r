dbinom(2, size=4, p=1/6)
x = dbinom(0:40, size=40, p=1/6)

names(x) = 0:40
barplot(x)

y = rbinom(200, size=13, p=1/6)
t = table(y)
pt = prop.table(t)
barplot(pt)

sum(dbinom(0:5, 10, 1/6))
pbinom(5, 10, 1/6) # Вер. да се падне по малко от 6 при 10 хвърляния 
pbinom(5, 10, 1/6, lower.tail=F) # Вер. да се падне повече от 6 при, 10 хвърляния

qbinom(0.5, 10, 1/6)



# Task 1
pbinom(4, 30, 1/6)
sum(dbinom(0:4, 30, 1/6))

x = rbinom(1200, 30, 1/6)
t = table(x)
sum(prop.table(t)[0:4])

qbinom(0.75, 30, prob=1/6, lower.tail=F)


# Task 2
# a)
dnbinom(5, size=3, prob=0.2)

# b)
pnbinom(3, size=3, prob=0.2, lower.tail=FALSE)

# c)
sum(dnbinom(2:5, size=3, prob=0.2))
# other variant
pnbinom(5, size=3, prob=0.2) - pnbinom(1, size=3, prob=0.2)



# Task 3
# a)
summary(rhyper(1000, 7, 6, 8))

t = table(rhyper(1000, 7, 6, 8))
prop.table(t)
# other way
x = rhyper(1000, 7, 6, 8)
mean(x==3)


# b)
x = dhyper(2:6, 7, 6, 8)
names(x) = 2:6
barplot(x)
braplot(prop.table(x))
