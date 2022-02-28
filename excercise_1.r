# Creating of a vector
x = c(1,23,4,55,6,67)

# Creating of a sequence
first_sequence = 1:100 # first_sequence = seq(1, 100, by=1)

# Info about variables
typeof(first_sequence)
length(first_sequence)
str(first_sequence)

# Vector indexing. Indexing starts from 1
some_vector <- c(1, 2, 3, 4, 5, 11, 1, 1, 4)
some_vector[3]
some_vector[-3]
some_vector[1:5]
some_vector[c(1,3,6)]

# Filter
some_vector[some_vector %% 2 == 0 & some_vector < 3]
some_vector[some_vector > 3]

# Sorting
sort(some_vector)
some_vector[order(some_vector)] # order return indexes of sorted elements in vector

# Min and max
min(some_vector)
max(some_vector)

# Indexes of min and max elements
which.max(some_vector)
which.min(some_vector)

# Indexes of elements which satisfy boolean condition
which(some_vector %% 2 == 0)

# Creating matrices
my_matrix <- matrix(data = 1:9, nrow = 3, ncol = 3, byrow = TRUE)

# Matrix indexing
# my_matrix[<row_index>, <column_index>]
my_matrix[2, 3]
my_matrix[, 2]
my_matrix[3,]

my_matrix[c(1,2), c(2,3)]

# Giving names of matrix rows and columns
rownames(my_matrix) <- c("a", "b", "c")
colnames(my_matrix) <- c("a", "b", "c")

# Add new row and column
rbind(my_matrix, 10:12)
cbind(my_matrix, 13:15)

# Sort matrix by rows
my_matrix[order(my_matrix[,1]), ]

# Installing and loading of packages
install.packages("UsingR")
library("UsingR")
load(homedata)



# Task 1
v <- c(8, 3, 8, 7, 15, 9, 12, 4, 9, 10, 5, 1)
A <- matrix(data = v, nrow = 4, ncol = 3, byrow = TRUE)
rownames(A) <- c("a", "b", "c", "d")
colnames(A) <- c("a", "b", "c")
A <- cbind(A, c(1,3,5,7))
A <- A[order(A[,1]), ]


# Task 2
# a)
cheapest = homedata[which.min(homedata$y2000), ]
most_expensive = homedata[which.max(homedata$y2000), ]

# b)
five_most_expensive = homedata[order(homedata$y2000, decreasing = TRUE)[1:5], ]

# c)
length(homedata$y2000[homedata$y2000 > 750000])

# d)
mean(homedata$y1970[homedata$y2000 > 750000])

# e)
homedata[homedata$y1970 > homedata$y2000, ]

# f)
index <- order(
  (homedata$y2000 - homedata$y1970) / homedata$y1970, decreasing = TRUE
)

homedata[index[1:10], ]


# Task 3
load(survey)

# a)
sum(survey$Sex == "Male", na.rm = TRUE)

# b)
sum(survey$Sex == "Male" & survey$Smoke != "Never", na.rm = TRUE)

# c)
mean(survey$Height[survey$Sex == "Male"], na.rm = TRUE)

# d)
survey[order(survey$Age)[1:6], c("Height", "Sex")]
