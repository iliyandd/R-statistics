#ex2
install.packages("UsingR")
library("UsingR")
#2.1 
cars = mtcars[1:5, ]

#2.2
#maxHp
maxHpCarF = function(){
  
maxHpCar = mtcars$hp[which.max(mtcars$hp)]
MaxHpCarName = rownames(mtcars)[which.max(mtcars$hp)]
result = paste(MaxHpCarName," : ")
result = paste(result,maxHpCar)
result = paste(result,"hp")
result
}
maxHpCarF()
#Top 5 lighter cars
topFiveLighter = function(){
o = order(mtcars$wt, decreasing = F)
lightCars = mtcars$wt[o][1:5]
lightCarsName = rownames(mtcars[o, ])[1:5]
for (i in 1:5) {
    r = paste(lightCarsName[i], " --> ")
    r = paste(r, lightCars[i])
    print(r)
  }
  
}
topFiveLighter()


#2.3
boxplot(mtcars$mpg,mtcars$cyl)
#edno ot dvete e
boxplot(mtcars$mpg ~ mtcars$cyl)

#2.4
plot(mtcars$hp, mtcars$mpg,type = "l")
cor(mtcars$hp,mtcars$mpg)

#2.5
getTop20PercentHp = function(topPercent){
  result = quantile(mtcars$hp,1-(topPercent/100))
  result  = paste(result,"hp")
  result
}
getTop20PercentHp(20)

#2.6
getPercentOfLowerThanSomeHp  = function(s){
lowerThanS = length(mtcars$hp[mtcars$hp<=s])
allCars = length(mtcars$hp)
result = lowerThanS/allCars *100
result  = paste(result,"%")
result
}
getPercentOfLowerThanSomeHp(100)

#2.7
#P(mtcars$cyl = 8 | mtcars$gear = 5)
prop.table(table(mtcars$cyl,mtcars$gear),2)[3,3]




#ex1
#1.1
shots = c(
  8, 5, 12, 11, 12, 8, 6, 7, 11, 7, 11, 13, 15,
  12, 17, 12, 9, 15, 8, 11, 11, 13, 10, 8, 12, 12, 11,
  13, 12, 14, 9, 11, 13, 10, 10, 12, 13, 10, 15, 12, 15, 12
)
f = function(p,element){
 x= dbinom(x=element,30,p)
 x
 result = log(x)
 result
}
for (i in 1:length(shots)) {
  prob = f(0.5,shots[i])
  print(prob)
}


