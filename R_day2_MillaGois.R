#Question 01 
#Code
head(iris)
dim(iris)
summary(iris)
#Answer: iris contains the length and width of both sepal and petal of 150 different flowers from 3 different species. In sum, it shows 5 types of information per flower (sepal length, sepal width, petal length, petal width and species), analyzing 150 different flowers. 

#Question 02 
#Code 
summary(iris)
iris$Species
table(iris$Species)
#Answer: 3 species of flowers were analyzed - setosa, versicolor and virginica. 50 observations for each species. 

#Question 03 
#Code
mean(iris[iris$Species=='virginica',]$Petal.Length)
#Answer: the part of the code with iris[iris$Species == 'virginica',] selects the column "Species" in the dataset and the 'virginica' analyzes only the ones with that information in the column. 

#Question 04 
#Code 
diff<- ((mean(iris[iris$Species=='virginica',]$Petal.Length))) -  (mean(iris[iris$Species=='versicolor',]$Petal.Length))
#Answer: diff value is 1.292. After obtaining this value, we would need to calculate the P-value to confirm if this difference is true or not (statistically), and afterwards, calculate the confidence interval of that value, in order to know what are the error windows regarding that value. 

virg_pl <- iris[iris$Species=='virginica',]$Petal.Length
vers_pl <- iris[iris$Species=='versicolor',]$Petal.Length
set_pl <- iris[iris$Species=='setosa',]$Petal.Length

#Question 05 
#Code
t.test(virg_pl,vers_pl)
t_test_virg_vers <- t.test(virg_pl,vers_pl)
#Answer: null hypothesis - there are no difference between the means of petal length of virginica and versicolor. since the p value is < 0.05, this hypothesis is rejected. 

#Question 06 
#Code 
t.test(virg_pl,set_pl)
t_test_virg_set <- t.test(virg_pl,set_pl)
t_test_virg_set$p.value #Answer: 9.269628e-50
t_test_virg_set$estimate
#Answer: mean of x mean of y
#Answer: 5.552     1.462 
t_test_virg_set$conf.int #Answer: 3.926251 4.253749 
#Answer: we reject the null hypothesis that the mean difference of petal length between setosa and virginica is equal.
diff2<-((mean(iris[iris$Species=='virginica',]$Petal.Length))) -  (mean(iris[iris$Species=='setosa',]$Petal.Length))
#Answer: by comparing both p-values, one can see that the p-value of virginica&setosa is much smaller (^-50) than the virginica&versicolor (^-16). that means that the difference between the means is much more significant in virginica&setosa. This can be confirmed by the difference between means being much bigger. 


vers_pl [1] <- 15
vers_pl[2] <-17
vers_pl[3]<-14 

t.test(virg_pl,vers_pl)

#Question 07 
#Code
wilcox.test(virg_pl,vers_pl)
#Answer: W = 2311.5, p-value = 2.466e-13. in this case, the p-value is smaller than the one obtained through t-test. 

#Question 08 
#Code
stripchart(list(virg_pl,vers_pl),vertical=TRUE,ylab="Observations", pch=21, bg=1)
#Answer: when I want to see the results plotted. 

#Question 09
#Code 
# par() is a function that allows multiple plots to be combined in one figure
# 1 = the number of rows, 2 = the number of columns
par(mfrow=c(1,2))

xrank <- rank(c(virg_pl,vers_pl))[seq(along=virg_pl)]
yrank <- rank(c(virg_pl,vers_pl))[-seq(along=vers_pl)]
# plot the previous plot for comparison
stripchart(list(virg_pl, vers_pl),
           vertical=TRUE,
           ylab="Observations",
           pch=21,
           bg=1)
abline(h=0)
stripchart(list(xrank,yrank),
           vertical=TRUE,
           ylab="Ranks",
           pch=21,bg=1,
           cex=1.25)
#Answer: because you can see the difference of the outliners in comparison to the rest of the results. And from that, make the calculations to find out whether you should set the outliners aside. 


#Question 10
#the tilde (~) must be read as the phrase "is modeled as a function of"
#Code 
model1<- aov(Sepal.Length~Species, data = iris)
summary(model1)
#Answer: the p-value is significant (<2e-16),  which means the null hypothesis can be rejected. The significance code for this test is  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1, and that can be read as a simpler way to show the p-value and how i significantly affects the results. 
#         the degrees of freedom is the number os variables in the analysis (always considering at least 2, one being fixed). since there are 3 species in total, one being fixed, the df=2. 

#Question 11 
#Code 
model2 <- kruskal.test(Sepal.Length~Species, data = iris)
model2$p.value #answer: 8.918734e-22
model3 <- kruskal.test(Sepal.Width~Species, data = iris)
model3$p.value #answer: 1.569282e-14
#Answer: there is a difference in significance between sepal width and length. In this case, sepal length has a higher significance difference. Here we conclude that these characteristics varies between species and also the type of measurement used (width or length).  

#Question 12
#Code
#load the necessary packages
library(stringr)
exp <- read.csv("C:/Users/Milla Gois/Downloads/BigData_backup_GM12878-IL21.csv", header = TRUE)
rownames(exp)<- exp$X
exp <- exp[,-1]
head(exp)
dim(exp)
#Answer: The dataset contains gene expression for sample GM12878 on 39666 gene, with 6 columns representing time analysis. The time points used were t=0 and t=180. and the experiment has been done in triplo. 

#Question 13 
#Answer: if you want to assess the effects of IL21 stimulation, you should compare data points of 180min without cytokine vs 180 min with cytokine. 

#Question 14
#Code 
t.test(exp$GM12878_A_t180unstim, exp$GM12878_A_t180, paired = TRUE)
# Answer: Paired t-test
#
# data:  exp$GM12878_A_t180unstim and exp$GM12878_A_t180
# t = -3.8427, df = 39665, p-value = 0.0001219
# alternative hypothesis: true difference in means is not equal to 0
# 95 percent confidence interval:
#  -22.823507  -7.405101
#  sample estimates:
#  mean of the differences 
#  -15.1143 
t.test(exp$GM12878_A_t0unstim, exp$GM12878_A_t180unstim, paired = TRUE)
#Results: Paired t-test

# data:  exp$GM12878_A_t0unstim and exp$GM12878_A_t180unstim
# t = 11.759, df = 39665, p-value < 2.2e-16
# alternative hypothesis: true difference in means is not equal to 0
# 95 percent confidence interval:
#   50.74232 71.04097
# sample estimates:
#   mean of the differences 
# 60.89165 
#Answer: the t-test between unstimulated at different time points showed the biggest difference, with the p-value = < 2.2e-16. The t-test between unstimulated and stimulated at t=180 was less significant, with the p-value being equal to 0.0001219. 

#Question 15 
#Code
wilcox.test(exp$GM12878_A_t0unstim, exp$GM12878_A_t180unstim)
#Result: Wilcoxon rank sum test with continuity correction

# data:  exp$GM12878_A_t0unstim and exp$GM12878_A_t180unstim
# W = 783529401, p-value = 0.2998
# alternative hypothesis: true location shift is not equal to 0

wilcox.test(exp$GM12878_A_t0unstim, exp$GM12878_A_t180unstim, paired = TRUE)
#Result: Wilcoxon signed rank test with continuity correction

# data:  exp$GM12878_A_t0unstim and exp$GM12878_A_t180unstim
# V = 232633956, p-value < 2.2e-16
# alternative hypothesis: true location shift is not equal to 0
#Answer: the p-value is calculated in a way that it gets much higher and less significant (because it calculares and correlates the same thing). 

library(MASS)
head(survey)

#Question 16 
#Code: 
table(survey$Smoke, survey$Exer)
tblSmoke <-table (survey$Smoke, survey$Exer)
summary(tblSmoke)
#Result: 
#Number of cases in table: 236 
#Number of factors: 2 
#Test for independence of all factors:
#  Chisq = 5.489, df = 6, p-value = 0.4828
chisq.test(tblSmoke)
# Pearson's Chi-squared test
# data:  tblSmoke
#X-squared = 5.4885, df = 6, p-value = 0.4828
#Answer: 236 individuals in the contingency table 
#         the null hypothesis is that there is no relationship between exercise and smoking. and it will no be rejected because the p-value is higher than 0.05 (0.4828). 


#Question 17 
#Code 
table(survey$Clap, survey$Exer)
tblClap <- table(survey$Clap, survey$Exer)
chisq.test(tblClap)
#Results: Pearson's Chi-squared test

#data:  tblClap
#X-squared = 13.32, df = 4, p-value = 0.009816
#Answer: the null hypothesis is that there is no relationship between the clapping hand and exercise levels. The p-value is p-value = 0.009816, which is below significance level 0.05, therefore this hypothesis is not rejected. But since this are two independent traits, it might not be correct. 

#Question 18
#Code
fisher.test(tblSmoke)
#Results: 
#Fisher's Exact Test for Count Data
#data:  tblSmoke
#p-value = 0.4138
#alternative hypothesis: two.sided
fisher.test(tblClap)
#Results: 
#Fisher's Exact Test for Count Data
#data:  tblClap
#p-value = 0.007343
#alternative hypothesis: two.sided
#Answer: Both p-values changed. but not enough so we can see a difference of significance. 


#Question 19 
#Code 
plot(iris$Sepal.Length, iris$Sepal.Width)
#the plot indicates there might be a slight negative correlation between the sepal length and sepal width. 
cor(iris$Sepal.Length, iris$Sepal.Width)
#Result: -0.1175698
#Answer: any correlation between variables has a range of -1, 1. this correlation coefficient is -0.1175698. 

#Question 20 
#Code
plot((iris[iris$Species=='versicolor',]$Sepal.Length), (iris[iris$Species=='versicolor',]$Sepal.Width))
cor(  (iris[iris$Species=='versicolor',]$Sepal.Length), (iris[iris$Species=='versicolor',]$Sepal.Width)  )
#Result: 0.5259107
cor.test((iris[iris$Species=='versicolor',]$Sepal.Length), (iris[iris$Species=='versicolor',]$Sepal.Width))
#Result: 
#Pearson's product-moment correlation
#data:  (iris[iris$Species == "versicolor", ]$Sepal.Length) and (iris[iris$Species == "versicolor", ]$Sepal.Width)
#t = 4.2839, df = 48, p-value = 8.772e-05
#alternative hypothesis: true correlation is not equal to 0
#95 percent confidence interval:
# 0.2900175 0.7015599
#sample estimates:
#     cor 
#0.5259107 
#Answer: The p-value is equal to  8.772e-05. This means that this correlation is significant. And the correlation = 0.5259107. 

#Question 21
#Code 
iris[1:4]
cor(iris[1:4])
cormat <- cor(iris[1:4])
#Answer: That means that the correlation between the values have a positive linear relationship. 

#Question 22
#Code 
plot(iris[1:4])
plot(iris[1:4], col=iris$Species)
#Answer: the correlation coefficients seen in the matrix are not a good reflection of what is seen in the plotting. This is because in the blotting you see that one species can have a strong negative correlation while two other species have a positive correlation. This brings down the value in the matrix, which turns out to be negative. therefore, different results are shown between the matrix and the plotting. 

#Question 23
#Code
cor(  (iris[iris$Species=='versicolor',]$Sepal.Length), (iris[iris$Species=='versicolor',]$Sepal.Width), method='spearman'  )
#Result: [1] 0.517606

#Question 24
#Code 
m1 <- lm(Petal.Length ~ Petal.Width, data=iris)
#Answer: y=2.229940x+1.083558 

#Question 25 
#Code
summary(m1)
#Results lm(formula = Petal.Length ~ Petal.Width, data = iris)
#Residuals:
# Min       1Q   Median       3Q      Max 
#-1.33542 -0.30347 -0.02955  0.25776  1.39453 
#Coefficients:
#  Estimate Std. Error t value Pr(>|t|)    
#(Intercept)  1.08356    0.07297   14.85   <2e-16 ***
#  Petal.Width  2.22994    0.05140   43.39   <2e-16 ***
#  ---
#  Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
#Residual standard error: 0.4782 on 148 degrees of freedom
#Multiple R-squared:  0.9271,	Adjusted R-squared:  0.9266 
#F-statistic:  1882 on 1 and 148 DF,  p-value: < 2.2e-16
#Answer: the variation in petal length is approximately 93% explained by the variation in petal width. 

#Question 26
#Code 
predict.lm(m1)
measured <- data.frame(Petal.Width=4)
predict.lm(m1,measured)
#Answer: the predicted petal length is 10.00332
predicted <- predict.lm(m1,measured)


# Plot the chart
m1 <- lm(Petal.Length ~ Petal.Width, data=iris)
plot(iris$Petal.Width,iris$Petal.Length,
     abline(m1))

#Question 27 
#Code 
# Plot the chart
m1 <- lm(Petal.Length ~ Petal.Width, data=iris)
plot(iris$Petal.Width,iris$Petal.Length,
     abline(m1), xlim = c(0,4), ylim = c(0,11))
plot(iris$Petal.Width,iris$Petal.Length, abline(m1), xlim = c(0,4), ylim = c(0,11)) + points(4,predicted, col="red")
#Result: integer (0)

#Question 28
#Code 
plot(iris$Petal.Width,iris$Petal.Length, abline(m1)) + points(4,predicted, col="red")
#Answer: the graph changes and the data is spread differently across the graph. 



# Use the information in the column names to generate a data.frame comprising the sample information.
names = colnames(exp)
colData <- data.frame(row.names = names,
                      type = str_split_fixed(names, "_", 3)[,1],
                      sample = str_split_fixed(names, "_", 3)[,2],
                      stimulation = str_split_fixed(names, "_", 3)[,3])

# Add library size, which is the total ammount of gene reads per sample
colData$libSize <- colSums(exp)

# Make sure that the colnames of your count table are matching with the row names of your colData
all(rownames(colData) %in% colnames(exp))

#Question 29 
#Answer: the sum of the big data file. its maximum is 8255943, and its minimum is 	5840615. 


if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")

aBiocManager::install("GenomeInfoDbData")

library(GenomeInfoDbData)

if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")

BiocManager::install("DESeq2")

library(DESeq2)

