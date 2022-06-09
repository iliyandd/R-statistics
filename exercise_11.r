# Task 1
patient_df = data.frame(
  age = c(18, 23, 25, 35, 65, 54, 34, 56, 72, 19, 23, 42, 18, 39, 37),
  pulse = c(202, 186, 187, 180, 156, 169, 174, 172, 153, 199, 193, 174, 198, 183, 178)
)
n = nrow(patient_df)

model <- lm(pulse ~ age, data=patient_df)
plot(patient_df)
abline(model, col="red")

model_summary = summary(model)

beta0_est = model_summary$coefficients[1, 1]
beta1_est = model_summary$coefficients[2, 1]

beta0_se = model_summary$coefficients[1, 2]
beta1_se = model_summary$coefficients[1, 2]

beta1_hypothetical = -1
t1_statistics = (beta1_est - beta1_hypothetical) / beta1_se
pt(t1_statistics, n-2, lower.tail = FALSE)

beta0_hypothetical = 220
t2_statistics = (beta0_est - beta0_hypothetical) / beta0_se
pt(t2_statistics, df=n - 2, lower.tail = FALSE)

ages_to_predict <- c(30, 40, 50)
beta0_est + beta1_est * ages_to_predict
