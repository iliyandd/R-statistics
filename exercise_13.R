setwd("/home/iliyan/Iliyan/R-statistics/")

# Task 1
plot(data)
students_df = read.csv("./student.txt", sep=",", dec=".")
n = nrow(students_df)
train_size = 0.8
train_idx = sample(1:n, size=0.8 * n, replace=FALSE)
train_set = students_df[train_idx, ]
test_set = students_df[-train_idx, ]

mean(students_df$admit == 1)

# build model
model = glm(admit ~ gre + gpa + rank, data=train_set)
y_pred_prob = predict.glm(model, newData=test_set)
y_pred = 0 + (y_pred_prob > 0.6)
y_pred

accuracy = mean(test_set$admit == y_pred)
accuracy

# error types
first_type_error = mean((test_set$admit == 0) & (y_pred == 1))
second_type_error = mean((test_set$admit == 1) & (y_pred == 0))


predict_df = data.frame(gre=c(700), gpa=c(3.5), rank=c(2))
predict.glm(model, newdata=predict_df, type="response")


# Task 2
library("mlbench")
data(BreastCancer)

model = glm(Class ~ Bl.cromatin + Normal.nucleoli + Mitoses, data=BreastCancer)



