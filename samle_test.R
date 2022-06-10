# Task 1
qnorm(0.05, 0, 1)


# Task 3
prop.test(c(76, 50), c(200, 100), conf.level=0.01, alternative="greater")

# Task 4
data_frame = data.frame(
  x3 = anscombe$x3,
  x4 = anscombe$x4
)

model <- lm(x3 ~ x4, data=data_frame)
summary(model)
