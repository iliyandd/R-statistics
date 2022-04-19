library("UsingR")


# Задача 1
# ...


# Задача 2
# 2.1
mtcars[1:5, ]

# 2.2
rownames(mtcars)[which.max(mtcars$hp)]
rownames(mtcars[order(mtcars$wt), ])[1:5]

# 2.3
# тук не съм сигурен дали това се иска
boxplot(mtcars$mpg, mtcars$cyl)

# 2.4
plot(mtcars$hp, mtcars$mpg)
cor(mtcars$hp, mtcars$mpg)

# 2.5
quantile(mtcars$hp, 0.80)

# 2.6
sum(mtcars$hp < 100) / length(mtcars$hp) * 100

# 2.7
t = table(mtcars$cyl, mtcars$gear)
t["8", "5"] / sum(t[, "5"])


# Задача 3
# ...
