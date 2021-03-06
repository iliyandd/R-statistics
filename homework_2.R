# Task 1
deny_zero_hypothesis = function(n){
  t = table(sample(1:6,size = n,replace = T))
  result = chisq.test(t)$p.value<0.05
  result

}

f = function(n){
  s = sum(replicate(10000, deny_zero_hypothesis(n))) / 10000 * 100
  result = paste(s, "%")
  result
}

f(100)
f(200)
f(400)


# Task 2
repeat_normality_check = function(n) {
  hypothesis_results = c()
  
  for (i in 1:10000) {
    x = runif(n, 5, 12)
    hypothesis_results = append(hypothesis_results, shapiro.test(x)$p.value > 0.05)
  }
  
  prop.table(table(hypothesis_results))
}

repeat_normality_check(15)
repeat_normality_check(25)
repeat_normality_check(50)
repeat_normality_check(90)
