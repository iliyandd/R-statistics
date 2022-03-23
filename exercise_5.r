# Симулация на 10 тегления на числата от 8 до 10 с връщане
# при вероятност сътветно (0.2, 0.3, 0.5)
sample(8:10, size=10, replace=T, prob=c(0.2, 0.3, 0.5))

# Биномното разпределение на 4 обекта,
# ако шанса за успех е 1/6
y = dbinom(0:4, size=4, p=1/6)
names(y) = 0:4
barplot(y)

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


# Връща по-малко от кое число е шанса да се падне при хвърляне
# на 10 зара при вер 0.5. Все едно обратното на pbinom
qbinom(0.5, 10, 1/6)



# Task 1
pbinom(4, 30, 1/6)
sum(dbinom(0:4, 30, 1/6)) # еквивалентен вариант

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

x = rhyper(1000, 7, 6, 8)
mean(x==3)

# b)
x = dhyper(2:6, 7, 6, 8)
names(x) = 2:6
barplot(x)
barplot(prop.table(x))


# Task 4(to do)
# ...
