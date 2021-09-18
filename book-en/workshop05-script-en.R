##Section: 01-preparing-for-the-workshop.R 

install.packages("DiagrammeR")

library(DiagrammeR)


##Section: 02-control-flow.R 

library(DiagrammeR)

#Create node data frame
f1_nodes <- create_node_df(n = 4, #number of nodes
                           type = 'a', #for grouping
                           label = c("Start\nprogram", "Process\n(operations carried out\ne.g. data manipulation)", "Decision", "End\nprogram"), #words inside node
                           shape = c("rectangle", "rectangle", 'diamond', 'rectangle'), #shape of node
                           style = c('rounded', 'solid', 'solid', 'rounded'), #line style around nodes
                           fontname = 'Helvetica',
                           fontsize = 10,
                           fixedsize = FALSE, #whether node changes size based on label or is fixed
                           color = 'mediumblue',
                           height = 0.70
                           )


#create edges
##DiagrammeR does not handle NA's in edge labels well, so NAs are ' ' here.
f1_edges <- create_edge_df(from = c(1, 2, 3, 3), #origin node id
                           to = c(2, 3, 2, 4),
                           tailport = c("e", "e", "s", "e"),
                           headport = c("w", "w", "s", "w"),
                           label = c(' ', ' ', 'Boolean choice:\nTRUE or FALSE', ' '), #for text on edge
                           fontsize = 10,
                           color = 'dimgrey'
                           )

#create flowchart
flowchart1 <- create_graph(
                    nodes_df = f1_nodes,
                    edges_df = f1_edges,
                    directed = TRUE, #arrows vs straight lines
                    attr_theme = 'lr' #left to right specified
                    )

#display flowchart
render_graph(flowchart1, width = '95%', height = 'auto')



##Section: 03-decision-making.R 

if(condition) {
  expression
}

#Create node data frame
f2_nodes <- create_node_df(n = 4, #number of nodes
                           type = 'a', #for grouping
                           label = c(" ", "Condition", "Expression", " "), 
                           shape = c("circle", "diamond", 'rectangle', 'circle'), 
                           style = c('rounded', 'solid', 'solid', 'filled'), 
                           fontname = 'Helvetica',
                           fontsize = 10,
                           fixedsize = FALSE,
                           color = 'mediumblue',
                           width = .1
                           )


#create edges
f2_edges <- create_edge_df(from = c(1, 2, 2, 3), #origin node id
                           to = c(2, 3, 4, 4), 
                           label = c(' ', '  if TRUE', '  if FALSE', ' '), 
                           fontsize = 10,
                           color = 'dimgrey',
                           decorate = TRUE,
                           tailport = c('s', 'w', 's'),
                           headport = c('n', 'n', 'n')
                           )

#create flowchart
flowchart2 <- create_graph(
                    nodes_df = f2_nodes,
                    edges_df = f2_edges,
                    directed = TRUE, 
                    attr_theme = 'tb' 
                    )

#display flowchart
render_graph(flowchart2, width = '45%', height = 'auto')

if(condition) {
  expression 1
} else {
  expression 2
}

ifelse(condition,
       expression 1,
       expression 2
)

#Create node data frame
f3_nodes <- create_node_df(n = 5, #number of nodes
                           type = 'a', #for grouping
                           label = c(" ", "Condition", "Expression 1\nif body", " ", "Expression 2\nelse body"), 
                           shape = c("circle", "diamond", 'rectangle', 'circle', 'rectangle'), 
                           style = c('rounded', 'solid', 'solid', 'filled', 'solid'), 
                           fontname = 'Helvetica',
                           fontsize = 10,
                           fixedsize = FALSE,
                           color = 'mediumblue',
                           width = .1
                           )


#create edges
f3_edges <- create_edge_df(from = c(1, 2, 2, 3, 5), #origin node id
                           to = c(2, 3, 5, 4, 4), 
                           label = c(' ', ' if TRUE', '  if FALSE', ' '), 
                           fontsize = 10,
                           color = 'dimgrey',
                           decorate = TRUE,
                           tailport = c('s', 'w', 's', 's', 's'), #where edge leaves node
                           headport = c('n', 'n', 'n', 'n', 'n') #where arrow meets node
                           )

#create flowchart
flowchart3 <- create_graph(
                    nodes_df = f3_nodes,
                    edges_df = f3_edges,
                    directed = TRUE, 
                    attr_theme = 'tb' 
                    )

#display flowchart
render_graph(flowchart3, width = '50%', height = 'auto')

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

if(test_expression1) {
  statement1
} else if(test_expression2) {
  statement2
} else if(test_expression3) {
  statement3
} else {
  statement4
}

#note this one might turn out better in diagraph / DOT language, 'rank = same' seems broken without DOT
#Create node data frame
f4_nodes <- create_node_df(n = 9, #number of nodes
                           group = c('a','b','b','b','c','c','c','c','a'),
                           label = c("Start", "Condition 1", "Condition 2", "Condition 3", 
                                     "Expression 1", "Expression 2", "Expression 3", "Expression 4",  "End"), 
                           shape = c("circle", "diamond", "diamond", "diamond", 
                                     'rectangle', 'rectangle','rectangle', 'rectangle', 'circle'), 
                           style = c('solid', 'solid', 'solid', 'solid', 
                                     'solid', 'solid', 'solid', 'solid', 'filled'), 
                           fontname = 'Helvetica',
                           fontsize = 12,
                           fixedsize = FALSE,
                           color = 'mediumblue',
                           width = .1
                           )


#create edges
f4_edges <- create_edge_df(from = c(1, 2, 2, 3, 3, 4, 4, 5, 6, 7, 8), #origin node id
                           to = c(2, 3, 5, 4, 6, 7, 8, 9, 9, 9, 9), 
                           label = c(' ', '  if FALSE', '  if TRUE', ' if FALSE', '  if TRUE', ' if FALSE', ' if TRUE',
                                     ' ', ' ', ' ', ' '), 
                           fontsize = 10,
                           color = 'dimgrey',
                           decorate = TRUE,
                           rel = c('a','b','c', 'b', 'c', 'c', 'd', 'd', 'd', 'd,'),
                           tailport = c('s', 'e', 's', 'e', 's', 'e', 's'), #where edge leaves node
                           headport = c('n', 'n', 'n', 'n', 'n', 'n', 'n') #where arrow meets node
                           )

#create flowchart
flowchart4 <- create_graph(
                    nodes_df = f4_nodes,
                    edges_df = f4_edges,
                    directed = TRUE,
                    attr_theme = 'tb'
                    )

#display flowchart
render_graph(flowchart4, width = '75%', height = 'auto')

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

for() {}
while() {}
repeat {}

break
next

#Create node data frame
f5_nodes <- create_node_df(n = 4, #number of nodes
                           type = 'a', #for grouping
                           label = c(" ", "Last item\nreached?", "expression\nfor() \nbody", "  "), 
                           shape = c("circle", "diamond", 'rectangle', 'circle'), 
                           style = c('solid', 'solid', 'solid', 'filled'), 
                           fontname = 'Helvetica',
                           fontsize = 10,
                           fixedsize = FALSE,
                           color = 'mediumblue',
                           width = .1
                           )


#create edges
f5_edges <- create_edge_df(from = c(1, 2, 2, 3), #origin node id
                           to = c(2, 3, 4, 2), 
                           label = c(' ', ' if FALSE', '  if TRUE, exit loop', ' '), 
                           fontsize = 10,
                           color = 'dimgrey',
                           decorate = TRUE,
                           tailport = c('s', 'w', 'e', 'e'),
                           headport = c('n', 'w', 'n', 's')
                           )

#create flowchart
flowchart5 <- create_graph(
                    nodes_df = f5_nodes,
                    edges_df = f5_edges,
                    directed = TRUE, 
                    attr_theme = 'tb' 
                    )

#display flowchart
render_graph(flowchart5, width = '35%', height = 'auto')

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

for(i in 1:5) {
  expression
}

for(m in 1:10) {
  print(m*2)
}

for(m in 1:5) {
  print(m*2)
}

for(m in 6:10) {
  print(m*2)
}

x <- c(2,5,3,9,6)
count <- 0
for (val in x) {
  if(val %% 2 == 0) {
    count = count+1
  }
}
print(count)

data(CO2) # This loads the built in dataset

for (i in 1:length(CO2[,1])) { # for each row in the CO2 dataset
  print(CO2$conc[i]) # print the CO2 concentration
}

for (i in 1:length(CO2[,1])) { # for each row in the CO2 dataset
  if(CO2$Type[i] == "Quebec") { # if the type is "Quebec"
    print(CO2$conc[i]) # print the CO2 concentration
    }
}

for (i in 1:nrow(CO2)) { # for each row in the CO2 dataset
  print(CO2$conc[i]) # print the CO2 concentration
}

for (p in 1:CO2$conc) { # for each row of the column "conc"of the CO2 df
  print(p) # print the p-th element
}

for (i in 4:5) { # for i in 4 to 5
  print(colnames(CO2)[i])
  print(mean(CO2[,i])) # print the mean of that column from the CO2 dataset
}

for (i in 1:3) {
  for (n in 1:3) {
    print (i*n)
  }
}

(height <- matrix(c(1:10, 21:30),
                 nrow = 5,
                 ncol = 4))
}
apply(X = height,
      MARGIN = 1,
      FUN = mean)
?apply

SimulatedData <- list(
  SimpleSequence = 1:4,
  Norm10 = rnorm(10),
  Norm20 = rnorm(20, 1),
  Norm100 = rnorm(100, 5))

# Apply mean to each element
of the list
lapply(SimulatedData, mean)

SimulatedData <- list(SimpleSequence = 1:4,
             Norm10 = rnorm(10),
             Norm20 = rnorm(20, 1),
             Norm100 = rnorm(100, 5))

# Apply mean to each element of the list
lapply(SimulatedData, mean)

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

break
next

for(val in x) {
  if(condition) { break }
  statement
}

for(val in x) {
  if(condition) { next }
  statement
}

count <- 0

for (i in 1:nrow(CO2)) {
  if (CO2$Treatment[i] == "nonchilled") next
  # Skip to next iteration if treatment is nonchilled
  count <- count + 1
#  print(CO2$conc[i])
}
print(count) # The count and print command were performed 42 times.

sum(CO2$Treatment == "nonchilled")

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

plot(x = CO2$conc, y = CO2$uptake, type = "n", cex.lab=1.4, xlab = "CO2 concentration", ylab = "CO2 uptake") # Type "n" tells R to not actually plot the points.
plants <- unique(CO2$Plant)

for (i in 1:nrow(CO2)){ for (p in 1:length(plants)) { if (CO2$Plant[i] == plants[p]) { points(CO2$conc[i],
 CO2$uptake[i],
col = p) } } }

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

library(DiagrammeR)
#Create node data frame
f9_nodes <- create_node_df(n = 5, #number of nodes
                           group = c('a', 'a', 'a', 'b', 'c'),
                           label = c("Argument 1", "Argument 2",
                                     "Argument 3", "Data processing\nFunction", 'Return value'), 
                           shape = c("none", "none", 'none', 'rectangle', 'none'), #shape of node
                           style = c('none', 'none', 'none', 'rounded', 'none'), #line style around nodes
                           fontname = 'Helvetica',
                           fontsize = 10,
                           fixedsize = FALSE, #whether node changes size based on label or is fixed
                           color = 'mediumblue'
                           )
#create edges
##DiagrammeR doesn't handle NA's in edge labels well, so NAs are ' ' here.
f9_edges <- create_edge_df(from = c(1, 2, 3, 4), #origin node id
                           to = c(4, 4, 4, 5),
                           style = c('solid', 'solid', 'solid', 'dashed'),
                           fontsize = 10,
                           color = 'dimgrey',
                           headport = c('w', 'w', 'w', 'w'),
                           tailport = c('e', 'e', 'e', 'e')
                           )
#create flowchart
flowchart9 <- create_graph(
                    nodes_df = f9_nodes,
                    edges_df = f9_edges,
                    directed = TRUE, #arrows vs straight lines
                    attr_theme = 'lr' #left to right specified
                    )
#display flowchart
render_graph(flowchart9, 
             width = '95%', 
             height = 'auto')

operations <- function(number1, number2, number3) {
  result <- (number1 + number2) * number3
  print(result)
}

operations(1, 2, 3)

print_animal <- function(animal) {
  if (animal == "dog") {
    print("woof")
  } else if (animal == "cat") {
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

Scruffy <- "dog"
Paws <- "cat"
print_animal(Scruffy)
print_animal(Paws)

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

out_val <- 3 
vartest <- function() {
  in_val <- 4  
  print(in_val)
  print(out_val)
}
vartest()
in_val; out_val

out_val_2 <- 3
vartest <- function(out_val_2) {
  print(out_val_2)
}
vartest(8)
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




