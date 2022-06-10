# Task 1
f = function(x, n) {
  sum((x^(1:n) / (1:n)))
}


# Task 2
df = data.frame(state.x77)

# a)
indexes = order(df$Illiteracy)
names = rownames(df)
names[indexes[1:5]]

# b)
indexes = order(df$Area, decreasing = T)
sum(df$Population[indexes[1:10]])

# c)
sum(df$Life.Exp > 70)

# d)
names[which.max(df$Population / df$Area)]


# Task 3
good_illiteracy = df$Illiteracy[df$Illiteracy < 1]
bad_illiteracy = df$Illiteracy[df$Illiteracy >= 1]

shapiro.test(good_illiteracy)
shapiro.test(bad_illiteracy)

wilcox.test(good_illiteracy, bad_illiteracy, alternative="greater")


# Task 4
data_frame = data.frame(
  x2 = anscombe$x2,
  y2 = anscombe$y2
)

plot(data_frame)

model <- lm(y2 ~ log(x2), data=data_frame)
summary_model = summary(model)

predict_df = data.frame(x2=c(8.3, 9.5, 10.7))
predict.lm(
  model,
  predict_df,
  interval = "confidence",
  level = 0.95
)


# Task 5
x = c(38, 10, 84, 36, 50, 35, 73, 48)
y = c(32, 16, 57, 28, 52, 12, 61, 29)

shapiro.test(x)
shapiro.test(y)

t.test(x, y)

