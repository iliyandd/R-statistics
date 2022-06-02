# Task 1


# Task 2
repeat_normality_check = function(n) {
  hypothesis_results = c()
  
  for (i in 1:10000) {
    x = runif(n, 5, 12)
    hypothesis_results = append(hypothesis_results, shapiro.test(x)$p.value > 0.05)
  }
  
  prop.table(table(hypothesis_results))
}

results = repeat_normality_check(15)
results = repeat_normality_check(25)
results = repeat_normality_check(50)
results = repeat_normality_check(90)
results


# Task 3
