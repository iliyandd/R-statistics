# Functions...
f = function(x=2, y=3){
  x + y
}

f(4, 7)
f(x=5, y=7)
f(y=8, x=3)

# For loops...
for(x in 1:10){
  print(x)
}


# Sample functions...
# Теглене с връщане. При replace=True е теглене с връщане
x = sample(c("B", "W"), size=10, replace=TRUE, prob=c(0.2, 0.8))
mean(x=="B")


library("purrr")
library("tidyverse")
x = c(1, 7, 3, 4, 3.1478)
# връща списък с акумулираните суми
# ith = sum(from j=1 to i Xi)
cumsum(x)


install.packages("purrr")
install.packages("tidyverse")


keep(x, function(x){x < 3}) # works like filter
map(x, ~.x^2) # work like maps
detect_index(y, ~.x>17)

# Изпълнява n-пъти функция
# replicate(n, , f())


# Task 1
f = function(n=100){
  x = sample(1:6, size=n, replace=TRUE)
  sum(x == 6) / n
}

result_1 = replicate(3700, f())
# 0.20, 0.41, 0.11, ... (make mean)
plot(cummean(result_1), type="l") # type="l" прави графиката като линия
abline(h=1/6, col="red") # осреднява с линия графиката


# Task 2
# A = {поне на двама души рдто съвпада}
# Искаме P(A) > p
# P(not(A)) = 1 - P(A) <= 1 - p
# Искаме P(not(A)) <= 1 - p
# 365/365 * 364/365
f = function(p){
  # x = cumprod((365:1) / 365)
  # detect_index(x, ~.x <= 1-p)
  
  prob = 1
  counter = 0
  
  for(i in (365:1)){
    prob = (prob * i) / 365
    counter = counter + 1
    
    if(prob <= 1-p){
      return(365-i)
    }
    
  }
}


# Task(from past exam)
# сума от i до n на x^i
f = function(x, n){
  sum(x^(1:n))
}

f(2, 10)



# Task 3
f = function(p1=0.3, p2=0.4){
  # result_1 = p2*p1 + (1-p1)*p1*p2 # a)
  # result_2 = p1*p2 + (1-p2)*p1*p2 # b)
  # result_1
  # result_2
}

f()
# p2.p1 + (1-p2).p1.p2 да победи, ако играе първо с майката

# H.W.



# Task 4
f = function(n=20){
  x = sample(1:20, n, replace=FALSE)
  counter = 0
  for(i in 1:20){
    if(x[i] == i){
      counter = counter + 1
    }
  }
  
  counter / 20
}

f()


# Task 5
f = function(){
  while(TRUE){
    counter = 1
    x = sample(c("E", "T"), 5, replace = TRUE)
    if(x == c("E", "E", "T", "E", "T")){
      counter
    }
    counter = counter + 1
  }
}

f()
