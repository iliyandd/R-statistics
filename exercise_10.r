library("UsingR")

x = rchisq(1000, 3)
hist(x, probability = T)


# Task 1
x = c(125, 410, 310, 300, 318, 298, 148)
x = c(125, 148, 148)
chisq.test(x)
# p-value е много малкор т.е. отхвърляме нулевата хипотеза,
# т.е не са еднакви бройки средно то дните

# ако искаме да го решим на ръка става така:
n = sum(x)
df = length(x)
expected = mean(x)
xsq = sum((x - expected)^2 / expected)
pvalue = pchisq(xsq, df, lower.tail = FALSE)


# Task 2
probs = table(pi2000[1:200]) # we get number of meetings of each digit
chisq.test(probs)
# p-value > 0.05 ==> we accept Ho


# Task 3
my_probs = c(0.127, 0.0956, 0.0817, 0.0751, 0.0697, 0.0675, 0.4834)
observed = c(102, 108, 90, 95, 82, 40)
observed = c(observed, n - sum(observed))
chisq.test(observed, p=my_probs)

# Ако искаме да го сметнем на ръка става така:
n = 1036
df = 7 - 1
expected = n * my_probs 
xsq = sum((observed - expected)^2 / expected)
pvalue = pchisq(xsq, df, lower.tail = FALSE)
# p-value < 0.05 ==> отхвърляме Ho


# Task 4
m <- matrix(c(12813, 647, 359, 42, 65963, 4000, 2642, 303), nrow = 2, ncol = 4, byrow = T)
p-value = chisq.test(m)
# Ho - величините са независими
# p-value < 0.05 ==> величините са зависими и коланът помага


# Task 5
m <- matrix(c(44, 74, 79, 72, 31, 14, 25, 27, 24, 10, 15, 20, 20, 23, 9, 3, 5, 5, 0, 0),
            nrow=4, ncol=5, byrow = T)
pvalue = chisq.test(m)
