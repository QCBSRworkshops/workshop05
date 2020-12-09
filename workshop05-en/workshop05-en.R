## ----setup, echo = FALSE, 	include = FALSE----
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
show = FALSE)
cat(bge[-1L])


## ---------------------------
num.vector <- c(1, 4, 3, 
                9, 32, -4)
num.vector


## ---------------------------
char_vector <- c("blue", 
                 "red", 
                 "green")
char_vector


## ---------------------------
bool_vector <- c(TRUE, TRUE, FALSE) # or c(T, T, F)
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
##DiagrammeR doesn't handle NA's in edge labels well, so NAs are ' ' here.
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


## ---- echo = c(-1)----------
options(width = 30)
a <- 1:10

ifelse(test = a > 5, 
       yes = "yes", 
       no = "no")


## ---------------------------
a <- (-4):5

sqrt(ifelse(test = a >= 0, 
            yes = a,
            no = NA)
     )


## ---- eval = FALSE----------
## if(test_expression1) {
##   statement1
## } else if(test_expression2) {
##   statement2
## } else if(test_expression3) {
##   statement3
## } else {
##   statement4
## }


## ----flowchart4, echo=FALSE----
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


## ----bad-ifelse, eval = FALSE----
## if(2+2) == 4
## print("Arithmetic works.")
## else
## print("Houston, we have a problem.")


## ----bad-ifelse-out, echo = FALSE, error = TRUE----
if(2+2) == 4 
print("Arithmetic works.")
else 
print("Houston, we have a problem.")


## ---------------------------
if(2+2 == 4) { #<<
  print("Arithmetic works.")
} else { #<<
  print("Houston, we have a problem.")
} #<<


## ---------------------------
Paws <- "cat"
Scruffy <- "dog"
Sassy <- "cat"
animals <- c(Paws, Scruffy, Sassy)


## ---------------------------
if(Paws == 'cat') {
  print("meow")
}


## ---------------------------
x = Paws
# x = Scruffy
if(x == 'cat') {
  print("meow")
} else {
  print("woof")
}


## ---------------------------
animals <- c(Paws, Scruffy, Sassy)

ifelse(animals == 'dog', "woof", "meow")


## ---------------------------
for(val in 1:3) {
  if(animals[val] == 'cat') {
    print("meow")
  } else if(animals[val] == 'dog') {
    print("woof")
  } else print("what?")
}


## ----flowchart5for-loop, echo = FALSE----
#Create node data frame
f5_nodes <- create_node_df(n = 4, #number of nodes
                           type = 'a', #for grouping
                           label = c(" ", "Last item\nreached?", "Expression\nfor() \nbody", "Exit\nLoop"), 
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


## ----eval = FALSE-----------
## for(a in c("Hello",
##            "R",
##            "Programmers")) {
##   print(a)
## }


## ----eval = FALSE-----------
## for(z in 1:4) {
##   a <- rnorm(n = 1,
##              mean = 5 * z,
##              sd = 2)
##   print(a)
## }


## ----echo = FALSE-----------
for(a in c("Hello", "R", "Programmers")) {
  print(a)
}


## ----echo = FALSE-----------
for(z in 1:4) {
  a <- rnorm(n = 1, 
             mean = 5 * z, 
             sd = 2)
  print(a)
}


## ----echo = TRUE------------
(elements <- list(a = 1:3, 
                 b = 4:10, 
                 c = 7:-1))


## ----echo = TRUE------------
for(element in elements) {
  print(element*2)
}



## ----flowchart6for-loop, echo = FALSE----
#Create node data frame
f5_nodes <- create_node_df(n = 4, #number of nodes
                           type = 'a', #for grouping
                           label = c(" ", "Last item\nreached?", "Expression\nfor() \nbody", "Exit\nLoop"), 
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
render_graph(flowchart5, width = '65%', height = 'auto')


## ----eval = FALSE-----------
## y <- 2
## for(m in 1:6) {
##   print(y*m)
## }


## ---- echo = FALSE----------
y <- 2
for(m in 1:6) {
  print(y*m)
}


## ----flowchart-extrafor-loop, echo = FALSE----
#Create node data frame
f5_nodes <- create_node_df(n = 5, #number of nodes
                           type = 'a', #for grouping
                           label = c("Start", 
                                     "y = 2", 
                                     "for m in 1:6\nis m > 6?",
                                     "print(y*m)", 
                                     "Exit"), 
                           shape = c("circle", 
                                     "parallelogram", 
                                     "diamond",
                                     "parallelogram", 
                                     'circle'), 
                           style = c('solid', 
                                     'solid', 
                                     'solid', 
                                     'solid', 
                                     'filled'), 
                           fontname = 'Helvetica',
                           fontsize = 10,
                           fixedsize = FALSE,
                           color = 'mediumblue',
                           width = .1
                           )


#create edges
f5_edges <- create_edge_df(from = c(1, 2, 3, 3, 4), #origin node id
                           to = c(2, 3, 4, 5, 3), 
                           label = c(' ',
                                     ' ',
                                     ' if FALSE', 
                                     ' if TRUE', 
                                     ' '), 
                           fontsize = 10,
                           color = 'dimgrey',
                           decorate = TRUE,
                           tailport = c('s', 's', 'w', 'e', 'e'),
                           headport = c('n', 'n', 'w', 'n', 's')
                           )

#create flowchart
flowchart5 <- create_graph(
                    nodes_df = f5_nodes,
                    edges_df = f5_edges,
                    directed = TRUE, 
                    attr_theme = 'tb' 
                    )

#display flowchart
render_graph(flowchart5, width = '60%', height = 'auto')


## ----eval = FALSE-----------
## y <- 2
## for(m in 1:6) {
##   print(y*m)
## }


## ---- echo = FALSE----------
y <- 2
for(m in 1:6) {
  print(y*m)
}


## ---- eval = FALSE----------
## for(val in x) {
##   if(val %% 2 == 0) {
##     count <- count + 1
##   }
## }
## print(count)


## ----flowchart6for-loop2, echo=FALSE----
#Create node data frame
f6_nodes <- create_node_df(n = 6, #number of nodes
                           type = 'a', #for grouping
                           label = c("x", "Last VAL\nin X?", "Is VAL even?", 'count = count + 1',
                                     'End', "print\ncount"), 
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
                           label = c(' ', ' if FALSE\nfor X', '  if TRUE,\nexit loop', ' if TRUE', 'if FALSE', ' ', ' '), 
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
render_graph(flowchart6, 
             width = '90%', 
             height = 'auto')


## ---- echo=FALSE------------
for(i in 1:10) { 
  print(CO2$conc[i]) 
}


## ---- echo=FALSE------------
for (i in 11:20) { 
  print(CO2$conc[i]) 
}


## ---- echo=FALSE------------
for (i in 21:30) { 
  print(CO2$conc[i]) 
}


## ---- echo=FALSE------------
for (i in 31:40) { 
  print(CO2$conc[i]) 
}


## ----eval = FALSE-----------
## for(i in 1:length(CO2[,1])) { # for each row in the CO2 dataset
##   if(CO2$Type[i] == "Quebec") { # if the type is "Quebec"
##     print(CO2$conc[i]) # print the CO2 concentration
##     }
## }


## ---- echo=FALSE------------
for (i in 1:11) { 
  if(CO2$Type[i] == "Quebec") { 
    print(CO2$conc[i])
  }
}


## ---- echo=FALSE------------
for (i in 12:22) { 
  if(CO2$Type[i] == "Quebec") { 
    print(CO2$conc[i])
  }
}


## ---- echo=FALSE------------
for (i in 23:33) { 
  if(CO2$Type[i] == "Quebec") { 
    print(CO2$conc[i])
  }
}


## ---- echo=FALSE------------
for (i in 34:42) { 
  if(CO2$Type[i] == "Quebec") { 
    print(CO2$conc[i])
  }
}


## ---- echo=FALSE------------
for (i in 1:20) { 
  print(CO2$conc[i]) 
}


## ---- echo=FALSE------------
for (i in 21:40) { 
  print(CO2$conc[i]) 
}


## ---- echo=FALSE------------
for (i in 1:20) { 
  print(CO2$conc[i]) 
}


## ---- echo=FALSE------------
for (i in 21:40) { 
  print(CO2$conc[i]) 
}


## ----echo = FALSE-----------
for (i in 4:5) { # for i in 4 to 5
  print(colnames(CO2)[i])
  print(mean(CO2[,i])) # print the mean of that column from the CO2 dataset
}


## ----echo = -c(2:5)---------
# Output
for (i in 1:3) {
  for (n in 1:3) {
    print (i*n)
  }
}


## ---------------------------
height <- matrix(c(1:10, 21:30),
                 nrow = 5,
                 ncol = 4)


## ----echo=FALSE-------------
height



## ---------------------------
apply(X = height,
      MARGIN = 1,
      FUN = mean)



## ----eval = FALSE-----------
## SimulatedData <- list(
##   SimpleSequence = 1:4,
##   Norm10 = rnorm(10),
##   Norm20 = rnorm(20, 1),
##   Norm100 = rnorm(100, 5)
##   )
## 
## # Apply mean to each element
## ## of the list
## lapply(SimulatedData, mean)


## ----echo=FALSE-------------
SimulatedData <- list(SimpleSequence = 1:4,
             Norm10 = rnorm(10),
             Norm20 = rnorm(20, 1),
             Norm100 = rnorm(100, 5))

# Apply mean to each element of the list
lapply(SimulatedData, mean)


## ----eval = TRUE------------
SimulatedData <- list(SimpleSequence = 1:4,
             Norm10 = rnorm(10),
             Norm20 = rnorm(20, 1),
             Norm100 = rnorm(100, 5))

## ---------------------------
# Apply mean to each element of the list
sapply(SimulatedData, mean)


## ---------------------------
lilySeeds <- c(80, 65, 89, 23, 21)
poppySeeds <- c(20, 35, 11, 77, 79)

## ---------------------------
# Output
mapply(sum, lilySeeds, poppySeeds)


## ---------------------------
mtcars[1:10, c("hp", "cyl")]


## ---------------------------
# mean hp by cylinder groups
tapply(mtcars$hp, 
       mtcars$cyl, 
       FUN = mean)


## ----echo=TRUE--------------
for(i in 1:dim(CO2)[1]) {
  if(CO2$Type[i] == "Quebec") {
    CO2$uptake[i] <- CO2$uptake[i] - 2
  }
}


## ----echo=TRUE--------------
tapply(CO2$uptake, CO2$Type, mean)


## ----flowchart7break, echo=FALSE----
#Create node data frame
f7_nodes <- create_node_df(n = 6, #number of nodes
                           type = 'a', #for grouping
                           label = c("Start", 
                                     "Reached last \nval in X?\n\nfor()", 
                                     "Is condition \nTRUE? \n\nif()",
                                     'statement\nbody', 
                                     "End", 
                                     " "), 
                           shape = c("circle", "diamond", 'diamond', 'rectangle', 'circle', 'circle'), 
                           style = c('solid', 'solid', 'solid', 'solid', 'filled', 'invis'), 
                           fontname = 'Helvetica',
                           fontsize = 13,
                           fixedsize = 'false',
                           color = 'mediumblue',
                           width = .1,
                           penwidth = 1.5
                           )


#create edges
f7_edges <- create_edge_df(from = c(1, 2, 3, 4, 2, 3), #origin node id
                           to = c(2, 3, 4, 2, 5, 5), 
                           label = c(' ', ' if FALSE\nfor x', '  if FALSE', ' ', 'if TRUE, then exit', ' if TRUE, then break', ' '), 
                           fontsize = 10,
                           color = 'dimgrey',
                           decorate = FALSE,
                           tailport = c('e', 'e', 's', 'w', 'n', 'e'),
                           headport = c('w', 'w', 'n', 's', 'w', 'w')
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
                           label = c("Start", "Reached last \nval in X?\n\nfor()", 
                                     "Is condition \nTRUE?\n\nif()",
                                     'statement\nbody', "End"), 
                           shape = c("circle", "diamond", 'diamond', 'rectangle', 'circle'), 
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
                           label = c(' ', ' if FALSE', '  if FALSE', ' ', 'if TRUE, then exit', ' if TRUE, then next'), 
                           fontsize = 10,
                           color = 'dimgrey',
                           decorate = FALSE,
                           tailport = c('e', 'e', 'e', 's', 'n', 's'),
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
## for(i in 1:nrow(CO2)) {
##   if(CO2$Treatment[i] == "nonchilled") next
##   # Skip to next iteration if treatment is nonchilled
##   count <- count + 1
## #  print(CO2$conc[i]) # You can turn this on if you want to
## }
## print(count) # The count and print command were performed 42 times.


## ----echo = FALSE-----------
count <- 0

for (i in 1:nrow(CO2)) {
  if (CO2$Treatment[i] == "nonchilled") next
  # Skip to next iteration if treatment is nonchilled
  count <- count + 1
}
print(count) # The count and print command were performed 42 times.


## ---------------------------
sum(CO2$Treatment == "nonchilled")


## ----eval = FALSE-----------
## repeat {
##   print("Press 'Esc' to stop me!")
## }


## ----eval = FALSE-----------
## [1] "Press 'Esc' to stop me!"
## [1] "Press 'Esc' to stop me!"
## ...
## ...
## [1] "Press 'Esc' to stop me!"


## ----eval = FALSE-----------
## repeat {
##   expression
##   if {
##     condition
##     } break
## }


## ----flowchart-repeat-loop, echo = FALSE----
#Create node data frame
f5_nodes <- create_node_df(n = 4, #number of nodes
                           type = 'a', #for grouping
                           label = c(" ", 
                                     "Expression",
                                     "Condition\nif()",
                                     "Exit"), 
                           shape = c("circle",
                                     "rectangle", 
                                     'diamond', 
                                     'circle'), 
                           style = c('solid', 
                                     'solid', 
                                     'solid',
                                     'filled'), 
                           fontname = 'Helvetica',
                           fontsize = 10,
                           fixedsize = FALSE,
                           color = 'mediumblue',
                           width = .1
                           )


#create edges
f5_edges <- create_edge_df(from = c(1, 2, 3, 3), #origin node id
                           to = c(2, 3, 2, 4), 
                           label = c(' ', 
                                     ' ', 
                                     ' if FALSE\nrepeat', 
                                     ' if TRUE\nbreak'),
                           fontsize = 10,
                           color = 'dimgrey',
                           decorate = TRUE,
                           tailport = c('s', 'e', 'w', 's'),
                           headport = c('n', 'e', 'w', 'n')
                           )

#create flowchart
flowchart5 <- create_graph(
                    nodes_df = f5_nodes,
                    edges_df = f5_edges,
                    directed = TRUE, 
                    attr_theme = 'tb' 
                    )

#display flowchart
render_graph(flowchart5, 
             width = '35%', 
             height = '40%')


## ----echo = TRUE------------
count <- 0

for(i in 1:nrow(CO2)) {
  if(CO2$Treatment[i] == "nonchilled") next
  count <- count + 1
}

print(count)


## ----echo = TRUE------------
count <- 0
i <- 0

repeat {
      i <- i + 1
      if(CO2$Treatment[i] == "nonchilled") next
      count <- count + 1
      if(i == nrow(CO2)) break
}

print(count)


## ----eval = FALSE-----------
## while(condition){
##   expression
## }


## ----flowchart-while-loop, echo = FALSE----
#Create node data frame
f5_nodes <- create_node_df(n = 4, #number of nodes
                           type = 'a', #for grouping
                           label = c(" ", 
                                     "Condition\nbeing met?",
                                                                          "Expression",
                                     "Exit"), 
                           shape = c("circle",
                                     "diamond", 
                                     'rectangle', 
                                     'circle'), 
                           style = c('solid', 
                                     'solid', 
                                     'solid',
                                     'filled'), 
                           fontname = 'Helvetica',
                           fontsize = 10,
                           fixedsize = FALSE,
                           color = 'mediumblue',
                           width = .1
                           )


#create edges
f5_edges <- create_edge_df(from = c(1, 2, 3, 2), #origin node id
                           to = c(2, 3, 2, 4), 
                           label = c(' ', 
                                     ' while TRUE', 
                                     ' ', 
                                     ' if FALSE\nexit'),
                           fontsize = 10,
                           color = 'dimgrey',
                           decorate = TRUE,
                           tailport = c('s', 's', 'w', 'e'),
                           headport = c('n', 'n', 'w', 'n')
                           )

#create flowchart
flowchart5 <- create_graph(
                    nodes_df = f5_nodes,
                    edges_df = f5_edges,
                    directed = TRUE, 
                    attr_theme = 'tb' 
                    )

#display flowchart
render_graph(flowchart5, 
             width = '80%', 
             height = 'auto')


## ----eval = FALSE-----------
## count <- 0
## for(i in 1:nrow(CO2)) {
##   if(CO2$Treatment[i] == "nonchilled") next
##   count <- count + 1
## }
## print(count)


## ----eval = FALSE-----------
## count <- 0
## i <- 0
## repeat {
##       i <- i + 1
##       if(CO2$Treatment[i] == "nonchilled") next
##       count <- count + 1
##       if(i == nrow(CO2)) break
## }
## print(count)


## ----eval = FALSE-----------
## i <- 0
## count <- 0
## while(i < nrow(CO2))
## {
##   i <- i + 1
##   if(CO2$Treatment[i] == "nonchilled") next
##   count <- count + 1
## }
## print(count)


## ---------------------------
data(CO2)


## ---------------------------
for(i in 1:nrow(CO2)) {
  if(CO2$Type[i] == "Mississippi") {
    if(CO2$conc[i] < 300) next
    CO2$conc[i] <- CO2$conc[i] - 20
  }
}


## ---------------------------
for(i in 1:nrow(CO2)) {
  if(CO2$Type[i] == "Mississippi" && CO2$conc[i] >= 300) {
    CO2$conc[i] <- CO2$conc[i] - 20
  }
}


## ----echo = TRUE------------
our.dataset <- data.frame(
  a = rnorm(10),
  b = rnorm(10),
  c = rnorm(10),
  d = rnorm(10)
)


## ----echo = TRUE------------
our.dataset$a <- (our.dataset$a - min(our.dataset$a, na.rm = TRUE)) / 
  (max(our.dataset$a, na.rm = TRUE) - min(our.dataset$a, na.rm = TRUE))
our.dataset$b <- (our.dataset$b - min(our.dataset$b, na.rm = TRUE)) / 
  (max(our.dataset$b, na.rm = TRUE) - min(our.dataset$a, na.rm = TRUE))
our.dataset$c <- (our.dataset$c - min(our.dataset$c, na.rm = TRUE)) / 
  (max(our.dataset$c, na.rm = TRUE) - min(our.dataset$c, na.rm = TRUE))
our.dataset$d <- (our.dataset$d - min(our.dataset$d, na.rm = TRUE)) / 
  (max(our.dataset$d, na.rm = TRUE) - min(our.dataset$d, na.rm = TRUE))


## ----echo = TRUE------------
our.dataset <- data.frame(
  a = rnorm(10),
  b = rnorm(10),
  c = rnorm(10),
  d = rnorm(10)
)


## ----eval = FALSE-----------
## our.dataset$a <- (our.dataset$a - min(our.dataset$a, na.rm = TRUE)) /
##   (max(our.dataset$a, na.rm = TRUE) - min(our.dataset$a, na.rm = TRUE))
## 


## ----eval = FALSE-----------
## # our
## # secret
## # hidden
## # function


## ----eval = FALSE-----------
## rescale01(our.dataset$a)
## rescale01(our.dataset$b)
## rescale01(our.dataset$c)
## rescale01(our.dataset$d)


## ----flowchart9, echo=FALSE----
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


## ---- echo=F----------------
print_animal <- function(animal) {
  if(animal == "dog") {
    print("woof")
  } else if(animal == "cat") {
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

operations(number1 = 1, number2 = 2, number3 = 3) 

# is equivalent to
operations(1, 2)

operations(1, 2, 2) # we can still change the value of number3 if needed


## ----echo=TRUE--------------
paste_anything_fun <- function(...) {
  arguments <- list(...)
  paste0(arguments)
}



## ----echo=TRUE--------------
paste_anything_fun("I", 
                   "want", 
                   "a break!")


## ----echo=TRUE--------------
percentages <- function(x, mult = 100, ...){
 percent <- round(x * mult, ...)
 paste(percent, "%", sep = "")
}


## ----echo=TRUE--------------
percentages(c(.543, .534, .466))


## ----echo=TRUE--------------
# ?round

percentages(c(.543, .534, .466), digits = 2)


## ---- eval = FALSE----------
## plot.CO2 <- function(CO2, ...) {
##   plot(x=CO2$conc, y = CO2$uptake, type = "n", ...)
##   for(i in 1:length(CO2[,1])){
##      if(CO2$Type[i] == "Quebec") {
##        points(CO2$conc[i], CO2$uptake[i], col = "red", type = "p", ...)
##      } else if(CO2$Type[i] == "Mississippi") {
##        points(CO2$conc[i], CO2$uptake[i], col = "blue", type = "p", ...)
##      }
##   }
## }


## ---- eval = FALSE----------
## plot.CO2(CO2,
##          cex.lab = 1.2,
##          xlab = "CO2 concentration",
##          ylab = "CO2 uptake")


## ---- eval = FALSE----------
## plot.CO2(CO2,
##          cex.lab = 1.2, pch = 20,
##          xlab = "CO2 concentration",
##          ylab = "CO2 uptake")


## ---- echo = FALSE, fig.height = 2.5, fig.width = 5----
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


## ---------------------------
myfun <- function(x) {
  if(x < 10) {
    0
  } else {
    10
  }
}

myfun(5)
myfun(15)


## ---------------------------
simplefun1 <- function(x) {
  if(x < 0)
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
out_val <- 3 
vartest <- function() {
  in_val <- 4  
  print(in_val)
  print(out_val)
}
vartest()

## ---- error = TRUE----------
in_val; out_val


## ---------------------------
out_val_2 <- 3
vartest <- function(out_val_2) {
  print(out_val_2)
}

vartest(8)

## ---- error = TRUE----------
out_val_2


## ---- error = TRUE----------
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


## ----eval = FALSE-----------
## a <- 3
## if(a > 5) {
##   b <- 2
## }
## 
## a + b


## ----eval = FALSE-----------
## # Error: object 'b' not found


## ---- eval = FALSE----------
## if((a[x,y]>1.0)&(a[x,y]<2.0)){print("Between 1 and 2")}


## ---- eval = FALSE----------
##  if((a[x, y] > 1.0) & (a[x, y] < 2.0)){
##     print("Between 1 and 2")
##   }


## ----eval = FALSE-----------
## recalibrate <- function(CO2, type, bias) {
##   for(i in 1:nrow(CO2)) {
##     if(CO2$Type[i] == type) {
##       CO2$conc[i] <- CO2$conc[i] + bias
##     }
##   }
##   return(CO2)
## }
## 


## ----eval = FALSE-----------
## newCO2 <- recalibrate(CO2 = CO2,
##                       type = "Mississipi",
##                       bias = -20)
## 
## newCO2 <- recalibrate(newCO2, "Quebec", +50)


## ---- eval = FALSE, echo = TRUE----
## rc <- function(c, t, b) {
##   for(i in 1:nrow(c)) {
##     if(c$Type[i] == t) {
##       c$uptake[i] <- c$uptake[i] + b
##     }
##   }
##   return(c)
## }


## ---------------------------
my_function <- function(x) {
  if(x != 0) {
  z <- cos(x)/x
  } else { z <- 1 }
  return(z)
}


## ---------------------------
my_function(45)

my_function(20)

my_function(0)

