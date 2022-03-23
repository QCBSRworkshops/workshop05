##Section: 01-preparing-for-the-workshop.R 

###Notice ###
#                                                                            #
#This is an automatically generated script based on the code chunks from the #
#book for this workshop.                                                     #
#                                                                            #
#It is minimally annotated to allow participants to provide their comments:  #
#a practice that we highly encourage.                                        #
#                                                                            #
#Note that the solutions to the challenges are also included in this script. #
#When solving the challenges by yourself, attempt to not scroll and peek at  #
#the solutions.                                                              #
#                                                                            #
#Happy coding!                                                               #


install.packages("DiagrammeR")

library(DiagrammeR)


##Section: 02-control-flow.R 




##Section: 03-decision-making.R 

if(condition) {
  expression
}









options(width = 30)
a <- 1:10

ifelse(test = a > 5, 
       yes = "yes", 
       no = "no")

a <- (-4):5

sqrt(ifelse(test = a >= 0, 
            yes = a,
            no = NA)
     )





if(2+2) == 4
print("Arithmetic works.")
else
print("Houston, we have a problem.")

if(2+2) == 4 
print("Arithmetic works.")
else
print("Houston, we have a problem.")

if(2+2 == 4) {
  print("Arithmetic works.")
} else {
  print("Houston, we have a problem.")
}

Paws <- "cat"
Scruffy <- "dog"
Sassy <- "cat"

animals <- c(Paws, Scruffy, Sassy)

if(Paws == 'cat') {
  print("meow")
}

x = Paws
# x = Scruffy
if(x == 'cat') {
  print("meow")
} else {
  print("woof")
}

animals <- c(Paws, Scruffy, Sassy)

ifelse(animals == 'dog', "woof", "meow")

for(val in 1:3) {
  if(animals[val] == 'cat') {
    print("meow")
  } else if(animals[val] == 'dog') {
    print("woof")
  } else print("what?")
}


##Section: 04-iteration.R 

for(a in c("Hello",
           "R",
           "Programmers")) {
  print(a)
}

for(z in 1:4) {
  a <- rnorm(n = 1,
             mean = 5 * z,
             sd = 2)
  print(a)
}





y <- 2
for(m in 1:6) {
  print(y*m)
}



(elements <- list(a = 1:3, 
                  b = 4:10, 
                  c = 7:-1))

for(element in elements) {
  print(element*2)
}


x <- c(2, 5, 3, 9, 6)
count <- 0

for(val in x) {
  if(val %% 2 == 0) {
    count <- count + 1
  }
}
print(count)



data(CO2) # This loads the built in dataset

head(CO2)

for(i in 1:length(CO2[,1])) { # for each row in the CO2 dataset
  print(CO2$conc[i]) # print the CO2 concentration
}













for (i in 1:11) { 
  if(CO2$Type[i] == "Quebec") { 
    print(CO2$conc[i])
  }
}

for (i in 12:22) { 
  if(CO2$Type[i] == "Quebec") { 
    print(CO2$conc[i])
  }
}

for (i in 23:33) { 
  if(CO2$Type[i] == "Quebec") { 
    print(CO2$conc[i])
  }
}

for (i in 34:42) { 
  if(CO2$Type[i] == "Quebec") { 
    print(CO2$conc[i])
  }
}

for(i in 1:nrow(CO2)) {
  # for each row in
  # the CO2 dataset
  print(CO2$conc[i])
  # print the CO2
  # concentration
}

for(p in CO2$conc) {
  # for each element of
  # the column "conc" of
  # the CO2 df
  print(p)
  # print the p-th element
}

for(i in 4:5) { # for i in 4 to 5
  print(colnames(CO2)[i])
  print(mean(CO2[,i])) # print the mean of that column from the CO2 dataset
}

for (i in 1:3) {
  for (n in 1:3) {
    print (i*n)
  }
}

for (i in 1:3) {
  for (n in 1:3) {
    print (i*n)
  }
}

(height <- matrix(runif(20, 1.5, 2),
                  nrow = 5,
                  ncol = 4))

apply(X = height,
      MARGIN = 2,
      FUN = mean)

SimulatedData <- list(
  SimpleSequence = 1:4,
  Norm10 = rnorm(10),
  Norm20 = rnorm(20, 1),
  Norm100 = rnorm(100, 5)
)

# Apply mean to each element of the list

lapply(X = SimulatedData, 
       FUN = mean)

SimulatedData <- list(SimpleSequence = 1:4,
                      Norm10 = rnorm(10),
                      Norm20 = rnorm(20, 1),
                      Norm100 = rnorm(100, 5))

# Apply mean to each element of the list
sapply(SimulatedData, mean)

lilySeeds <- c(80, 65, 89, 23, 21)
poppySeeds <- c(20, 35, 11, 77, 79)

# Output
mapply(sum, lilySeeds, poppySeeds)

head(mtcars)

# get the mean hp by cylinder groups
tapply(mtcars$hp, mtcars$cyl, FUN = mean)

for (i in 1:length(CO2[,1])) {
  if(CO2$Type[i] == "Quebec") {
    CO2$uptake[i] <- CO2$uptake[i] - 2
  }
}

tapply(CO2$uptake, CO2$Type, mean)

for(val in x) {
  if(condition) { next }
  statement
}







repeat {
  expression
  if {
    condition
  } break
}



repeat {
  print("Press 'Esc' to stop me!")
}







count <- 0

for(i in 1:nrow(CO2)) {
  if(CO2$Treatment[i] == "nonchilled") next
  # Skip to next iteration if treatment is nonchilled
  count <- count + 1
  #  print(CO2$conc[i]) # You can turn this on if you want to
}
print(count) # The count and print command were performed 42 times.

sum(CO2$Treatment == "chilled")

count <- 0
i <- 0
repeat {
  i <- i + 1
  if (CO2$Treatment[i] == "nonchilled") next  # skip this loop
  count <- count + 1
  print(CO2$conc[i])
  if (i == nrow(CO2)) break     # stop looping
}
print(count)

i <- 0
count <- 0
while (i < nrow(CO2))
{
  i <- i + 1
  if (CO2$Treatment[i] == "nonchilled") next  # skip this loop
  count <- count + 1
  print(CO2$conc[i])
}

print(count)

data(CO2)

for (i in 1:nrow(CO2)) {
  if(CO2$Type[i] == "Mississippi") {
    if(CO2$conc[i] < 300) next
    CO2$conc[i] <- CO2$conc[i] - 20
  }
}

for (i in 1:nrow(CO2)) {
  if(CO2$Type[i] == "Mississippi" && CO2$conc[i] >= 300) {
    CO2$conc[i] <- CO2$conc[i] - 20
  }
}

plot(x = CO2$conc, y = CO2$uptake, type = "n", cex.lab=1.4,
     xlab = "CO2 concentration", ylab = "CO2 uptake")
# Type "n" tells R to not actually plot the points.
for (i in 1:length(CO2[,1])) {
  if (CO2$Type[i] == "Quebec" & CO2$Treatment[i] == "nonchilled") {
    points(CO2$conc[i], CO2$uptake[i], col = "red")
  }
  if (CO2$Type[i] == "Quebec" & CO2$Treatment[i] == "chilled") {
    points(CO2$conc[i], CO2$uptake[i], col = "blue")
  }
  if (CO2$Type[i] == "Mississippi" & CO2$Treatment[i] == "nonchilled") {
    points(CO2$conc[i], CO2$uptake[i], col = "orange")
  }
  if (CO2$Type[i] == "Mississippi" & CO2$Treatment[i] == "chilled") {
    points(CO2$conc[i], CO2$uptake[i], col = "green")
  }
}

plot(x = CO2$conc,
     y = CO2$uptake,
     type = "n",
     cex.lab=1.4,
     xlab = "CO2 concentration",
     ylab = "CO2 uptake")

# Type "n" tells R to not actually plot the points.

plants <- unique(CO2$Plant)

for (i in 1:nrow(CO2)){
  for (p in 1:length(plants)) {
    if (CO2$Plant[i] == plants[p]) {
      points(CO2$conc[i],
             CO2$uptake[i],
             col = p)
    }
  }
}

plot(x = CO2$conc, y = CO2$uptake, type = "n", cex.lab = 1.4,
     xlab = "CO2 Concentration", ylab = "CO2 Uptake")

plants <- unique(CO2$Plant)

for (i in 1:nrow(CO2)){
  for (p in 1:length(plants)) {
    if (CO2$Plant[i] == plants[p]) {
      points(CO2$conc[i], CO2$uptake[i], col = p)
    }
  }
}


##Section: 05-writing-functions.R 

# our.dataset has 4 variables 

our.dataset <- data.frame(
  a = rnorm(10),
  b = rnorm(10),
  c = rnorm(10),
  d = rnorm(10)
)

our.dataset$a <- (our.dataset$a - min(our.dataset$a, na.rm = TRUE)) / 
  (max(our.dataset$a, na.rm = TRUE) - min(our.dataset$a, na.rm = TRUE))
our.dataset$b <- (our.dataset$b - min(our.dataset$b, na.rm = TRUE)) / 
  (max(our.dataset$b, na.rm = TRUE) - min(our.dataset$a, na.rm = TRUE))
our.dataset$c <- (our.dataset$c - min(our.dataset$c, na.rm = TRUE)) / 
  (max(our.dataset$c, na.rm = TRUE) - min(our.dataset$c, na.rm = TRUE))
our.dataset$d <- (our.dataset$d - min(our.dataset$d, na.rm = TRUE)) / 
  (max(our.dataset$d, na.rm = TRUE) - min(our.dataset$d, na.rm = TRUE))

our.dataset$a <- (our.dataset$a - min(our.dataset$a, na.rm = TRUE)) /
  (max(our.dataset$a, na.rm = TRUE) - min(our.dataset$a, na.rm = TRUE))

# our
# secret
# hidden
# function

rescale01(our.dataset$a)
rescale01(our.dataset$b)
rescale01(our.dataset$c)
rescale01(our.dataset$d)



operations <- function(number1, number2, number3) {
  result <- (number1 + number2) * number3
  print(result)
}

operations(1, 2, 3)



Scruffy <- "dog"
Paws <- "cat"
print_animal(Scruffy)
print_animal(Paws)

print_animal <- function(animal) {
  if(animal == "dog") {
    print("woof")
  } else if(animal == "cat") {
    print("meow")
  }
}

Scruffy <- "dog"
Paws <- "cat"
print_animal(Scruffy)
print_animal(Paws)

print_animal <- function(animal) {
  if(animal == "dog") {
    print("woof")
  } else if(animal == "cat") {
    print("meow")
  }
}

operations <- function(number1, number2, number3 = 3) {
  result <- (number1 + number2) * number3
  print(result)
}
operations(number1 = 1, number2 = 2, number3 = 3) 
# is equivalent to
operations(1, 2)
operations(1, 2, 2) # we can still change the value of number3 if needed

paste_anything_fun <- function(...) {
  arguments <- list(...)
  paste0(arguments)
}

paste_anything_fun("I", 
                   "want", 
                   "a break!")

percentages <- function(x, mult = 100, ...){
 percent <- round(x * mult, ...)
 paste(percent, "%", sep = "")
}

percentages(c(.543, .534, .466))

# ?round
percentages(c(.543, .534, .466), digits = 2)

plot.CO2 <- function(CO2, ...) {
  plot(x=CO2$conc, y = CO2$uptake, type = "n", ...)
  for(i in 1:length(CO2[,1])){
     if(CO2$Type[i] == "Quebec") {
       points(CO2$conc[i], CO2$uptake[i], col = "red", type = "p", ...)
     } else if(CO2$Type[i] == "Mississippi") {
       points(CO2$conc[i], CO2$uptake[i], col = "blue", type = "p", ...)
     }
  }
}

plot.CO2(CO2,
         cex.lab = 1.2,
         xlab = "CO2 concentration",
         ylab = "CO2 uptake")

plot.CO2(CO2,
         cex.lab = 1.2, pch = 20,
         xlab = "CO2 concentration",
         ylab = "CO2 uptake")

plot.CO2 <- function(CO2, ...) {
  plot(x = CO2$conc, y = CO2$uptake, type = "n", ...)
  for(i in 1:length(CO2[,1])){
     if(CO2$Type[i] == "Quebec") {
       points(CO2$conc[i], CO2$uptake[i], col="red", type="p", ...)
     } else if(CO2$Type[i] == "Mississippi") {
       points(CO2$conc[i], CO2$uptake[i], col="blue", type="p", ...)
     }
  }
}
par(mfrow=c(1, 2), mar = c(4, 4, 1, 1))
plot.CO2(CO2, 
         cex.lab=1.2, 
         xlab="CO2 concentration", ylab="CO2 uptake")
plot.CO2(CO2, cex.lab=1.2, xlab="CO2 concentration", ylab="CO2 uptake", pch=20)

myfun <- function(x) {
  if(x < 10) {
    0
  } else {
    10
  }
}
myfun(5)
myfun(15)

simplefun1 <- function(x) {
  if(x < 0)
  return(x)
}

simplefun2 <- function(x, y) {
  z <- x + y
  return(list("result" = z,
              "x" = x,
              "y" = y))
}

simplefun2(1, 2)

simplefun2(1, 2)

bigsum <- function(a, b) {
  result <- a + b
  if(result < 50) {
    return(0)
  } else {
    return(result)
  }
}

bigsum <- function(a, b) {
  result <- a + b
  if(result < 50) {
  0
  } else {
  result
  }
}

out_val <- 3 
vartest <- function() {
  in_val <- 4  
  print(in_val)
  print(out_val)
}
vartest()

in_val; out_val

out_val_2

var1 <- 3 
vartest <- function() {
  a <- 4      # 'a' is defined inside
  print(a)    # print 'a'
  print(var1) # print var1
}
a             # we cannot print 'a' as it exists only inside the function
vartest()     # calling vartest() will print a and var1
rm(var1)      # remove var1
vartest()     # calling the function again does not work anymore

a <- 3
if(a > 5) {
  b <- 2
}
a + b

# Error: object 'b' not found

if((a[x,y]>1.0)&(a[x,y]<2.0)){print("Between 1 and 2")}

 if((a[x, y] > 1.0) & (a[x, y] < 2.0)){
    print("Between 1 and 2")
  }

a<-4;b=3
if(a<b){
if(a==0)print("a zero")}else{
if(b==0){print("b zero")}else print(b)}

a <- 4
b <- 3
if(a < b) {
  if(a == 0) {
    print("a zero")
  }
} else {
  if(b == 0) {
    print("b zero")
  } else {
    print(b)
  }
}

for(i in 1:length(CO2[,1])) {
  if(CO2$Type[i] == "Mississippi") {
    CO2$conc[i] <- CO2$conc[i] - 20
  }
}
for(i in 1:length(CO2[,1])) {
  if(CO2$Type[i] == "Quebec") {
    CO2$conc[i] <- CO2$conc[i] + 50
  }
}

recalibrate <- function(CO2, type, bias) {
  for(i in 1:nrow(CO2)) {
    if(CO2$Type[i] == type) {
      CO2$conc[i] <- CO2$conc[i] + bias
    }
  }
  return(CO2)
}

newCO2 <- recalibrate(CO2 = CO2,
                      type = "Mississipi",
                      bias = -20)
newCO2 <- recalibrate(newCO2, "Quebec", +50)

rc <- function(c, t, b) {
  for(i in 1:nrow(c)) {
    if(c$Type[i] == t) {
      c$uptake[i] <- c$uptake[i] + b
    }
  }
  return(c)
}

# Recalibrates the CO2 dataset by modifying the CO2 uptake concentration
# by a fixed amount depending on the region of sampling.
# Arguments
# CO2: the CO2 dataset
# type: the type ("Mississippi" or "Quebec") that need to be recalibrated
# bias: the amount to add or remove to the concentration uptake
recalibrate <- function(CO2, type, bias) {
  for(i in 1:nrow(CO2)) {
    if(CO2$Type[i] == type) {
      CO2$uptake[i] <- CO2$uptake[i] + bias
    }
  }
  return(CO2)
}

my_function <- function(x) {
  if(x != 0) {
  z <- cos(x)/x
  } else { z <- 1 }
  return(z)
}

my_function(45)
my_function(20)
my_function(0)


##Section: 06-references.R 




