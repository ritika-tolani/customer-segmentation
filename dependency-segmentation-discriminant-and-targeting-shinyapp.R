try(require("shiny")||install.packages("shiny"))
try(require("devtools")||install.packages("devtools"))
try(require("ggplot2")||install.packages("ggplot2"))
try(require("plyr")||install.packages("plyr"))
try(require("scales")||install.packages("scales"))
try(require("grid")||install.packages("grid"))

try(require("cluster")||install.packages("cluster"))
try(require("mclust")||install.packages("mclust"))
try(require("MASS")||install.packages("MASS"))
try(require("devtools")||install.packages("devtools"))
library("devtools")

if(!require("ggbiplot")) {install_github("vqv/ggbiplot")}

try(require("ggplot2")||install.packages("ggplot2"))
try(require("scales")||install.packages("scales"))
try(require("gridExtra")||install.packages("gridExtra"))
try(require("shinyWidgets")||install.packages("shinyWidgets"))


library("shiny")
library("cluster")
library("ggbiplot")
library("mclust")
library("MASS")

library("ggplot2")
library("scales")
library("gridExtra")


