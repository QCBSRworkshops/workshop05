## ----setup, echo = FALSE------------------------------------------------------
knitr::opts_chunk$set(
  comment = "#",
  collapse = TRUE,
  warning = FALSE,
  message = FALSE,
  fig.width=6, fig.height=6,
  fig.retina = 3,
  fig.align = 'center'
)
options(repos=structure(c(CRAN="http://cran.r-project.org")))


## ----echo = FALSE, results = "asis"-------------------------------------------
bge <- qcbsRworkshops::get_badges(5, style = "for-the-badge", clip = FALSE,
show = FALSE)
cat(bge[-1L])


## -----------------------------------------------------------------------------
  num.vector <- c(1, 4, 3, 98, 32, -76, -4)

## -----------------------------------------------------------------------------
  num.vector


## -----------------------------------------------------------------------------
  siteID <- c("A1.01", "A1.02", "B1.01", "B1.02")
  soil_pH <- c(5.6, 7.3, 4.1, 6.0)
  num.sp <- c(17, 23, 15, 7)
  treatment <- c("Fert", "Fert", "No_fert", "No_fert")


## -----------------------------------------------------------------------------
  my.first.df <- data.frame(siteID, soil_pH, num.sp, treatment)

## -----------------------------------------------------------------------------
  my.first.df


## -----------------------------------------------------------------------------
  my.first.list <- list(siteID, soil_pH, num.sp, treatment)


## -----------------------------------------------------------------------------
  my.first.list


## -----------------------------------------------------------------------------
if(2+2 == 4) { #<<
  print("Arithmetic works.")
} else { #<<
  print("Houston, we have a problem.")
} #<<


## -----------------------------------------------------------------------------
Paws <- "cat"
Scruffy <- "dog"
Sassy <- "cat"
animals <- c(Paws, Scruffy, Sassy)


## -----------------------------------------------------------------------------
if(Paws == 'cat') {
  print("meow")
}


## -----------------------------------------------------------------------------
x = Paws
# x = Scruffy
if(x == 'cat') {
  print("meow")
} else {
  print("woof")
}


## -----------------------------------------------------------------------------
animals <- c(Paws, Scruffy, Sassy)

ifelse(animals == 'dog', "woof", "meow")


## -----------------------------------------------------------------------------
for(val in 1:3) {
  if(animals[val] == 'cat') {
    print("meow")
  } else if(animals[val] == 'dog') {
    print("woof")
  } else print("what?")
}


## ----echo=FALSE---------------------------------------------------------------
  for(m in 1:5) {
  print(m*2)
}


## ----echo=FALSE---------------------------------------------------------------
for(m in 6:10) {
  print(m*2)
}


## ---- echo=FALSE--------------------------------------------------------------
for(i in 1:10) { 
  print(CO2$conc[i]) 
}


## ---- echo=FALSE--------------------------------------------------------------
for (i in 11:20) { 
  print(CO2$conc[i]) 
}


## ---- echo=FALSE--------------------------------------------------------------
for (i in 21:30) { 
  print(CO2$conc[i]) 
}


## ---- echo=FALSE--------------------------------------------------------------
for (i in 31:40) { 
  print(CO2$conc[i]) 
}


## ---- echo=FALSE--------------------------------------------------------------
for (i in 1:11) { 
  if(CO2$Type[i] == "Quebec") { 
    print(CO2$conc[i])
  }
}


## ---- echo=FALSE--------------------------------------------------------------
for (i in 12:22) { 
  if(CO2$Type[i] == "Quebec") { 
    print(CO2$conc[i])
  }
}


## ---- echo=FALSE--------------------------------------------------------------
for (i in 23:33) { 
  if(CO2$Type[i] == "Quebec") { 
    print(CO2$conc[i])
  }
}


## ---- echo=FALSE--------------------------------------------------------------
for (i in 34:42) { 
  if(CO2$Type[i] == "Quebec") { 
    print(CO2$conc[i])
  }
}


## ---- echo=FALSE--------------------------------------------------------------
for (i in 1:20) { 
  print(CO2$conc[i]) 
}


## ---- echo=FALSE--------------------------------------------------------------
for (i in 21:40) { 
  print(CO2$conc[i]) 
}


## ---- echo=FALSE--------------------------------------------------------------
for (i in 1:20) { 
  print(CO2$conc[i]) 
}


## ---- echo=FALSE--------------------------------------------------------------
for (i in 21:40) { 
  print(CO2$conc[i]) 
}


## ----echo = FALSE-------------------------------------------------------------
for (i in 4:5) { # for i in 4 to 5
  print(colnames(CO2)[i])
  print(mean(CO2[,i])) # print the mean of that column from the CO2 dataset
}


## ----echo = -c(2:5)-----------------------------------------------------------
# Output
for (i in 1:3) {
  for (n in 1:3) {
    print (i*n)
  }
}


## -----------------------------------------------------------------------------
(height <- matrix(c(1:10, 21:30),
                 nrow = 5,
                 ncol = 4))



## -----------------------------------------------------------------------------
apply(X = height,
      MARGIN = 1,
      FUN = mean)



## ----eval = FALSE-------------------------------------------------------------
## SimulatedData <- list(
##   SimpleSequence = 1:4,
##   Norm10 = rnorm(10),
##   Norm20 = rnorm(20, 1),
##   Norm100 = rnorm(100, 5))
## 
## # Apply mean to each element
## ## of the list
## lapply(SimulatedData, mean)


## ----echo=FALSE---------------------------------------------------------------
SimulatedData <- list(SimpleSequence = 1:4,
             Norm10 = rnorm(10),
             Norm20 = rnorm(20, 1),
             Norm100 = rnorm(100, 5))

# Apply mean to each element of the list
lapply(SimulatedData, mean)


## ----eval = TRUE--------------------------------------------------------------
SimulatedData <- list(SimpleSequence = 1:4,
             Norm10 = rnorm(10),
             Norm20 = rnorm(20, 1),
             Norm100 = rnorm(100, 5))

## -----------------------------------------------------------------------------
# Apply mean to each element of the list
sapply(SimulatedData, mean)


## -----------------------------------------------------------------------------
lilySeeds <- c(80, 65, 89, 23, 21)
poppySeeds <- c(20, 35, 11, 77, 79)

## -----------------------------------------------------------------------------
# Output
mapply(sum, lilySeeds, poppySeeds)


## -----------------------------------------------------------------------------
head(mtcars)

## -----------------------------------------------------------------------------
# get the mean hp by cylinder groups
tapply(mtcars$hp, mtcars$cyl, FUN = mean)


## ----echo=TRUE----------------------------------------------------------------
for(i in 1:dim(CO2)[1]) {
  if(CO2$Type[i] == "Quebec") {
    CO2$uptake[i] <- CO2$uptake[i] - 2
  }
}


## ----echo=TRUE----------------------------------------------------------------
tapply(CO2$uptake, CO2$Type, mean)


## ----eval = FALSE-------------------------------------------------------------
## count <- 0
## 
## for(i in 1:nrow(CO2)) {
##   if(CO2$Treatment[i] == "nonchilled") next
##   # Skip to next iteration if treatment is nonchilled
##   count <- count + 1
## #  print(CO2$conc[i])
## }
## print(count) # The count and print command were performed 42 times.


## ----echo = FALSE-------------------------------------------------------------
count <- 0

for (i in 1:nrow(CO2)) {
  if (CO2$Treatment[i] == "nonchilled") next
  # Skip to next iteration if treatment is nonchilled
  count <- count + 1
}
print(count) # The count and print command were performed 42 times.


## -----------------------------------------------------------------------------
sum(CO2$Treatment == "nonchilled")


## ----eval = FALSE-------------------------------------------------------------
## count <- 0
## i <- 0
## repeat {
##       i <- i + 1
##       if(CO2$Treatment[i] == "nonchilled") next  # skip this loop
##       count <- count + 1
##       print(CO2$conc[i])
##       if(i == nrow(CO2)) break     # stop looping
##     }
## print(count)


## ----eval = FALSE-------------------------------------------------------------
## i <- 0
## count <- 0
## while(i < nrow(CO2))
## {
##   i <- i + 1
##   if(CO2$Treatment[i] == "nonchilled") next  # skip this loop
##   count <- count + 1
##   print(CO2$conc[i])
## }
## print(count)


## -----------------------------------------------------------------------------
data(CO2)


## -----------------------------------------------------------------------------
for(i in 1:nrow(CO2)) {
  if(CO2$Type[i] == "Mississippi") {
    if(CO2$conc[i] < 300) next
    CO2$conc[i] <- CO2$conc[i] - 20
  }
}


## -----------------------------------------------------------------------------
for(i in 1:nrow(CO2)) {
  if(CO2$Type[i] == "Mississippi" && CO2$conc[i] >= 300) {
    CO2$conc[i] <- CO2$conc[i] - 20
  }
}


## ---- eval=F------------------------------------------------------------------
## plot(x = CO2$conc, y = CO2$uptake, type = "n", cex.lab=1.4,
##      xlab = "CO2 concentration", ylab = "CO2 uptake")
## # Type "n" tells R to not actually plot the points.
## for(i in 1:length(CO2[,1])) {
##   if(CO2$Type[i] == "Quebec" & CO2$Treatment[i] == "nonchilled") {
##     points(CO2$conc[i], CO2$uptake[i], col = "red")
##   }
##   if(CO2$Type[i] == "Quebec" & CO2$Treatment[i] == "chilled") {
##     points(CO2$conc[i], CO2$uptake[i], col = "blue")
##   }
##   if(CO2$Type[i] == "Mississippi" & CO2$Treatment[i] == "nonchilled") {
##     points(CO2$conc[i], CO2$uptake[i], col = "orange")
##   }
##   if(CO2$Type[i] == "Mississippi" & CO2$Treatment[i] == "chilled") {
##     points(CO2$conc[i], CO2$uptake[i], col = "green")
##   }
## }


## ---- eval = TRUE, echo = FALSE, fig.height=6, fig.width=7--------------------
plot(x=CO2$conc, y=CO2$uptake, type="n", cex.lab=1.4, xlab="CO2 Concentration", ylab="CO2 Uptake") # Type "n" tells R to not actually plot the points.

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


## ---- echo = -1, fig.height=4-------------------------------------------------
par(mar = c(4, 4.1, 0.5, 0.5))
plot(x = CO2$conc, y = CO2$uptake, type = "n", cex.lab=1.4,
     xlab = "CO2 concentration", ylab = "CO2 uptake")

plants <- unique(CO2$Plant)

for(i in 1:nrow(CO2)){
  for(p in 1:length(plants)) {
    if(CO2$Plant[i] == plants[p]) {
      points(CO2$conc[i], CO2$uptake[i], col = p)
}}}


## -----------------------------------------------------------------------------
operations <- function(number1, number2, number3) {
  result <- (number1 + number2) * number3
  print(result)
}

## -----------------------------------------------------------------------------
operations(1, 2, 3)


## ---- echo=F------------------------------------------------------------------
print_animal <- function(animal) {
  if (animal == "dog") {
    print("woof")
  } else if (animal == "cat") {
    print("meow")
  }
}


## -----------------------------------------------------------------------------
Scruffy <- "dog"
Paws <- "cat"

print_animal(Scruffy)

print_animal(Paws)


## ---- echo=F------------------------------------------------------------------
print_animal <- function(animal) {
  if(animal == "dog") {
    print("woof")
  } else if(animal == "cat") {
    print("meow")
  }
}


## -----------------------------------------------------------------------------
Scruffy <- "dog"
Paws <- "cat"

print_animal(Scruffy)

print_animal(Paws)


## -----------------------------------------------------------------------------
operations <- function(number1, number2, number3 = 3) {
  result <- (number1 + number2) * number3
  print(result)
}

operations(1, 2, 3) # is equivalent to
operations(1, 2)
operations(1, 2, 2) # we can still change the value of number3 if needed


## ---- eval = FALSE------------------------------------------------------------
## plot.CO2 <- function(CO2, ...) {
##   plot(x=CO2$conc, y=CO2$uptake, type="n", ...) #<<
##   for(i in 1:length(CO2[,1])){
##      if(CO2$Type[i] == "Quebec") {
##        points(CO2$conc[i], CO2$uptake[i], col = "red", type = "p", ...) #<<
##      } else if(CO2$Type[i] == "Mississippi") {
##        points(CO2$conc[i], CO2$uptake[i], col = "blue", type = "p", ...) #<<
##      }
##   }
## }
## plot.CO2(CO2, cex.lab=1.2, xlab="CO2 concentration", ylab="CO2 uptake")
## plot.CO2(CO2, cex.lab=1.2, xlab="CO2 concentration", ylab="CO2 uptake", pch=20)


## ---- echo=F, fig.height=4.5, fig.width=10------------------------------------
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
par(mfrow=c(1,2), mar = c(4,4,1,1))
plot.CO2(CO2, cex.lab=1.2, xlab="CO2 concentration", ylab="CO2 uptake")
plot.CO2(CO2, cex.lab=1.2, xlab="CO2 concentration", ylab="CO2 uptake", pch=20)


## -----------------------------------------------------------------------------
sum2 <- function(...) {
  args <- list(...) #<<
  result <- 0
  for(i in args) {
    result <- result + i
  }
  return(result)
}

sum2(2, 3)
sum2(2, 4, 5, 7688, 1)


## -----------------------------------------------------------------------------
myfun <- function(x) {
  if(x < 10) {
    0
  } else {
    10
  }
}

myfun(5)
myfun(15)


## -----------------------------------------------------------------------------
simplefun1 <- function(x) {
  if(x<0)
  return(x)
}


## ----echo = TRUE--------------------------------------------------------------
simplefun2 <- function(x, y) {
  z <- x + y
  return(list("result" = z,
              "x" = x,
              "y" = y))
}


## ---- eval = FALSE------------------------------------------------------------
## simplefun2(1, 2)


## ---- echo = FALSE------------------------------------------------------------
simplefun2(1, 2)


## ---- error = TRUE------------------------------------------------------------
var1 <- 3     # var1 is defined outside our function
vartest <- function() {
  a <- 4      # 'a' is defined inside
  print(a)    # print 'a'
  print(var1) # print var1
}

a             # we cannot print 'a' as it exists only inside the function

vartest()     # calling vartest() will print a and var1

rm(var1)      # remove var1
vartest()     # calling the function again doesn't work anymore


## -----------------------------------------------------------------------------
var1 <- 3     # var1 is defined outside our function
vartest <- function(var1) {
  print(var1) # print var1
}

vartest(8)    # Inside our function var1 is now our argument and takes its value

var1          # var1 still has the same value


## ----eval = FALSE-------------------------------------------------------------
## a <- 3
## if(a > 5) {
##   b <- 2
## }
## 
## a + b


## ----eval = FALSE-------------------------------------------------------------
## # Error: object 'b' not found


## ----eval = FALSE-------------------------------------------------------------
## recalibrate <- function(CO2, type, bias) {
##   for(i in 1:nrow(CO2)) {
##     if(CO2$Type[i] == type) {
##       CO2$conc[i] <- CO2$conc[i] + bias
##     }
##   }
##   return(CO2)
## }
## 


## ----eval = FALSE-------------------------------------------------------------
## newCO2 <- recalibrate(CO2, "Mississipi", -20)
## newCO2 <- recalibrate(newCO2, "Quebec", +50)


## -----------------------------------------------------------------------------
my_function <- function(x) {
  if(x != 0) {
  z <- cos(x)/x
  } else { z <- 1 }
  return(z)
}


## -----------------------------------------------------------------------------
my_function(45)

my_function(20)

my_function(0)

