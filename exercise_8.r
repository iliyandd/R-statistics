f = function(n, real_mean){
  hyp_mean = 7
  x = rnorm(n, real_mean, 2)
  (mean(x) - hyp_mean) / (2 / sqrt(10)) 
}

y = replicate(3000, f(10, 7))
hist(y, probability = T)
lines(density(y))


# Task 1
f = function(n){
  x = rnorm(n, 2, 2)
  # допускаме че mu = 5, но то е = на 2 => p-value < 0.05
  t.test(x, mu=5, alternative = "two.sided")
}

# a)
f(10)
f(30)
f(100)


# Task 2
library("UsingR")

t.test(vacation, mu=24, alterantive="two.sided")



# Task 3
# a)
pval = prop.test(42, 100, alternative = "two.sided")
# pval < 0.5, така че отхвърляме нулевата хипотеза и значи компанията лъже

# b)
pval = prop.test(42, 100, alternative = "less")


# Task 4
talks = c(12.8, 3.5, 2.9, 9.4, 8.7, 0.7, 0.2, 2.8, 1.9, 2.8, 3.1, 15.8)
# Нулевата хип. е че говортя средно 5мин по телефона
# length(talks) < 30 => тестваме дали идва от нормално разпределение

hist(talks, probability = T)
lines(density(talks))




