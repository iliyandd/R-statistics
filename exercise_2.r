# Task 2
library("UsingR")
load(survey)

# a)
# prop.table(...) gives table with probabilities
prop.table(table(survey$Smoke))

# b)
prop.table(table(survey$Smoke, survey$Sex))[4, 2]

# c)
prop.table(table(survey$Sex == "Male", survey$Smoke == "Regul"), 1)

# d)
prop.table(table(survey$Sex, survey$Smoke), 2)


# Task 3
# Creating charts
barplot(table(survey$Smoke))
barplot(table(survey$Smoke, survey$Sex), legend = TRUE)


# Task 4
survey$Group = ifelse(
  survey$Age < 20,
  "A",
  ifelse(
    survey$Age < 25,
    "B",
    "C"
  )
)

barplot(table(survey$Group), beside = TRUE, legend = TRUE)


# Task 5
mean(survey$Height, na.rm = TRUE)
median(survey$Height, na.rm = TRUE)
quantile(survey$Height, na.rm = TRUE)
quantile(survey$Height, 0.25, na.rm = TRUE)
sd(survey$Height, na.rm = TRUE)

male_heights = survey$Height[survey$Sex == "Male"]
female_heights = survey$Height[survey$Sex == "Female"]

x = survey$Height
s = sd(survey$Height, na.rm = TRUE)
m = mean(survey$Height, na.rm = TRUE)

sum(x > m - s & x < m + s, na.rm = TRUE) / length(x)
sum(x > m - 2*s & x < m + 2*s, na.rm = TRUE) / length(x)
sum(x > m - 3*s & x < m + 3*s, na.rm = TRUE) / length(x)
