# Exercise_1
shots = c(
  8, 5, 12, 11, 12, 8, 6, 7, 11, 7, 11, 13, 15,
  12, 17, 12, 9, 15, 8, 11, 11, 13, 10, 8, 12, 12, 11,
  13, 12, 14, 9, 11, 13, 10, 10, 12, 13, 10, 15, 12, 15, 12
)

# 1.1
f = function(p, element){
  x = dbinom(x=element, 30, p)
  log(x)
}

# 1.2
probabilities = runif(n=length(shots))
results = c()

for (i in 1:length(shots)) {
  prob = f(probabilities[i], shots[i])
  results = append(results, prob)
}

# 1.3
plot(x = probabilities, y = results, type="p")

# 1.4
getTheBestProb = function(probabilities, probs){
  probabilities[which.max(probs)]
}

getTheBestProb(probabilities,results)


# Exercise_2
# 2.1 
cars = mtcars[1:5, ]

# 2.2
rownames(mtcars)[which.max(mtcars$hp)]
rownames(mtcars[order(mtcars$wt), ])[1:5]

# 2.3
boxplot(mtcars$mpg, mtcars$cyl)

# 2.4
plot(mtcars$hp, mtcars$mpg)
cor(mtcars$hp, mtcars$mpg)

# 2.5
quantile(mtcars$hp, 0.80)

# 2.6
sum(mtcars$hp < 100) / length(mtcars$hp) * 100

# 2.7
prop.table(table(mtcars$cyl, mtcars$gear), 2)[3, 3]


# Exercise_3 
boughtGums = function(){
  gumsNumber = 20
  
  while(TRUE){
    gums = sample(1:20, size=gumsNumber, replace=T)
    uniqueGums = unique(gums)
    
    if(length(uniqueGums) == 20){
      print(gumsNumber)
      break
    }
    else{
      gumsNumber = gumsNumber + 1
    }
  }
}

boughtGums()
