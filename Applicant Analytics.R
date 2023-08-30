rm(list = ls())
#interactively set the working directory to the folder where the dataset is stored:
setwd(choose.dir())


Applicants<-read.table("/Users/liuxinyu/Downloads/ApplicantPool_exercise_v2.csv",header=T,sep="\t")

#structure command
str(Applicants)

#shows data with columns
fix(Applicants)

names(Applicants)

#[1] "ApplicantCode" "Gender"        "BAMEyn"        "ShortlistedNY" "Interviewed"   "FemaleONpanel" "OfferNY"      
#[8] "AcceptNY"      "JoinYN"    

#make the dataset live

attach(Applicants)

Gender <- factor(Gender,
levels = c(1,2),
labels = c("Male", "Female"))
Freq1=table(Gender)
Freq1
PcntGender <- table(Gender)
prop.table(PcntGender)
xoutG <- as.data.frame(table(Gender))
#turn table into dataframe
GenderFrameProps <- transform(xoutG, cumFreq = cumsum(Freq), relative = prop.table(Freq))
GenderFrameProps


BAME <- factor(BAMEyn,
levels = c(1,2),
labels = c("BAMEyes", "BAMEno"))
Freq2=table(BAME)
Freq2
PcntBAME <- table(BAME)
prop.table(PcntBAME)
xoutB <- as.data.frame(table(BAME))
#turn table into dataframe
BAMEFrameProps <- transform(xoutB, cumFreq = cumsum(Freq), relative = prop.table(Freq))
BAMEFrameProps

Short <- factor(ShortlistedNY,
levels = c(0,1),
labels = c("ShortListNo", "ShortListYes"))
Freq3=table(Short)
Freq3
PcntShort <- table(Short)
prop.table(PcntShort)
xoutSH <- as.data.frame(table(Short))
#turn table into dataframe
ShortFrameProps <- transform(xoutSH, cumFreq = cumsum(Freq), relative = prop.table(Freq))
ShortFrameProps

Inter <- factor(Interviewed,
levels = c(0,1),
labels = c("InterviewedNo", "InterviewedYes"))
Freq4=table(Inter)
Freq4
PcntInter <- table(Inter)
prop.table(PcntInter)
xoutInt <- as.data.frame(table(Inter))
#turn table into dataframe
InterFrameProps <- transform(xoutInt, cumFreq = cumsum(Freq), relative = prop.table(Freq))
InterFrameProps


FPanel <- factor(FemaleONpanel,
levels = c(1,2),
labels = c("MaleOnly", "FemaleOnPanel"))
Freq5=table(FPanel)
Freq5
PcntFPanel <- table(FPanel)
prop.table(PcntFPanel)
xoutPan <- as.data.frame(table(FPanel))
#turn table into dataframe
PanelFrameProps <- transform(xoutPan, cumFreq = cumsum(Freq), relative = prop.table(Freq))
PanelFrameProps




Offer <- factor(OfferNY,
levels = c(0,1),
labels = c("Offer Not Made", "Offer Made"))
Freq6=table(Offer)
Freq6
PcntOffer <- table(Offer)
prop.table(PcntOffer)
xoutOffer <- as.data.frame(table(Offer))
#turn table into dataframe
OfferFrameProps <- transform(xoutOffer, cumFreq = cumsum(Freq), relative = prop.table(Freq))
OfferFrameProps



Accept <- factor(AcceptNY,
levels = c(0,1),
labels = c("Declined", "Accepted"))
Freq7=table(Accept)
Freq7
PcntAccept <- table(Accept)
prop.table(PcntAccept)
xoutAccept <- as.data.frame(table(Accept))
#turn table into dataframe
AcceptFrameProps <- transform(xoutAccept, cumFreq = cumsum(Freq), relative = prop.table(Freq))
AcceptFrameProps

Joined <- factor(JoinYN,
levels = c(0,1),
labels = c("NotJoined", "JoinedYes"))
Freq8=table(Joined)
Freq8
PcntJoined <- table(Joined)
prop.table(PcntJoined)
xoutJoined <- as.data.frame(table(Joined))
#turn table into dataframe
JoinedFrameProps <- transform(xoutJoined, cumFreq = cumsum(Freq), relative = prop.table(Freq))
JoinedFrameProps

#for crosstab 
BAMEByShortlisted=table(BAME, Short)
BAMEByShortlisted

margin.table(BAMEByShortlisted,1)
#Proportion of BAME who were shortlisted
prop.table(BAMEByShortlisted,1)

margin.table(BAMEByShortlisted,2)
#Proportion of shortlisted option who were BAME or not
prop.table(BAMEByShortlisted,2)

chisq.test(BAMEByShortlisted) 


