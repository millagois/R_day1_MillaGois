#Question 06 
#Code: 
((x<-13.4)/2)->y
#answer: the value of y is 6.7. the backets around the assignments separate the operations. first, (x<-13.4); then, x/2, as a numeric value, is assigned to y. 

#Question 07 
#Code: 
(log10(x))+y
z=(log10(x))+y
#Answer: the value of z is 7.82710479836481

#Question 08 
#Code: 
print(z)
round(z, digits=3)
#Answer: the significant value of z is 7.827

#Question 09
#Code
z>10
z<2
z<10
z>2
#Answer: Yes. The value of is 2<z<10. 

age <- c(18, 21, 22, 43, 23, 54, 60, 20, 33, 72)
length(age)

#Question 10
#Code: 
which(age>50)
#Answer: 3 values are above 50. 


#Question 11
#Code: 
all(age>18)
any(age<20)
#Answer: Because the lowest age is 18. And 18 is not higher than 18, which was the question. Therefore, the sentence is false. 

s <- c("male", "female", "male", "male", "female", "female", "female") 
gender <- factor(s)

obeseGroup <- factor(c("lean", "fat", "normal", "fat", "normal", "lean", "fat"))
obeseGroup <- factor(obeseGroup, levels = c("lean","normal","fat"))
bmi <- c(18.7, 23.4, 21.5, 28.9, 24.6, 19.9, 26.5)
bmiGroup <- cut(bmi, breaks = c(0,20,25,Inf))
bmiGroup <- cut(bmi, breaks = c(0,20,25,Inf), labels = c('underweight', 'normal', 'overweight'))


#Question 12 
#Code
bmi <- c(18.7, 23.4, 21.5, 28.9, 24.6, 19.9, 26.5)
bmiGroup <- cut(bmi, breaks = c(0,20,25,Inf))
bmiGroup <- cut(bmi, breaks = c(0,20,25,Inf), labels = c('underweight', 'normal', 'overweight'))
summary(bmiGroup)
#Answer: There are 2 underweight subjects, 3 placed in normal standard and 2 overweight subjects. 

#Question 13 
#Code 
length(height)
length(weight)
#Answer: number of participants in the study is 80. 

#Question 14
#Code 
BMI= weight/(height^2)
BMI -> bmi
min(BMI) #Answer: the minimum BMI value is 17.39037
max(BMI) #Answer: the maximum BMI value is 35.32122
mean(BMI) #Answer: the average BMI is 25.03532
median(BMI) #Answer: the median BMI is 24.60192
sd(BMI) #Answer: The standard deviation is 3.680655
bmiGroup <-cut(bmi, breaks = c(0,18.6,24,29,Inf)) #first, break the Bmi groups into smaller groups
bmiGroup <-cut(bmi, breaks = c(0,18.6,24,29,Inf), labels=c('underweight','normal','overweight', 'obese')) #then, label them. 
summary (bmiGroup) #get a summary 
#Answer: number of obese individuals = 12, number of overweight individuals = 32. 


#Question 15 
#Code: 
bmiGroup <-cut(bmi, breaks = c(0,18.6,24,29,Inf)) #first, break the Bmi groups into smaller groups
bmiGroup <-cut(bmi, breaks = c(0,18.6,24,29,Inf), labels=c('underweight','normal','overweight', 'obese')) #then, label them. 
summary (bmiGroup) #get a summary 
#Answer: 4 underweight individuals, 32 normal, 32 overweight and 12 obese. 

#Question 16
#Code 
cbind(height,weight,BMI)
rownames(data) <- paste("individual",c=(1:80))
#Answer: column names are Height, Weight and BMI. 

#Question 17 
#Code
data[54,]
#Answer: Height: 1.81m Weight: 87.00 and BMI: 26.55597

#Question 18
#Code
which.max(data[,3])
#Answer: Individual 77, with BMI = 35.32122 

#Question 19 
#Code
class("mydata")
#Answer: Character 

#Question 20
#Code 
try<- rbind("mydata", c(31,"female",65))
#Answer: This adds the numbers as extra characters, which means that later on one cannot calculate mean, or sum or do any mathematical operations. 

#Question 21 
#Code
extrarow <- data.frame(age=31, gender= "female", weight=65)
mydataextra <- rbind(mydata, extrarow)
#Answer: Since now, it is possible to perform mathematical operations, the data frame is correct. 

#Question 22
#Code 
rownames(mydataextra) <- c("Bob", "Mary","Jason", "Susan")
colnames(mydataextra)<- c("AGE","GENDER","WEIGHT")
mydataextra["Jason", "AGE"] #Answer: 56
mydataextra[,3] #Answer: 80,55,70 and 65. 

#Question 23 
#Code: 
setwd('C:/Users/Milla Gois/Downloads')
load('newdata.Rdata')
class(newdata) #Answer: data.frame 
class(newdata$gender) #Answer: Factor

#Question 24 
#Code 
newdata2 <- newdata[order(rownames(newdata)),]
data2 <- data[order(rownames(data)),]
Phenotypes <- cbind(data2,newdata2)
Phenotypes[Phenotypes$gender=='female',3]
mean(Phenotypes[Phenotypes$gender=='female',3])
#Answer: average BMI for females = 24.76926

#Question 25 
#Code 
mylist <- list(name="Fred", 
               wife=c("Catherine"), 
               parents=c("Patrick", "Corney"), 
               no.children=3, 
               child.ages=c(4,7,9))
sum(mylist[["child.ages"]]) 
#Answer: 20 

getwd() 

#Question 26
#Code
read.table('myfirstfile.txt')
read.table('myfirstfile.txt', sep="_")
#Answer: it gets confusing. the separations don't appear clear. 

#Question 27 
#Code
read.table('myfirstfile.txt', header = T)
#Answer: it looks similar than the initial version. but more organized. 

df <- read.table('myfirstfile.txt', header = T)
save(Phenotypes, file = 'C:/Users/Milla Gois/Downloads/Phenotypes.Rdata')

#Question 28 
#Code 
write.table(df, 'mysecondfile.txt')

