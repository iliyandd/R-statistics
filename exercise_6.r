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


###########################################
## Непрекъснати случайни Величини в R

### Задача 1

# смес от разпределения
# Матрица с две колони - нормалните разпределения
N = 2000
m <- cbind(rnorm(N, 2, sqrt(2)), rnorm(N, 25, sqrt(2)))

# Генериране на матрица с индекси, с вероятност 0.2 теглиме с индекс 1
# С вероятност 0.8 теглиме с индекс 2
idx <- sample(1:2, size = N, replace = TRUE, prob = c(0.2, 0.8))
id <- cbind(1:N, idx)

# рисуване на плътност на смес от разпределения
hist(m[id], probability = TRUE, breaks = 20)
lines(density(m[id]))

distr = list(
  "normal" = rnorm(N, 5, sqrt(2)),
  "exp" = rexp(N, 5),
  "uniform" = runif(N, 1, 5),
  "gamma" = rgamma(N, 5, 1),
  "mixture" = m[id]
)

# рисуване на нормално разпределените данни
hist(distr$normal, probability = T)
lines(density(distr$normal), col = "red")

# рисуване на нормално експ. данни
hist(distr$exp, probability = T)
lines(density(distr$exp), col = "red")

# равномерно - хистограма
hist(distr$uniform, probability = T)
lines(density(distr$uniform), col = "red")

# хистограма на гама
hist(distr$gamma, probability = T)
lines(density(distr$gamma), col = "red")

# хистограма на сместа
hist(distr$mixture, probability = T)
lines(density(distr$mixture), col = "red")

# Задача 2
# x_1, ..., x_n ~ Exp(lambda)

# x_1 ~ X_1 ~ Exp(lambda)
# x_2 ~ X_2 ~ Exp(lambda)
# .....................
# x_n ~ X_n ~ Exp(lambda)

# Нека n = 1000
# имаме 1000 наблюдения от 1000 случайни величини които са еднакво разпределени
# и не зависят една от друга
# Това е същото като да имаме 1000 наблюдения от една случайна величина
x1 = sum(rexp(1000, 1/3))
x2 = sum(rexp(1000, 1/3))

# х1 е различно от х2
# ∑Xi/n е също случайна величина понеже е сума на случайни елементи
# Поради това, също си има разпределение
# Как е разпределена ∑Xi/n

n = 20000
# повтаряме сумирането n на брой пъти така че да имаме достатъчно елементи
# за да разгледаме разпределението на ∑Xi/n
many_means_of_xs = replicate(n, mean(rexp(1000, 1/3)))

# рисуване на хистограма на ∑Xi/n и линии на плътността
hist(many_means_of_xs, breaks = 60, probability = TRUE)
lines(density(many_means_of_xs), col = "red")

# Задача 3 - Разпознаване на нормално
library("UsingR")
# help
?babies

# age
# - mother's age in years at termination of pregnancy, 99=unknown
# махаме 99
mother_ages = babies$age[babies$age != 99]

# Хистограма
hist(mother_ages, probability = TRUE)
lines(density(mother_ages), col = "red")
# Виждаме тежка дясна опашка. Не прилича на нормално
# Нормално разпределените данни би трябвало да са симетрични и да не са с тежки опашки

boxplot(mother_ages)
# Липсва симетрия

qqnorm(mother_ages)
qqline(mother_ages)
# тежка опашка

# тестване на хипотеза
shapiro.test(mother_ages)

# p-value < 2.2e-16 < 0.05 => отхвъляме предположението,
# че данните идват от нормално разпределение

# ръстове на майките
mother_heights = babies$ht[babies$ht != 99]

# махаме тази която е висока 134
mother_heights = mother_heights[-which.min(mother_heights)]

# Хистограма
hist(mother_heights, probability = TRUE)
lines(density(mother_heights), col = "red")
# Засега изглежда като нормално

boxplot(mother_heights)
# симетрични са

# qqnorm plot
qqnorm(mother_heights)
qqline(mother_heights)
# тежка опашка

shapiro.test(mother_heights)
# отново отхвърляме нормалността => данните не са нормално разпределени

### Задача 4

# пъпешите ~ N(25, 36)

# < 20cm са трето качество
# останалите са две равни по брой групи, като по-големите са първо качество, а по-малките второ
# Каква част от пъпешите са трето качество
# Колко голям трябва да е пъпеш за да е първо качество

# каква пропорция от пъпешите са < 20? P(X<20) = ?
pnorm(20, 25, 6)
# Останалите 80% ги делим на две групи. Това означава, че от 60% се разделят останалите
# така че да има и 20% за трета група

# Колко трябва да е голям един пъпеш за да е първо качество?
# Тоест, колко трябва да е голям един пъпеш, така че 60% от наблюденията да са под него?
# P(X <= ?) = 0.60
qnorm(0.6, 25, 6)
# Ако е по-голям от 26.5 значи е първо качество

