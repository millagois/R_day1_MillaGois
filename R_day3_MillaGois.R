install.packages('ggplot2')
library('ggplot2')
ggplot(iris, aes(x=Sepal.Length, y=Sepal.Width))
ggplot(iris, aes(x=Sepal.Length, y=Sepal.Width)) + 
  geom_point()
#Question 01 
#Code
ggplot(iris, aes(x=Petal.Length, y=Petal.Width)) + 
  geom_point()
#Answer: There are two clusters

ggplot(iris, aes(x=Petal.Length)) + 
  geom_histogram()
ggplot(iris, aes(x=Petal.Length)) + 
  geom_histogram(binwidth = 0.05)

#Question 02
#Code
ggplot(iris, aes(x=Sepal.Length)) + 
  geom_histogram(binwidth = 0.05)
#Answer: Sepal length of 5cm is the most prevalent. 

#Question 03 
#Code
ggplot(iris, aes(x=Species, y=Sepal.Width)) +
  geom_boxplot()
#Answer: Setosa has the largest median sepal width. 

#Question 04 
#Code 
plot1<-ggplot(iris, aes(x=Species, y=Sepal.Width)) 
plot2 <- plot1+geom_boxplot()
plot3 <- plot2+theme_bw()
plot1
plot2
plot3
#Answer: plot 1 is a schetch of the plot but without data. plot 2 added the data and how it is put in graphic and plot 3 puts the white background. 

#Question 05 
#Code 
ggplot(iris, aes(x=Species, y=Sepal.Length)) +
  geom_boxplot()
sepal.length.boxplot <- ggplot(iris, aes(x=Species, y=Sepal.Length)) +
  geom_boxplot()

#Question 06 
#Code 
sepal.length.mean <- mean(iris$Sepal.Length)
sepal.length.boxplot+geom_hline(yintercept=sepal.length.mean)
#Answer: The mean is not representative of all species because there are more species above the mean than below the mean line. The ones that are below, are much lower than the mean, which justifies the mean not being representative. It also does not overlap with the "whiskers" of the boxplot. 

#Question 07 
#Code 
mean.virginica <- mean(iris[iris$Species=='virginica',]$Sepal.Length)
mean.versicolor <- mean(iris[iris$Species=='versicolor',]$Sepal.Length)
t.test((iris[iris$Species=='virginica',]$Sepal.Length),(iris[iris$Species=='versicolor',]$Sepal.Length))
t.test.p.value <- t.test((iris[iris$Species=='virginica',]$Sepal.Length),(iris[iris$Species=='versicolor',]$Sepal.Length))$p.value
#Answer: p-value = 1.866e-07

#Question 08
#Code
t.test.p.value <- signif(t.test.p.value, digits=3)
p.value.label <- paste("p-value=", t.test.p.value)
sepal.length.boxplot+annotate("text",x=3.2, y=3.5, label=p.value.label)

#Question 09 
#Code
sepal.length.boxplot+geom_point()
sepal.length.boxplot.jitter <- sepal.length.boxplot+geom_point(position = "jitter", size=1, alpha = 0.5, color=c("darkslategray4"))
sepal.length.boxplot.jitter
sepal.length.boxplot+geom_point(position = "jitter", size=1, alpha = 0.5, color=c("darkslategray4"))
sepal.length.boxplot+geom_point(position = "jitter", size=1, alpha = 0.5, color=c("darkslategray4"))
sepal.length.boxplot+geom_point(position = "jitter", size=1, alpha = 0.5, color=c("darkslategray4"))
sepal.length.boxplot+geom_point(position = "jitter", size=1, alpha = 0.5, color=c("darkslategray4"))
#Answer: they are not the same. because the position of the dots are randomized. 

#Question 10 
#Code 
sepal.length.boxplot + 
  theme(axis.title = element_text(size = 15))
sepal.length.boxplot.labels<- sepal.length.boxplot.jitter + theme(axis.title = element_text(size=15)) + ylab("Sepal Length (cm)")

#Question 11
#Code 
sepal.length.boxplot.sizes <- sepal.length.boxplot.labels + theme(axis.text.x = element_text(size=10))
sepal.length.boxplot.sizes+geom_boxplot(aes(fill=Species))

#Question 12
#Code 
sepal.length.boxplot.new<- sepal.length.boxplot+geom_boxplot(aes(fill=Species))+geom_point(position = "jitter", size=1, alpha=0.5, color=c("goldenrod1"))
sepal.length.boxplot.new+theme_bw()

#Question 13
#Code 
library(reshape2)
head(iris)
iris.melt <- melt(iris, id.vars = "Species")
head(iris.melt)
dim(iris.melt)
str(iris.melt)
#Answer: This data frame makes a matrix with 3 rows, in which the species are correlated to the variable and the value. 
 
ggplot(iris.melt, aes(x=variable, y=value)) + 
  geom_boxplot()+ 
  facet_grid(Species~.)

#Question 14
#Code 
ggplot(iris.melt, aes(x=variable, y=value)) + 
  geom_boxplot()+
  facet_grid(.~Species)
#Answer: Now each species is visualized vertically, which makes it easier to compare between species. 

#Question 15
#Code 
ggplot(iris.melt, aes(x=Species, y=value)) + 
  geom_boxplot()+ facet_grid(.~variable)+ theme(axis.text.x =  element_text(size = 6))
new.separated.plot <- ggplot(iris.melt, aes(x=Species, y=value)) + 
  geom_boxplot()+ facet_grid(.~variable)+ theme(axis.text.x =  element_text(size = 6))

#Question 16
#Code
ggplot(iris.melt, aes(x=Species, y=value)) + geom_violin()+ facet_grid(.~variable) +geom_violin(aes(fill=Species)) + geom_point(position = "jitter", size=1, alpha = 0.5, color=c("goldenrod1"))+
theme(axis.text.x=element_text(angle=45, hjust=1))
#Answer: Petal length varies the most between the species. 

outlier <- ifelse(iris$Sepal.Length > 7.6, "Outlier", "Non-outlier")

#Question 17 
#Code 
ggplot(iris, aes(x=Sepal.Length, y=Sepal.Width, color=outlier)) +
  geom_point() +
  geom_text(aes(label = Sepal.Width), data = iris[iris$Sepal.Length>7.6,], color="black")
#Answer: No. it doesn't identify outliners properly since it has two similar values one being an outliner and the other not. Also, it does not discriminate between species. 

cor(iris[1:4])

#Question 18 
#Code 
ggplot(iris, aes(x=Sepal.Length, y=Sepal.Width)) + geom_smooth(method="lm")
#Answer: it shows a negative correlation, which matches the negative coefficient. 

#Question 19 
#Code 
ggplot(iris, aes(x=Sepal.Length, y=Sepal.Width)) + geom_smooth(method="lm", aes(fill=Species)) +facet_grid(.~Species)
#Answer: The line shows a positive correlation for each species. which does not match with the general negative correlation coefficient, but that can be explained because in this graph we separate them by species. 
last.plot <- ggplot(iris, aes(x=Sepal.Length, y=Sepal.Width)) + geom_smooth(method="lm", aes(fill=Species)) +facet_grid(.~Species, scales="free_x")
#Answer: it changes the scales in the x-axis to fit better each measument of each species. 

plot1 <- ggplot(data = iris, aes(Sepal.Length, Sepal.Width)) +
  geom_point()

# Running ggsave() will save the last plot you made
ggsave('last.plot.png')

# The file type is based on the extension you use.
ggsave('plotsavingtest.pdf')
  
plot2 <- ggplot(data = iris, aes(Sepal.Length, Sepal.Width)) +
  geom_boxplot()

ggsave('filename.pdf', plot=last.plot)
