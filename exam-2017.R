library("UsingR")
library("MASS")


# Task 1
# a)
length(Aids2$age[Aids2$age < 20])

# b)
Aids2$sex[1:5]

# c)
prop.table(table(Aids2$sex, Aids2$T.categ))[2, 6]

# d)
plot(Aids2$death, Aids2$state)


# Task 2
male_deaths = Aids2$death[Aids2$sex == "M"]
female_deaths = Aids2$death[Aids2$sex == "F"]

shapiro.test(male_deaths)
shapiro.test(female_deaths)

wilcox.test(female_deaths, male_deaths, alternative="less")


# Task 3
death_pacients = Aids2$age[Aids2$status == "D"]

shapiro.test(death_pacients)
wilcox.test(death_pacients, mu=38, alternative="two.sided")


# Task 4
x = rchisq(100, df=10)
hist(x, probability = T)
lines(density(x), col="red")


# Task 5
male_cats = cats[cats$Sex == "M", ]

cats_df <- data.frame(
  bw = male_cats$Bwt * 1000,
  hw = male_cats$Hwt
)

model <- lm(hw ~ bw, data=cats_df)
model_summary <- summary(model)

plot(cats_df)




