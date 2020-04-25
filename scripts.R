mtcars
library(tidyverse)
getwd()
mtcars <- write_csv(mtcars,"data/mtcars.csv")

count <- table(mtcars$gear)
barplot(count)

#Horizontal barplot

barplot(count,horiz = T)

#Coloured plot

barplot(count,main = "simple bar plot",xlab = "Improvement",
        ylab ="Frequency",legend=rownames(count),col = c("red",
        "yellow","green"))

#stacked up barplot

count <- table(mtcars$vs,mtcars$gear)
head(count)

barplot(count,main = "Car distribution gear and vs",xlab = 
          "Number of gears",legend=rownames(count),col=c("grey","cornflowerblue"))

##stacked sides barplot

barplot(count,main = "Car distribution gear and vs",xlab = 
          "Number of gears",legend=rownames(count),col=c("grey",
          "cornflowerblue"),beside = T)

#Pie charts
install.packages("plotrix")
library(plotrix)
slices <- c(10,12,4,16,8)
lbls <- c("US","UK","Australia","Germany","France")
pie(slices,labels = lbls,main = "Pie Chart")
pct <- round(slices/sum(slices)*100)
lbls <- paste(lbls,"",pct,"%",seq="")
lbls

#Add % in the pie chart
pie(slices,labels = lbls,main="Pie chart with %",col = rainbow(5))

#3D Pie chart
pie3D(slices,labels=lbls,main="3D Pie chart",col = rainbow(5),explode = 0.0 )

#Histogram
hist(mtcars$mpg)
hist(mtcars$mpg,breaks = 10,col = "lightgreen")

#Density plot
density_data <- density(mtcars$mpg)
plot(density_data)

#Give meaningful title
plot(density_data,main = "Kernel density plot")

#Give colour to the plot using polygon function
polygon(density_data,col = "skyblue",border = "black")

#Line chart
#Create vectors first
weight <- c(2.5,2.8,3.2,4.8,5.1,5.9,6.8,7.1,7.8,8.1)
months <- c(0,1,2,3,4,5,6,7,8,9)
plot(months,weight,type = "b",main = "Baby Weight Chart")

plot(months,weight,type = "line",main = "Baby Weight Chart")

plot(months,weight,type = "point",main = "Baby Weight Chart")

#Box plot
vec <- c(3,2,5,6,4,8,1,2,3,2,4)
summary(vec)
boxplot(vec)
myboxplot <- boxplot(vec,varwidth = T)

#Heatmaps, simple and elaborate
data <- read_csv("data/ppg2008.csv")
# Ref https://flowingdata.com/2010/01/21/how-to-make-a-heatmap-a-quick-and-easy-solution/


data <- data[order(data$PTS),]


data <- data[,2:20]

data_matrix <- data.matrix(data)

data_heatmap <- heatmap(data_matrix,Rowv = NA,Colv = NA,col=cm.colors(256),scale = "column")

#file formats #jpeg,png, pdf,bmp

dev.copy(png,filename="myboxplot.png")
dev.off

jpeg("myboxplot.jpeg")
dev.off()

