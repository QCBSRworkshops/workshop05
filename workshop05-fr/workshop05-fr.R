## ----setup, echo = FALSE, include = FALSE----
knitr::opts_chunk$set(
	fig.align = "center",
	fig.height = 6,
	fig.retina = 3,
	fig.width = 6,
	message = FALSE,
	warning = FALSE,
	collapse = TRUE,
	comment = "#"
)
options(repos=structure(c(CRAN="http://cran.r-project.org")))

if (!require("DiagrammeR")) install.packages("DiagrammeR")
library(DiagrammeR)


## ----echo = FALSE, results = "asis"----
bge <- qcbsRworkshops::get_badges(5, style = "for-the-badge", clip = FALSE,
lang = "fr", show = FALSE)
cat(bge[-1L])


## ---------------------------
  num.vector <- c(1, 4, 3, 
                  9, 32, -4)
  num.vector


## ---------------------------
char_vector <- c("bleu", 
                 "rouge", 
                 "vert")
char_vector


## ---------------------------
bool_vector <- c(TRUE, TRUE, FALSE) # ou c(T, T, F)
bool_vector


## ---------------------------
  siteID <- c("A1.01", "A1.02", "B1.01", "B1.02")
  soil_pH <- c(5.6, 7.3, 4.1, 6.0)
  num.sp <- c(17, 23, 15, 7)
  treatment <- c("Fert", "Fert", "No_fert", "No_fert")


## ---------------------------
  my.first.df <- data.frame(siteID, soil_pH, num.sp, treatment)

## ---------------------------
  my.first.df


## ---------------------------
  my.first.list <- list(siteID, soil_pH, num.sp, treatment)


## ---------------------------
  my.first.list


## ----flowchart1, echo=FALSE----
library(DiagrammeR)
#Create node data frame
f1_nodes <- create_node_df(n = 4, #number of nodes
                           type = 'a', #for grouping
                           label = c("Début\n du programme", "Processus \n(opérations effectuées \ne.g., manipulation des données)", "Décision", "Fin\n du programme"), #words inside node
                           shape = c("rectangle", "rectangle", 'diamond', 'rectangle'), #shape of node
                           style = c('rounded', 'solid', 'solid', 'rounded'), #line style around nodes
                           fontname = 'Helvetica',
                           fontsize = 10,
                           fixedsize = FALSE, #whether node changes size based on label or is fixed
                           color = 'mediumblue',
                           height = 0.70
                           )


#create edges
##DiagrammeR doesn't handle NA's in edge labels well, so NAs are ' ' here.
f1_edges <- create_edge_df(from = c(1, 2, 3, 3), #origin node id
                           to = c(2, 3, 2, 4),
                           tailport = c("e", "e", "s", "e"),
                           headport = c("w", "w", "s", "w"),
                           label = c(' ', ' ', 'Choix booléen:\nTRUE ou FALSE', ' '), #for text on edge
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
render_graph(flowchart1, 
             width = '95%', height = 'auto')



## ----flowchart2, echo=FALSE----
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
                           label = c(' ', ' if TRUE', '  if FAUX', ' '), 
                           fontsize = 10,
                           color = 'dimgrey',
                           decorate = TRUE
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


## ----flowchart3, echo=FALSE----
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
                           decorate = TRUE
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


## ----flowchart4, echo=FALSE----
#note this one might turn out better in diagraph / DOT language, 'rank = same' seems broken without DOT
#Create node data frame
f4_nodes <- create_node_df(n = 9, #number of nodes
                           group = c('a','b','b','b','c','c','c','c','a'),
                           label = c(" ", "Condition 1", "Condition 2", "Condition 3", 
                                     "Expression 1", "Expression 2", "Expression 3", "Expression 4",  " "), 
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
                           label = c(' ', ' if FALSE', '  if TRUE', ' if FALSE', ' if TRUE', ' if FALSE', ' if TRUE',
                                     ' ', ' ', ' ', ' '), 
                           fontsize = 10,
                           color = 'dimgrey',
                           decorate = TRUE,
                           rel = c('a','b','c', 'b', 'c', 'c', 'd', 'd', 'd', 'd,'),
                           tailport = c('s', 'se', 'sw', 'se', 'sw', 'se', 's'), #where edge leaves node
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


## ---------------------------
Minou <- "chat"
Pitou <- "chien"
Filou <- "chat"
animaux <- c(Minou, Pitou, Filou)


## ---------------------------
if(Minou == 'chat') {
  print("meow")
}


## ---------------------------
x = Minou
# x = Pitou
if(x == 'chat') {
  print("meow")
} else {
  print("woof")
}


## ---------------------------
animaux <- c(Minou, Pitou, Filou)

ifelse(animaux == 'chien', "woof", "meow")


## ---------------------------
for(val in 1:3) {
  if(animaux[val] == "chat") {
    print("meow")
  }else if(animaux[val] == "chien") {
    print("woof")
  }else print("quoi?")
}


## ---------------------------
if (2+2 == 4) { #<<
  print("Les maths, c'est logique!")
} else { #<<
  print("Houston, on a un problème.")
} #<<


## ----flowchart5for-loop, echo=FALSE----
#Create node data frame
f5_nodes <- create_node_df(n = 4, #number of nodes
                           type = 'a', #for grouping
                           label = c(" ", "Last item\nreached?", "Expression\nFOR body", "Exit\nLoop"), 
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
                           label = c(' ', ' if FALSE', '  if TRUE', ' '), 
                           fontsize = 10,
                           color = 'dimgrey',
                           decorate = TRUE,
                           tailport = c('s', 'w', 'e', 'e')
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


## ----echo=FALSE-------------
for(m in 1:5) {
  print(m*2)
}


## ----echo=FALSE-------------
for(m in 6:10) {
  print(m*2)
}


## ----flowchart6for-loop2, echo=FALSE----
#Create node data frame
f6_nodes <- create_node_df(n = 6, #number of nodes
                           type = 'a', #for grouping
                           label = c("x", "Last VAL\nin X?", "Is VAL even?", 'count = count + 1',
                                     'End', "Print\ncount"), 
                           shape = c("circle", "diamond", 'diamond', 'rectangle', 'circle', 'circle'), 
                           style = c('solid', 'solid', 'solid', 'solid', 'solid', 'filled'), 
                           fontname = 'Helvetica',
                           fontsize = 10,
                           fixedsize = FALSE,
                           color = 'mediumblue',
                           width = .1
                           )


#create edges
f6_edges <- create_edge_df(from = c(1, 2, 2, 3, 3, 4, 5), #origin node id
                           to = c(2, 3, 6, 4, 5, 5, 2), 
                           label = c(' ', ' if FALSE\nfor Xi', '  if TRUE,\nexit loop', ' if TRUE', 'if FALSE', ' ', ' '), 
                           fontsize = 10,
                           color = 'dimgrey',
                           decorate = FALSE,
                           tailport = c('e', 'e', 's', 'e', 'ne', 'e', 'n'),
                           headport = c('w', 'w', 'w', 'w', 'w', 's', 'n')
                           )

#create flowchart
flowchart6 <- create_graph(
                    nodes_df = f6_nodes,
                    edges_df = f6_edges,
                    directed = TRUE, 
                    attr_theme = 'lr' 
                    )

#display flowchart
render_graph(flowchart6, width = '90%', height = 'auto')


## ----echo = FALSE-----------
for (i in 4:5) { # pour i de 4 à 5
  print(colnames(CO2)[i])
  print(mean(CO2[,i])) # affiche les moyennes de cette colonne
}


## ----echo = -c(2:5)---------
# Sortie

for (i in 1:3) {
  for (n in 1:3) {
    print (i*n)
  }
}


## ---------------------------
(hauteur <- matrix(c(1:10, 21:30),
            nrow = 5,
            ncol = 4))



## ---------------------------
apply(X = hauteur,
      MARGIN = 1,
      FUN = mean)



## ----eval = FALSE-----------
## SimulatedData <- list(
##   SimpleSequence = 1:4,
##   Norm10 = rnorm(10),
##   Norm20 = rnorm(20, 1),
##   Norm100 = rnorm(100, 5))
## 
## # Applique mean() sur chaque élément de la liste
## lapply(SimulatedData, mean)


## ----echo=FALSE-------------
SimulatedData <- list(SimpleSequence = 1:4,
             Norm10 = rnorm(10),
             Norm20 = rnorm(20, 1),
             Norm100 = rnorm(100, 5))

# Applique mean() sur chaque élément de la liste
lapply(SimulatedData, mean)


## ----eval = TRUE------------
SimulatedData <- list(SimpleSequence = 1:4,
             Norm10 = rnorm(10),
             Norm20 = rnorm(20, 1),
             Norm100 = rnorm(100, 5))

## ---------------------------
# Applique mean() sur chaque élément de la liste
sapply(SimulatedData, mean)


## ---------------------------
lilySeeds <- c(80, 65, 89, 23, 21)
poppySeeds <- c(20, 35, 11, 77, 79)

## ---------------------------
# Output
mapply(sum, lilySeeds, poppySeeds)


## ---------------------------
head(mtcars)

## ---------------------------
# obtient la moyenne de hp par groupe de cylindres
tapply(mtcars$hp, mtcars$cyl, FUN = mean)


## ----echo=TRUE--------------
for (i in 1:dim(CO2)[1]) {
  if(CO2$Type[i] == "Quebec") {
    CO2$uptake[i] <- CO2$uptake[i] - 2
  }
}


## ----echo=TRUE--------------
tapply(CO2$uptake, CO2$Type, mean)


## ----flowchart7break, echo=FALSE----
#Create node data frame
f7_nodes <- create_node_df(n = 5, #number of nodes
                           type = 'a', #for grouping
                           label = c(" ", "Last VAL\nin X?", "Is condition true?\nBREAK",
                                     'Statement\nBody of FOR loop', "Exit\nLoop"), 
                           shape = c("circle", "diamond", 'diamond', 'rectangle', 'circle', 'circle'), 
                           style = c('solid', 'solid', 'solid', 'solid', 'filled'), 
                           fontname = 'Helvetica',
                           fontsize = 10,
                           fixedsize = FALSE,
                           color = 'mediumblue',
                           width = .1
                           )


#create edges
f7_edges <- create_edge_df(from = c(1, 2, 3, 4, 2, 3), #origin node id
                           to = c(2, 3, 4, 2, 5, 5), 
                           label = c(' ', ' if FALSE\nfor Xi', '  if FALSE', ' ', 'if TRUE', ' if TRUE'), 
                           fontsize = 10,
                           color = 'dimgrey',
                           decorate = FALSE,
                           tailport = c('e', 'e', 'se', 'w', 'ne', 'e'),
                           headport = c('w', 'w', 'nw', 'se', 'w', 'w')
                           )

#create flowchart
flowchart7 <- create_graph(
                    nodes_df = f7_nodes,
                    edges_df = f7_edges,
                    directed = TRUE, 
                    attr_theme = 'lr' 
                    )

#display flowchart
render_graph(flowchart7, width = '95%', height = 'auto')


## ----flowchart8next, echo=FALSE----
#Create node data frame
f8_nodes <- create_node_df(n = 5, #number of nodes
                           type = 'a', #for grouping
                           label = c(" ", "Last VAL\nin X?", "Is condition true?\nNEXT",
                                     'Statement\nBody of FOR loop', "Exit\nLoop"), 
                           shape = c("circle", "diamond", 'diamond', 'rectangle', 'circle', 'circle'), 
                           style = c('solid', 'solid', 'solid', 'solid', 'filled'), 
                           fontname = 'Helvetica',
                           fontsize = 10,
                           fixedsize = FALSE,
                           color = 'mediumblue',
                           width = .1
                           )


#create edges
f8_edges <- create_edge_df(from = c(1, 2, 3, 4, 2, 3), #origin node id
                           to = c(2, 3, 4, 2, 5, 2), 
                           label = c(' ', ' if FALSE\nfor Xi', '  if FALSE', ' ', 'if TRUE', ' if TRUE'), 
                           fontsize = 10,
                           color = 'dimgrey',
                           decorate = FALSE,
                           tailport = c('e', 'e', 'e', 's', 'ne', 's'),
                           headport = c('w', 'w', 'nw', 's', 'w', 's')
                           )

#create flowchart
flowchart8 <- create_graph(
                    nodes_df = f8_nodes,
                    edges_df = f8_edges,
                    directed = TRUE, 
                    attr_theme = 'lr' 
                    )

#display flowchart
render_graph(flowchart8, width = '95%', height = 'auto')


## ----eval = FALSE-----------
## count <- 0
## 
## for (i in 1:nrow(CO2)) {
##   if (CO2$Treatment[i] == "nonchilled") next
##   # Passer à l'itération suivante si c'est "nonchilled"
##   count <- count + 1
##   print(CO2$conc[i])
## }
## print(count) # Affiche le nombre d'itérations accomplies.


## ----echo = FALSE-----------
count <- 0

for (i in 1:nrow(CO2)) {
  if (CO2$Treatment[i] == "nonchilled") next
  # Passer à l'itération suivante si c'est "nonchilled"
  count <- count + 1
}
print(count) # Les fonctions count et print ont été exécutées 42 fois.


## ---------------------------
sum(CO2$Treatment == "nonchilled")


## ----eval = FALSE-----------
## count <- 0
## i <- 0
## repeat {
##       i <- i + 1
##       if (CO2$Treatment[i] == "nonchilled") next  # sauter cette itération
##       count <- count + 1
##       print(CO2$conc[i])
##       if (i == nrow(CO2)) break     # rompre la boucle
##     }
## print(count)


## ----eval = FALSE-----------
## i <- 0
## count <- 0
## while (i < nrow(CO2))
## {
##   i <- i + 1
##   if (CO2$Treatment[i] == "nonchilled") next  # sauter cette itération
##   count <- count + 1
##   print(CO2$conc[i])
## }
## print(count)


## ---------------------------
data(CO2)


## ---------------------------
for (i in 1:nrow(CO2)) {
  if(CO2$Type[i] == "Mississippi") {
    if(CO2$conc[i] < 300) next
    CO2$conc[i] <- CO2$conc[i] - 20
  }
}


## ---------------------------
for (i in 1:nrow(CO2)) {
  if(CO2$Type[i] == "Mississippi" && CO2$conc[i] >= 300) {
    CO2$conc[i] <- CO2$conc[i] - 20
  }
}


## ---- eval=F----------------
## plot(x = CO2$conc, y = CO2$uptake, type = "n", cex.lab=1.4,
##      xlab = "CO2 concentration", ylab = "CO2 uptake")
## # Type "n" dit à R de ne pas afficher les points
## for (i in 1:length(CO2[,1])) {
##   if (CO2$Type[i] == "Quebec" & CO2$Treatment[i] == "nonchilled") {
##     points(CO2$conc[i], CO2$uptake[i], col = "red")
##   }
##   if (CO2$Type[i] == "Quebec" & CO2$Treatment[i] == "chilled") {
##     points(CO2$conc[i], CO2$uptake[i], col = "blue")
##   }
##   if (CO2$Type[i] == "Mississippi" & CO2$Treatment[i] == "nonchilled") {
##     points(CO2$conc[i], CO2$uptake[i], col = "orange")
##   }
##   if (CO2$Type[i] == "Mississippi" & CO2$Treatment[i] == "chilled") {
##     points(CO2$conc[i], CO2$uptake[i], col = "green")
##   }
## }


## ---- eval = TRUE, echo = FALSE, fig.height=7, fig.width=7----
plot(x=CO2$conc, y=CO2$uptake, type="n", cex.lab=1.4, xlab="CO2 Concentration", ylab="CO2 Uptake") # Type "n" dit à R de ne pas afficher les points

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


## ---- echo = -1, fig.height=4----
par(mar = c(4, 4.1, 0.5, 0.5))
plot(x = CO2$conc, y = CO2$uptake, type = "n", cex.lab=1.4,
     xlab = "CO2 concentration", ylab = "CO2 uptake")

plants <- unique(CO2$Plant)

for (i in 1:nrow(CO2)){
  for (p in 1:length(plants)) {
    if (CO2$Plant[i] == plants[p]) {
      points(CO2$conc[i], CO2$uptake[i], col = p)
}}}


## ----flowchart9, echo=FALSE----
library(DiagrammeR)
#Create node data frame
f9_nodes <- create_node_df(n = 5, #number of nodes
                           group = c('a', 'a', 'a', 'b', 'c'),
                           label = c("Argument 1", "Argument 2",
                                     "Argument 3", "Data processing", 'Return value'), 
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
                           color = 'dimgrey'
                           )

#create flowchart
flowchart9 <- create_graph(
                    nodes_df = f9_nodes,
                    edges_df = f9_edges,
                    directed = TRUE, #arrows vs straight lines
                    attr_theme = 'lr' #left to right specified
                    )

#display flowchart
render_graph(flowchart9, width = '95%', height = 'auto')



## ---------------------------
operations <- function(number1, number2, number3) {
  result <- (number1 + number2) * number3
  print(result)
}

## ---------------------------
operations(1, 2, 3)


## ---- echo=F----------------
print_animal <- function(animal) {
  if (animal == "dog") {
    print("woof")
  } else if (animal == "cat") {
    print("meow")
  }
}


## ---------------------------
Scruffy <- "dog"
Paws <- "cat"

print_animal(Scruffy)

print_animal(Paws)


## ---------------------------
operations <- function(number1, number2, number3 = 3) {
  result <- (number1 + number2) * number3
  print(result)
}

operations(1, 2, 3) # est équivalent à
operations(1, 2)
operations(1, 2, 2) # on peut toujours changer la valeur de number3


## ---- eval = FALSE----------
## plot.CO2 <- function(CO2, ...) {
##   plot(x=CO2$conc, y=CO2$uptake, type="n", ...) # On utilise ... pour passer les arguments a plot().
##   for (i in 1:length(CO2[,1])){
##      if (CO2$Type[i] == "Quebec") {
##        points(CO2$conc[i], CO2$uptake[i], col = "red", type = "p", ...) #<<
##      } else if (CO2$Type[i] == "Mississippi") {
##        points(CO2$conc[i], CO2$uptake[i], col = "blue", type = "p", ...) #<<
##      }
##   }
## }
## plot.CO2(CO2, cex.lab=1.2, xlab="Concentration CO2", ylab="CO2 uptake")
## plot.CO2(CO2, cex.lab=1.2, xlab="Concentration CO2", ylab="CO2 uptake", pch=20)


## ---- echo=F, fig.height=4.5, fig.width=10----
plot.CO2 <- function(CO2, ...) {
  plot(x = CO2$conc, y = CO2$uptake, type = "n", ...)

  for (i in 1:length(CO2[,1])){
     if (CO2$Type[i] == "Quebec") {
       points(CO2$conc[i], CO2$uptake[i], col="red", type="p", ...)
     } else if (CO2$Type[i] == "Mississippi") {
       points(CO2$conc[i], CO2$uptake[i], col="blue", type="p", ...)
     }
  }
}
par(mfrow=c(1,2), mar = c(4,4,1,1))
plot.CO2(CO2, cex.lab=1.2, xlab="CO2 concentration", ylab="CO2 uptake")
plot.CO2(CO2, cex.lab=1.2, xlab="CO2 concentration", ylab="CO2 uptake", pch=20)


## ---------------------------
sum2 <- function(...){
  args <- list(...) #<<
  result <- 0
  for (i in args)  {
    result <- result + i
  }
  return (result)
}

sum2(2, 3)
sum2(2, 4, 5, 7688, 1)


## ---------------------------
myfun <- function(x) {
  if (x < 10) {
    0
  } else {
    10
  }
}

myfun(5)
myfun(15)


## ---------------------------
simplefun1 <- function(x) {
  if (x<0)
  return(x)
}


## ----echo = TRUE------------
simplefun2 <- function(x, y) {
  z <- x + y
  return(list("result" = z,
              "x" = x,
              "y" = y))
}


## ---- eval = FALSE----------
## simplefun2(1, 2)


## ---- echo = FALSE----------
simplefun2(1, 2)


## ---- error = TRUE----------
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


## ---------------------------
var1 <- 3     # var1 est définie à l'extérieur de la fonction
vartest <- function(var1) {
  print(var1) # affiche var1
}

vartest(8)    # Dans notre fonction, var1 est maintenant notre argument et prend sa valeur

var1          # var1 a toujours la même valeur à l'extérieur de la fonction


## ----eval = FALSE-----------
## a <- 3
## if (a > 5) {
##   b <- 2
## }
## 
## a + b


## ----eval = FALSE-----------
## # Error: object 'b' not found


## ----eval = FALSE-----------
## recalibrate <- function(CO2, type, bias){
##   for (i in 1:nrow(CO2)) {
##     if(CO2$Type[i] == type) {
##       CO2$conc[i] <- CO2$conc[i] + bias
##     }
##   }
##   return(CO2)
## }
## 


## ----eval = FALSE-----------
## newCO2 <- recalibrate(CO2, "Mississipi", -20)
## newCO2 <- recalibrate(newCO2, "Quebec", +50)

