library("UsingR")

# Задача 1
f = function(n, x) {
  sum((x^(1:n) * (1:n)^n) / (x^n + n^2))
}

f(20, 0.01)


# Задача 2
# a)
plot(mtcars$gear, mtcars$cyl)

# b)
prop.table(table(mtcars$carb, mtcars$cyl))[1, 2] / prop.table(table(mtcars$carb))[1]

# c)
mean(mtcars$wt[order(mtcars$mpg, decreasing=T)[1:6]])


# Задача 3
# a)
x = c(11, 7, 14)
probs = c(0.2, 0.2, 0.6)
chisq.test(x, p=probs)

# b)
x = c(mtcars$carb, mtcars$cyl)
m = matrix(x, nrow=2, byrow=T)
chisq.test(m)


# Задача 4
# a)
first_experiment = morley$Speed[morley$Expt == 1]
second_experiment = morley$Speed[morley$Expt == 2]
third_experiment = morley$Speed[morley$Expt == 3]
fourth_experiment = morley$Speed[morley$Expt == 4]
fifth_experiment = morley$Speed[morley$Expt == 5]

shapiro.test(first_experiment)
shapiro.test(second_experiment)
shapiro.test(third_experiment)
shapiro.test(fourth_experiment)
shapiro.test(fifth_experiment)

t.test(first_experiment, second_experiment)
t.test(second_experiment, third_experiment)
t.test(third_experiment, fourth_experiment)
t.test(fourth_experiment, fifth_experiment)


# b)
x = morley$Speed[morley$Expt == 1]
y = morley$Speed[morley$Expt == 2]

shapiro.test(x)
shapiro.test(y)

t.test(x, y)


# Задача 5
x = replicate(1000, sum(sample(1:6, size=3, replace=TRUE)))


# Задача 6
frame <- data.frame(beers = c(5,2,9,8,3,7,3,5,3,5),
                    promiles = c(0.1,0.03,0.18,0.12,0.04,0.11,0.07,0.06,0.02,0.05))

# a)
model <- lm(promiles ~ beers, data=frame)
model_summary <- summary(model)

n <- nrow(frame)
beta0_est <- model_summary$coefficients[1, 1]
beta1_est <- model_summary$coefficients[2, 1]


beta0_se = model_summary$coefficients[1, 2]
beta1_se = model_summary$coefficients[2, 2]

# b)

# c)
predict.lm(
  model,
  newdata = data.frame(beers = c(7.5)),
  interval = "confidence",
  level = 0.92
)

# d)
plot(frame)
abline(model, col="red")


