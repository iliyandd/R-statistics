# Практикум R - Дискретни Случайни величини ######

library(tidyverse)

### Предварителни познания

# Симулиране на Бернулиева Случайна Величина
c(1, 0) %>%
  sample(prob = c(0.3, 0.7), size = 100, replace = TRUE) %>%
  table() %>%
  prop.table() %>%
  barplot()

# Можем да симулираме каквито искаме дискретни случайни величини
c(4, 5, 6, 13, 14) %>%
  # в prob задаваме плътността
  sample(prob = c(0.2, 0.1, 0.1, 0.1, 0.5), size = 1000, replace = TRUE) %>%
  table() %>%
  prop.table() %>%
  barplot()
# задаваме с аргумента prob във функцията sample

# симулация и емперични вероятности
rbinom(n = 1000, size = 6, prob = 0.7) %>%
  # с table броим бройката която се пада на успехи
  table() %>%
  # бройката на успехи обръщаме в пропорции
  prop.table() %>%
  # рисуваме барплот
  barplot()

# Теоретични вероятности (функция на плътността\тежестта)
probs <- dbinom(x = 0:6, size = 6, prob = 1 / 6)
names(probs) <- 0:6
barplot(probs)

# кумулативна плътностна функция P(X <= k) = сума до к на P(X=k)
cumprobs <- dbinom(x = 0:6, size = 6, prob = 1 / 6) %>%
  cumsum()
# Задаваме имена на вероятностите с цел да се визулизира при barplot
names(cumprobs) <- 0:6
barplot(cumprobs)

# по-често се използва така
probs = pbinom(q = 0:6, size = 6, prob = 1 /6)
# Задаваме имена на вероятностите с цел да се визулизира при barplot
names(probs) <- 0:6
barplot(probs)

# обратната функция на pbinom е qbinom - квантили
# P(X < ?) = р. Koe e това число така че с вероятност р сме под него
qbinom(p = 0.8, size = 6, prob = 1 / 6, lower.tail = FALSE)

# Тя ни казва: За с вероятност 0.8 стойностите са по-малки или равни от колко?

# използвайки qbinom можем да генерираме квантилите
qbinom(p = seq(0, 1, by = 0.25), size = 6, prob = 1 / 6) %>%
  barplot()

# Но това е само едно разпределение. Има ли подобни функции за другите разпределения
# Геометрично разпределение
rgeom(n = 1000, prob = 0.5) # Генериране на геометрично разпределена сл. величина
dgeom(x = 2, prob = 1 / 2)  # P(X = 2)
pgeom(q = 2, prob = 1 / 2) # P(X <= 2)
qgeom(p = 1/2, prob = 1 / 2) # P(X <= ?)= 1/2

# Поасоново разпределени случайни величини
rpois(100, 1/2)
dpois(0:3, 1/2) # Вероятностите Поасоново разпределена сл. величина да е 0, 1, 2 и 3
ppois(3, 1/2) # P(X <= 3)
qpois(0.4, 1/2) # P(X <= ?) = 0.4

#### Задача 1 - Хвърляне на Зар ####
# 1000 пъти искаме да хвърлим по 30 зара и да видим колко от тези 30 зара са шестици във всеки от 
# хилядатте опита
# Коя функция ще ползваме за симулацията?

n_of_sixes <- rbinom(n = 1000, size = 30, prob = 1 / 6)

# Как ще намерим емпиричната вероятност да се паднат по-малко от 5 шестици?
mean(n_of_sixes < 5)

# Koя функция ще ползваме за да намерим теоретичната вероятност да се паднат
# по-малко от 5 шестици?
pbinom(q = 4, size = 30, prob = 1/6)

# друг вариант е да сумираме плътностите
sum(dbinom(x = 0:4, size = 30, prob = 1 / 6))

# С вероятност 0.75 сме над тази стойност. Това означава, че 0.25 от стойностите са под тази стойност
qbinom(p = 0.25, size = 30, prob = 1/6)

# Но може и така (lower.tail = FALSE)
# как да видим поне колко шестици ще се паднат с верояност 0.75
qbinom(p = 0.75, size = 30, prob = 1/6, lower.tail = FALSE)

# pbinom(3, size = 30, prob = 1/6, lower.tail=FALSE)

###### Задача 2 - Стрелец ####

# Стрелец уцелва с вероятност 0.2. За да спечели, трябва да направи 3 точни
# Каква е вероятността за това да са му необходими ... изстрела?
# Какво разпределение ни е нужно? - Отрицателно Биномно!

# а) точно 8 изстрела
# Имаме 5 неуспеха докато се случат 3 успеха
dnbinom(x = 5, size = 3, prob = 0.2)

# б) повече от 6 изстрела
# над определени стойности? pnbinom но с lower.tail = FALSE
pnbinom(q = 3, size = 3, prob = 0.2, lower.tail = FALSE)

# може и с dnbinom до някакво голямо число защото може и до безкрайност да е карък
sum(dnbinom(x = 4:10000, size = 3, prob = 0.2))

# в) Между 5 и 8 изстрела P(2 <= X <= 5) = ∑Р(Х=к) за к = 2..5
sum(dnbinom(x = 2:5 , size = 3, prob = 0.2))

# Може и така
pnbinom(5, 3, 0.2) - pnbinom(1, 3, 0.2)

#### Задача 3 - Теглене на топки от кутия ####
# В урна има 7 бели и 6 черни топки. Направете N симулации и пресметнете
# границите от които се мени Х, ЕХ и D(Х) където Х е броят на белите
# Какво разпределение ни трябва? - hyper geometric (hyper)
N <- 100000

# За симулация - rhyper
xsim <- rhyper(nn = N, m = 7, n = 6, k = 8)
# в какъв диапазон варират стойностите
c(min(xsim), max(xsim))

# Средно
mean(xsim)

# Обобщение - Средно, мин, макс, медиана, квантили
summary(xsim)

# Емпирична дисперсия
var(xsim)

# Емпирично стандартно отклонение
sd(xsim) # корен от дисперсията


# Емпирична вероятност за 3 бели топки
mean(xsim == 3)

# теоретичните вероятности?
# Коя функция ни трябва? - dhyper за стойности от 0 до 8

# с dhyper гледаме теоретичните вероятности за между 2 и 6
theoretical_probabilities <- dhyper(x = 2:7, m = 7, n = 6, k = 8)

# закачане на имена с цел да можем да рисуваме барплот
names(theoretical_probabilities) <- 2:7

# рисуваме barplot
barplot(theoretical_probabilities)

# Каква е формулата за теоретично средно (мат. очакване)?
# ЕХ = ∑х•p(x)
theoretical_mean <- sum(0:8 * theoretical_probabilities)

# Каква е формулата за теоретична дисперсия? Е[(Х - ЕХ)^2] = ∑[p(x)•(x - EX)^2]
sum(theoretical_probabilities * (0:8 - theoretical_mean)^2)

# таблица на емпиричните вероятности
emperical_probabilities <- xsim %>%
  # броим честотата на срещане
  table() %>%
  # обръщаме в пропорции
  prop.table()

# Теоретични и емпирични вероятности в една матрица с два реда
all_probabilities <- rbind(emperical_probabilities, theoretical_probabilities)

# Рисуване на барплот с една до друга емпиричните и теоретичните вероятности
barplot(all_probabilities, beside = TRUE, legend = c("emperical", "theoretical"))