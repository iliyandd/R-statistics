library("UsingR")


plot(survey$Height)
hist(survey$Height) # хистограма

# възможността дадена стойност да попадне в определен интервал
hist(survey$Heigh, probability = TRUE, breaks = 200)

x = rnorm(10000) 
hist(x, probability = TRUE, breaks = 200) # breaks е броят на интервалите

# плътностна функция, която апроксимира плътността
lines(density(x), col = "red")

hist(survey$Height, probability = TRUE, breaks = 20)
lines(density(survey$Height, na.rm = T), col = "red")

boxplot(survey$Height) # дава информация за квартилите

plot(homedata)

# корелацията ни дава информация каква е зависимостта между някакви стойности
# т.е колко расте едното, като расте и другото, обратно и т.н.
# тя може да бъде в [-1, 1]
# корелацията е 1 или близо до 1, когато расте едната стойност, така да расте и другата
# корелацията е -1 или близо до -1, когато расте едната стойност, така другата намаля
# корелацията е 0, когато и двете променливи не са колерирани
cor(homedata$y1970, homedata$y2000)


# разделяне на екран при изобразяване на графики
split.screen(c(2, 1))
screen(1)
plot(homedata)

screen(2)
x = rnorm(1000)
plot(x)


# Task 2
split.screen(c(1, 2))
screen(1)
# boxplot(survey$Height[survey$Sex == 'Male'])
# plot(survey$Height[survey$Sex == 'Male'])
males_heights = survey$Height[survey$Sex == "Male"]
hist(survey$Height[survey$Sex == "Male"], probability = TRUE)
lines(density(males_heights, na.rm = T), col = "blue")

screen(2)
# boxplot(survey$Height[survey$Sex == 'Female'])
# plot(survey$Height[survey$Sex == 'Female'])
females_heights = survey$Height[survey$Sex == "Female"]
hist(survey$Height[survey$Sex == "Female"], probability = TRUE)
lines(density(females_heights, na.rm = T), col = "red")


# Task 3
hist(survey$Pulse, probability = TRUE)
lines(density(survey$Pulse, na.rm = T), col = "green")


# Task 4
hist(homedata$y1970, probability = TRUE)
lines(density(homedata$y1970, na.rm = T), col = "red")

hist(homedata$y2000, probability = TRUE)
lines(density(homedata$y2000, na.rm = T), col = "blue")

plot(homedata)
cor(homedata$y1970, homedata$y2000)


# Task 5
# to solve...






      