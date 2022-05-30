library("UsingR")

# Task 1(няма да има такава на изпита)
plot(mtcars)
model_1 = lm(mpg~log(disp), data=mtcars)
model_2 = lm(mpg~log(disp) + log(hp), data=mtcars)
model_summary = summary(model_2)
model_summary


# Task 2
setwd("/home/iliyan/Iliyan/R-statistics/")

heights_df = read.csv("./Height.txt", sep="\t", dec=".")
heights_df = heights_df * 2.55

plot(heights_df)

model = lm(Height ~ momheight + dadheight, data=heights_df)
model_summary = summary(model)
model_summary

predict.lm(model, newdata = data.frame(momheight=c(160, 162, 166),
                                       dadheight=c(176, 180, 185)),
           interval="confidence", level=0.98)


# Task 3
experiments = data.frame(
  heights = c(100, 200, 300, 450, 600, 800, 1000),
  distances = c(253, 337, 395, 451, 495, 534, 574)
)
plot(experiments)
model = lm(distances ~ log(heights), data=experiments)
model_summary = summary(model)

y_fitted = model$fitted.values
points(experiments$heights, y_fitted, col="red", type="b")


# Task 4

