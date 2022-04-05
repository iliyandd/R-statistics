library("UsingR")


f = function(n){
  x = rnorm(n, 7, 5)
  mean(x)
}

y = replicate(10000, f(100))
hist(y, probability=T, breaks=50, col= 'grey')
lines(density(y), col = 'red')


x = rnorm(20, 19, 3)
t.test(x, conf.level=0.9)


# 1
f = function(n){
  x = rnorm(n, 3, 4)
  ci = t.test(x)$conf.int
  (3 >= ci[1] & 3 <= ci[2])
}

y = replicate(100, f(20))
sum(y)


# 2
y = c(10.0, 13.6, 13.2, 11.6, 12.5, 14.2, 14.9, 14.5, 13.4, 8.6, 11.5, 16.0,
      14.2, 16.8, 17.9, 17.0)
t.test(y)
hist(y, probability=T)
lines(density(y))




# 3
# a)
shapiro.test(rat)
t.test(rat, conf.level=0.96)

# if shapiro.test p-value was <= 0.5 then must use wilcox.test
# wilcox.test(y, conf.int=T)

# b)
t.test(exec.pay, conf.level=0.96)



# 4
prop.test(x=87, n=150, conf.level=0.92)
prop.test(x=870, n=1500, conf.level=0.92)



