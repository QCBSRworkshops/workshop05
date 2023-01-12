##Section: 01-preparing-for-the-workshop.R 

###Avis ###
#                                                                            #
#Ceci est un script généré automatiquement basé sur les morceaux de code du  #
#livre pour cet atelier.                                                     #
#                                                                            #
#Il est minimalement annoté pour permettre aux participants de fournir leurs #
#commentaires : une pratique que nous encourageons vivement.                 #
#                                                                            #
#Notez que les solutions aux défis sont également incluses dans ce script.   #
#Lorsque vous résolvez les défis par vous-méme, essayez de ne pas parcourir  #
#le code et de regarder les solutions.                                       #
#                                                                            #
#Bon codage !                                                                #


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
       yes = "oui", 
       no = "non")

a <- (-4):5

sqrt(ifelse(test = a >= 0, 
            yes = a,
            no = NA)
     )





if(2+2) == 4
print("L'arithmétique fonctionne.")
else
print("Houston, we have a problem.")

if(2+2) == 4 
print("L'arithmétique fonctionne.")
else
print("Houston, we have a problem.")

if(2+2 == 4) {
  print("L'arithmétique fonctionne.")
} else {
  print("Houston, we have a problem.")
}

Minou <- "chat"
Pitou <- "chien"
Filou <- "chat"

animaux <- c(Minou, Pitou, Filou)

if(Minou == 'chat') {
  print("meow")
}

x = Minou
# x = Pitou
if(x == 'chat') {
  print("meow")
} else {
  print("woof")
}

animaux <- c(Minou, Pitou, Filou)
ifelse(animaux == 'chien', "woof", "meow")

for(val in 1:3) {
  if(animaux[val] == "chat") {
    print("meow")
  }else if(animaux[val] == "chien") {
    print("woof")
  }else print("quoi?")
}


##Section: 04-iteration.R 

for(a in c("Bonjour",
           "programmeurs et programmeuses",
           "en R")) {
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



data(CO2) # Cela charge le jeu de données intégré

head(CO2)

for(i in 1:length(CO2[,1])) { # pour chaque ligne de l'ensemble de données sur le CO2
  print(CO2$conc[i]) # imprimer la concentration de CO2
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
  # pour chaque ligne dans
  # l'ensemble de données sur le CO2
  print(CO2$conc[i])
  # imprimer la concentration de CO2
  # concentration de CO2
}

for(p in CO2$conc) {
  # pour chaque élément de
  # la colonne "conc" de
  # le CO2 df
  print(p)
  # affiche le p-ième élément
}

for(i in 4:5) { # pour i entre 4 et 5
  print(colnames(CO2)[i])
  print(mean(CO2[,i])) # imprime la moyenne de cette colonne à partir de l'ensemble de données sur le CO2
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
  print("Appuyez sur 'Esc' pour m'arrêter !")
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

operations <- function(numero_1, numero_2, numero_3) {
  resultat <- (numero_1 + numero_2) * numero_3
  print(resultat)
}

operations(1, 2, 3)



Pitou <- "chien"
Minou <- "chat"
print_animal(Pitou)
print_animal(Minou)

print_animal <- function(animal) {
  if (animal == "chien") {
    print("woof")
  } else if (animal == "chat") {
    print("miaou")
  }
}

operations <- function(numero_1, numero_2, numero_3 = 3) {
  resultat <- (numero_1 + numero_2) * numero_3
  print(resultat)
}
operations(1, 2, 3) # est équivalent à
operations(1, 2)
operations(1, 2, 2) # on peut toujours changer la valeur de numero_3

plot.CO2 <- function(CO2, ...) {
  plot(x=CO2$conc, y=CO2$uptake, type="n", ...) # On utilise ... pour passer les arguments a plot().
  for (i in 1:length(CO2[,1])){
     if (CO2$Type[i] == "Quebec") {
       points(CO2$conc[i], CO2$uptake[i], col = "red", type = "p", ...)
     } else if (CO2$Type[i] == "Mississippi") {
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

sum2 <- function(...){
  args <- list(...)
  result <- 0
  for (i in args)  {
    result <- result + i
  }
  return (result)
}

sum2(2, 3)
sum2(2, 4, 5, 7688, 1)

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
  if (result < 50) {
    return(0)
  } else {
    return (result)
  }
}

bigsum <- function(a, b) {
  result <- a + b
  if (result < 50) {
  0
  } else {
  result
  }
}

var1 <- 3     # 'var1' est définie à l'extérieur de la fonction
vartest <- function() {
  a <- 4      # 'a' est définie a l'intérieur
  print(a)    # affiche 'a'
  print(var1) # affiche 'var1'
}

a             # on ne peut pas afficher 'a', car 'a' n'existe qu'à l'intérieur de la fonction

vartest()     # cvartest() affiche 'a' et 'var1'

rm(var1)      # supprime 'var1'
vartest()     # la fonction ne fonctionne plus, car 'var1' n'existe plus!

var1 <- 3     # var1 est définie à l'extérieur de la fonction
vartest <- function(var1) {
  print(var1) # affiche var1
}

vartest(8)    # Dans notre fonction, var1 est maintenant notre argument et prend sa valeur

var1          # var1 a toujours la même valeur à l'extérieur de la fonction

a <- 3
if (a > 5) {
  b <- 2
}

a + b

# Error: object 'b' not found

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

# Recalibre le jeu de données CO2 en modifiant la concentration de CO2
# d'une valeur fixe selon la region
# Arguments
# CO2: the CO2 dataset
# type: the type ("Mississippi" or "Quebec") that need to be recalibrated.
# bias: the amount to add or remove to the concentration
recalibrate <- function(CO2, type, bias) {
  for (i in 1:nrow(CO2)) {
    if(CO2$Type[i] == type) {
      CO2$conc[i] <- CO2$conc[i] + bias
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




