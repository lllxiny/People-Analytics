
rm(list = ls())
#interactively set the working directory to the folder where the dataset is stored:
setwd(choose.dir())




Survey <-read.xlsx("hr.xlsx")

Survey <-read.table("hr.xlsx",header=T,sep="\t")

names(Survey)

#"sex"       "jbstatus"  "age"       "tenure"    "ethnicity" "ManMot1"   "ManMot2"   "ManMot3"   "ManMot4"   "ocb1"     
#[11] "ocb2"      "ocb3"      "ocb4"      "aut1"      "aut2"      "aut3"      "Justice1"  "Justice2"  "Justice3"  "JobSat1"  
#[21] "JobSat2"   "Quit1"     "Quit2"     "Quit3"     "Man1"      "Man2"      "Man3"      "Eng1"      "Eng2"      "Eng3"     
#[31] "Eng4"      "pos1"      "pos2"      "pos3"  

#make the dataset live
attach(Survey)

#install.packages("psych") - if not already installed
library(psych)
#install.packages("GPArotation") - if not already installed
library(GPArotation)
#install.packages("mvtnorm") - if not already installed
library(mvtnorm)
#install.packages("nFactors") - if not already installed
library(nFactors)
library(readxl)

#select subset of variables for EFA
FORefa <-subset(Survey, select = c(Eng1, Eng2, Eng3, Eng4,Eng5, Eng6, Eng7))
#omit cases with missing data
v <- na.omit(FORefa)

# get eigenvalues of factors in selected EFA variables Figure 5.7
ev <- eigen(cor(v)) 
ev

# note here the number of eigen values that are greater than 1= optimal number of factors
#THUS we can then ask for the loadings in this case there are 2 eigen values > 1

#for other additional fit statistics / results 
ap <- parallel(subject=nrow(v),var=ncol(v),
  rep=100,cent=.05)
ap
nS <- nScree(x=ev$values, aparallel=ap$eigen$qevpea)
plotnScree(nS)
#this produces a scree plot with 2 factors with eigen values > 1

#so ask for loadings with 2 factors (Figure 5.8)

Loadings2f <- principal(v,nfactors=2,rotate="varimax")
Loadings2f


index1 <- Loadings2f$scores[,1]
index2 <- Loadings2f$scores[,2]

lm(index1~., data = Survey)



data <- data.frame(Engagement = index1,
                   pr1 = Survey$Age,
                   pr2 = Survey$Attrition,
                   pr3 = Survey$BusinessTravel,
                   pr4 = Survey$DailyRate,
                   pr5 = Survey$Department,
                   pr6 = Survey$DistanceFromHome,
                   pr7 = Survey$Education,
                   pr8 = Survey$EducationField,
                   pr9 = Survey$EmployeeCount,
                   pr11 = Survey$EnvironmentSatisfaction,
                   pr12 = Survey$Gender,
                   pr13 = Survey$HourlyRate,
                   Predictor1 = Survey$Eng1,  # Replace with the actual variable name
                   Predictor2 = Survey$Eng2,  # Replace with the actual variable name
                   Predictor3 = Survey$Eng3,
                   Predictor4 = Survey$Eng4,
                   Predictor5 = Survey$Eng5,
                   Predictor6 = Survey$Eng6,
                   Predictor7 = Survey$Eng7)  # Replace with the actual variable name
model <- lm(Engagement ~ ., data = data)

summary(model)
