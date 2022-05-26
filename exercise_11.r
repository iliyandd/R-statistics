# Task 1
people_df = data.frame(
  age = c(18, 23, 25, 35, 65, 54, 34, 56, 72, 19, 23, 42, 18, 39, 37),
  pulse = c(202, 186, 187, 180, 156, 169, 174, 172, 153, 199, 193, 174, 198, 183, 178)
)
n = nrow(people_df)

model = lm(pulse ~ age, data = people_df)
summary(model)

# Тук го правя в обратната посока
tscore = (220 + 0.79773) / 0.06996
pvalue = pt(tscore, df=n-2)
