#Rscript
#Author: Yunlong Ma
#Co-expression patterns by using the Pearson correlation analysis


#Set up the working directory
setwd("C:\\Users\\Administrator\\Desktop\\corplot")

#Part I install package

#Installing corrplot package of R platform 
if(!require("corrplot"))install.packages("corrplot")

#Load the corrplot package
library(corrplot)


#Take a example for using the corrplot package
#y <- cor(mtcars)
#corrplot(y,method="circle")
#corrplot(y,method="circle",tl.col = "black")
#corrplot.mixed(y,tl.col = "black")
#corrplot.mixed(y, lower.col = "black", number.cex = .7,tl.col = "black")
#corrplot(y, method = "pie",tl.col = "black")


#Part II read relevant RNA expression data of co-expression analysis

#Read and re-organized CAD-related expression data
pearson<- read.delim("CAD.txt",header = T)
pearson_new2<-pearson[,c(-1,-2)] 
mat_pearson<-as.matrix(pearson_new2)
row.names(mat_pearson)<- pearson[,2]
correlation_CAD <- cor(t(mat_pearson))


#Read and re-organized Control-related expression data
pearson_new<- read.delim("Control.txt",header = T)
pearson_new3<-pearson_new[,c(-1,-2)]
mat_pearson1<-as.matrix(pearson_new3)
row.names(mat_pearson1)<- pearson_new[,2]
correlation_Control <- cor(t(mat_pearson1))


#Part III Visualization

#Ploting the identified genes co-expression patterns in the CAD group
corrplot(correlation_CAD, method = "pie",tl.col = "black",tl.cex=0.8)

#Ploting the identified genes co-expression patterns in the control group
corrplot(correlation_Control, method = "pie",tl.col = "black",tl.cex=0.8,number.cex = 0.8)


#End
