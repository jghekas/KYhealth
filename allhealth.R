##combining all code:

library(reshape2)
library(car)
library(RItools)
library(optmatch)
library(brglm)
library(MASS)
setwd('~')

## To make the saved datasets:
## First the CDC data

#mort99 = read.fwf('~/Downloads/mort/MORT9913.txt',width=c(2,3,4,1,1,2,4,3,4))
#colnames(mort99) = c('state','county','year','racesex','hisp','age','ICD10cause','cause','deaths')
#pop99 = read.fwf('~/Downloads/pop9913.txt',width=c(2,3,4,1,1,rep(8,14),25,1))
#colnames(pop99) = c('state','county','year','racesex','hisp','birth','l1','a14','a59','a1014','a1519','a2024','a2534','a3544','a4554','a5564','a6574','a7584','a85','name','type')
#arf= read.csv('~/Downloads/arfarfsixten.csv',header=T)
#colnames(arf) = c('state','county','med610','medinc10','medinc06','pov10','pov06','ins10','ins06','unemp10','unemp06')

## These were saved using the commands:

#save(mort99, file = 'mort99.Rdata')
#save(pop99, file = 'pop99.Rdata')


## And can then be read in using the commands:
#load('mort99.Rdata')
#load('pop99.Rdata')

## The datasets model2data, model3data, and model4data were made and saved according to the following code:
#
#pop06=subset(pop99,pop99$year>=2001 & pop99$year<=2006)
#pop06=subset(pop06,pop06$type==3)
#pop06$a2034=pop06$a2024+pop06$a2534
#popall=subset(pop99,pop99$type==3)
#popall$a2034=popall$a2024+popall$a2534
#agemat=aggregate(cbind(a2034,a3544,a4554,a5564)~county+state,sum,data=pop06)
#ages=cbind(agemat[,1:2],100*t(apply(agemat[,3:6],1,prop.table)))

#racesexmat=aggregate(cbind(count=a2034+a3544+a4554+a5564)~racesex+county+state,sum,data=pop06)
#racesmat=racesexmat
#racesmat$race=recode(racesexmat$racesex,"1:2=1; 3:4=2; 5:8=3")
#racesmat$race[racesmat$race==1]="white"
#racesmat$race[racesmat$race==2]="black"
#racesmat$race[racesmat$race==3]="otherrace"
#races=aggregate(count~race+county+state,sum,data=racesmat)
#races=dcast(data=races,state+county~race)
#race=cbind(races[,1:2],100*t(apply(races[,3:5],1,prop.table)))

#sexmat=racesexmat
#sexmat$sex=recode(racesexmat$racesex, "1=1; 2=2; 3=1; 4=2; 5=1; 6=2; 7=1; 8=2")
#sexmat$sex[sexmat$sex==1]="male"
#sexmat$sex[sexmat$sex==2]="female"
#sexes=aggregate(count~sex+county+state,sum,data=sexmat) 
#sexes=dcast(data=sexes,state+county~sex)
#sex=cbind(sexes[,1:2],100*t(apply(sexes[,3:4],1,prop.table)))

#hispmat=aggregate(cbind(count=a2034+a3544+a4554+a5564)~hisp+county+state,sum,data=pop06)
#hispmat$hisp=recode(hispmat$hisp, '2=1; 1=2; 9=2')
#hispmat$hisp[hispmat$hisp==1]="hisp"
#hispmat$hisp[hispmat$hisp==2]='nothisp'
#hisps=aggregate(count~hisp+county+state,sum,data=hispmat) 
#hisps=dcast(data=hisps,state+county~hisp)
#hisp=cbind(hisps[,1:2],100*t(apply(hisps[,3:4],1,prop.table)))
#mort06=subset(mort99,mort99$year>=2001 & mort99$year<=2006)
#mort06=subset(mort06,mort06$age>=09 & mort06$age<=13)
#deaths=aggregate(deaths~county+state+year,sum,data=mort06)
#pop06$pops=pop06$a2024+pop06$a2534+pop06$a3544+pop06$a4554+pop06$a5564
#pops=aggregate(pops~county+state+year,sum,data=pop06)
#popweights=aggregate(pops~county+state,sum,data=pop06)
#total=merge(pops,deaths,by=c('year','state','county'))
#total$mrate=total$deaths/total$pops*100000
#totals=dcast(data=total,state+county~year,value.var='mrate')
#colnames(totals)=c('state','county','mr01','mr02','mr03','mr04','mr05','mr06')
#mortall=subset(mort99, mort99$age>=09 & mort99$age<=13)
#deathall=aggregate(deaths~county+state+year, sum, data=mortall)
#popall$pops=popall$a2024+popall$a2534+popall$a3544+popall$a4554+popall$a5564
#popall=aggregate(pops~county+state+year,sum,data=popall)
#totalall<-merge(popall,deathall,by=c('year','state','county'))
#totalall$mrate=totalall$deaths/totalall$pops*100000
#totalsall=dcast(data=totalall,state+county~year,value.var='mrate')
#colnames(totalsall)=c('state','county','mr99','mr00','mr01','mr02','mr03','mr04','mr05','mr06','mr07','mr08','mr09','mr10','mr11','mr12','mr13')
#totalsall[is.na(totalsall)]=0
#model2data=merge(ages,race,by=c('state','county'))
#model2data=merge(model2data,sex,by=c('state','county'))
#model2data=merge(model2data,hisp,by=c('state','county'))
#model2data=merge(model2data,totals,by=c('state','county'))
#model2data$treat=0
#model2data$treat[model2data$state==25]=1
#model2data=merge(model2data,arf,by=c('state','county'))
#model2data=merge(model2data,popweights,by=c('state','county'))
#model2data[is.na(model2data)]=0


##dataset for KY and TN
#pop13=subset(pop99,pop99$year>=2005)
#pop13=subset(pop13,pop13$type==3)
#pop13$a2034=pop13$a2024+pop13$a2534

#agemat=aggregate(cbind(a2034,a3544,a4554,a5564)~county+state,sum,data=pop13)
#ages=cbind(agemat[,1:2],100*t(apply(agemat[,3:6],1,prop.table)))

#racesexmat=aggregate(cbind(count=a2034+a3544+a4554+a5564)~racesex+county+state,sum,data=pop13)
#racesmat=racesexmat
#racesmat$race=recode(racesexmat$racesex,"1:2=1; 3:4=2; 5:8=3")
#racesmat$race[racesmat$race==1]="white"
#racesmat$race[racesmat$race==2]="black"
#racesmat$race[racesmat$race==3]="otherrace"
#races=aggregate(count~race+county+state,sum,data=racesmat)
#races=dcast(data=races,state+county~race)
#race=cbind(races[,1:2],100*t(apply(races[,3:5],1,prop.table)))

#sexmat=racesexmat
#sexmat$sex=recode(racesexmat$racesex, "1=1; 2=2; 3=1; 4=2; 5=1; 6=2; 7=1; 8=2")
#sexmat$sex[sexmat$sex==1]="male"
#sexmat$sex[sexmat$sex==2]='female'
#sexes=aggregate(count~sex+county+state,sum,data=sexmat) 
#sexes=dcast(data=sexes,state+county~sex)
#sex=cbind(sexes[,1:2],100*t(apply(sexes[,3:4],1,prop.table)))

#hispmat=aggregate(cbind(count=a2034+a3544+a4554+a5564)~hisp+county+state,sum,data=pop13)
#hispmat$hisp=recode(hispmat$hisp, "2=1; 1=2; 9=2")
#hispmat$hisp[hispmat$hisp==1]="hisp"
#hispmat$hisp[hispmat$hisp==2]='nothisp'
#hisps=aggregate(count~hisp+county+state,sum,data=hispmat) 
#hisps=dcast(data=hisps,state+county~hisp)
#hisp=cbind(hisps[,1:2],100*t(apply(hisps[,3:4],1,prop.table)))

#mort13=subset(mort99,mort99$year>=2005)
#mort13=subset(mort13,mort13$age>=09 & mort13$age<=13)
#deaths=aggregate(deaths~county+state+year,sum,data=mort13)
#pop13$pops=pop13$a2024+pop13$a2534+pop13$a3544+pop13$a4554+pop13$a5564
#pops=aggregate(pops~county+state+year,sum,data=pop13)
#popweights=aggregate(pops~county+state,sum,data=pop13)
#total=merge(pops,deaths,by=c('year','state','county'))
#total$mrate=total$deaths/total$pops*100000
#totals=dcast(data=total,state+county~year,value.var='mrate')
#colnames(totals)=c('state','county','mr05','mr06','mr07','mr08','mr09','mr10','mr11','mr12','mr13')
#totals[is.na(totals)]=0

#model3data=merge(ages,race,by=c('state','county'))
#model3data=merge(model3data,sex,by=c('state','county'))
#model3data=merge(model3data,hisp,by=c('state','county'))
#model3data=merge(model3data,totals,by=c('state','county'))
#model3data=merge(model3data,popweights,by=c('state','county'))
#model3data=merge(model3data,arf,by=c('state','county'))

#states.kycontrol=c('1','12','13','16','20','21','22','23','28','29','31','37','40','45','46','47','48','49','51','55','56') #includes Kentucky and other control states
#length(states.kycontrol)
#model3dat=model3data
#model3data=model3data[model3data$state %in% states.kycontrol,]
#model3data$treat=0
#model3data$treat[model3data$state==21]=1

#model4data=model3dat
#model4data$treat=0
#model4data$treat[model4data$state==47]=1
#states.tncontrol=c('4','5','6','8','9','10','17','18','19','21','24','25','26','27','30','32','33','34','35','36','38','39','41','42','44','47','50','53','54')
#model4data=model4data[model4data$state %in% states.tncontrol,]



#save(model2data, file = 'model2data.Rdata')
#save(model3data, file = 'model3data.Rdata')
#save(model4data, file = 'model4data.Rdata')



## To load in the saved dataframes

load('model2data.Rdata')
load('model3data.Rdata')
load('model4data.Rdata')

arfins = read.csv('~/Downloads/arfinsur.csv',header=T)
colnames(arfins) = c('state','county','ins10a','ins06a')
modela2data = merge(model2data,arfins, by=c('state','county'))
model2=glm(treat~a2034+a3544+a4554+male+white+black+hisp+mr01+mr02+mr03+mr04+mr05+mr06+pov06+medinc06+unemp06+ins06a,data=modela2data,family=binomial(link='logit'))
fit=fitted(model2)
model2dat=cbind(modela2data,fit)
men.treat=subset(model2dat,model2dat$treat==1)
men.control=subset(model2dat,model2dat$treat==0)
top4=summary(model2dat$fit)[5]
men.control=subset(men.control,men.control$treat!=1)
men.control=subset(men.control, men.control$fit>top4)
men.study=rbind(men.treat,men.control)
xBalance(treat~a2034+a3544+a4554+a5564+black+otherrace+white+male+hisp+mr05+mr06+mr01+mr02+mr03+mr04+pov06+medinc06+unemp06+ins06a, data=men.studya,report=c('z.scores','chisquare.test','p.value'))
xBalance(treat~a2034+a3544+a4554+a5564+black+otherrace+white+male+hisp+mr05+mr06+mr01+mr02+mr03+mr04+pov06+medinc06+unemp06+ins06a, element.weights=pops, data=men.study,report=c('z.scores','chisquare.test','p.value'))
mean(men.treat$white)
mean(men.control$white)


men.study.out = merge(men.study, totals, by=c('state','county'), all.x=T)
men.study.out = men.study.out[complete.cases(men.study.out),]
#creating differences-in-differences
men.study.out$mr07 = men.study.out$mr07 - men.study.out$mr06.y
men.study.out$mr08 = men.study.out$mr08 - men.study.out$mr06.y
men.study.out$mr09 = men.study.out$mr09 - men.study.out$mr06.y
men.study.out$mr10 = men.study.out$mr10 - men.study.out$mr06.y

xBalance(treat~mr07+mr08+mr09+mr10,element.weights=pops,data=men.study.out,report=c('z.scores','p.value','chisquare.test'))



#neg bin 
popall=subset(pop99, pop99$type==3)
popall$a2034=popall$a2024+popall$a2534
popa = popall[, c(1:5, 14:16, 22)]
popa = melt(popa, id=c('state','county','year','racesex','hisp'))
colnames(popa) = c('state','county','year','racesex','hisp','age','count')
popa$age = recode(popa$age, "'a3544'=11; 'a4554'=12; 'a5564'=13; 'a2034'=10")
morta = subset(mort99, mort99$age>=9 & mort99$age <=13)
morta$age = recode(morta$age, "9=10; 10=10; 11=11; 12=12; 13=13")
morta = aggregate(deaths~state+county+year+racesex+hisp+age,sum,data=morta)
deathdata = merge(popa, morta, by=c('state','county','year','racesex','hisp','age'), all=T)
deathdata[is.na(deathdata)]=0
deathdata$treat=0
deathdata$treat[deathdata$state==25 & deathdata$year>2006]=1
deathdata = subset(deathdata, deathdata$count>0)
deathdata = deathdata[-which(deathdata$deaths/deathdata$count>1),]
#there were 8 counties that had a death count higher than the population count.  These all had counts of 1 and deaths of 2 or 3.
deathdata$racesex = as.factor(deathdata$racesex)
deathdata$state = as.factor(deathdata$state)
deathdata$year = as.factor(deathdata$year)

arf08 = read.csv('~/Downloads/arf08vars.csv',header=T)
arf12 = read.csv('~/Downloads/arf12vars.csv',header=T)
colnames(arf08) = c('state','county','inc07','inc06','inc05','inc04','inc03','inc02','inc01','inc00',
                    'pov07','pov06','pov05','pov04','pov03','pov02','pov01','pov00',
                    'ins05','emp07','emp06','emp05','emp04','emp03','emp02','emp01','emp00')
colnames(arf12) = c('state','county','inc11','inc10','inc09','inc08','inc07','inc06','inc05',
                    'pov11','pov10','pov09','pov08','pov07','pov06','pov05','ins10','ins09','ins08',
                    'ins07','ins06','emp11','emp10','emp09','emp08','mep07','emp06','emp05')
arf12 = arf12[,-c(7,8,9,14,15,16,26,27,28)]
arfnb = merge(arf08, arf12, by=c('state','county'))
arfnb1 = arfnb
arfnb = melt(arfnb, id=c('state','county'))
head(arfnb)
y = data.frame(arfvar=substr(arfnb$variable, 1,3), year=as.numeric(substr(arfnb$variable,4,5)))
arfnb = cbind(arfnb, y)
head(arfnb)
arfnb$year=recode(arfnb$year, "7=2007;0=2000; 1=2001; 2=2002; 3=2003; 4=2004; 5=2005; 6=2006; 8=2008; 9=2009; 10=2010; 11=2011")
arfnb = arfnb[,-3]
arfnb = dcast(data=arfnb, state+county+year~arfvar)

deathdata1 = merge(deathdata, arfnb, by=c('state','county','year'))
deathdata1 = subset(deathdata1,deathdata1$year!=1999 & deathdata1$year!=2000 & deathdata1$year!=2011 & deathdata1$year!=2012 & deathdata1$year!=2013)



model5 = glm(deaths/count~state+year+treat+racesex+hisp+age+emp+inc+pov,data=deathdata1,weights=count,family=binomial(link=log))
summary(model5)



mass.ins = subset(arfnb1, arfnb1$state==25)
mass.ins = mass.ins[,c(1,2,19,36:40)]
mass.ins = apply(mass.ins, 2, mean)
mass.ins = mass.ins[c(3,8,7,6,5,4)]
nonmass.ins = subset(arfnb1, arfnb1$state!=25)
nonmass.ins = nonmass.ins[,c(1,2,19,36:40)]
nonmass.ins = apply(nonmass.ins, 2, mean)
nonmass.ins = nonmass.ins[c(3,8,7,6,5,4)]
nonmass.con.ins = merge(arfnb1, men.control, by=c('state','county'))
nonmass.con.ins = nonmass.con.ins[,c(1,2,19,36:40)]
nonmass.con.ins = apply(nonmass.con.ins,2,mean)
nonmass.con.ins = nonmass.con.ins[c(3,8,7,6,5,4)]
plot(x=c(5:10),mass.ins,type='l',col='red',ylim=c(5,22))
lines(x=c(5:10),nonmass.ins,col='blue')
lines(x=c(5:10),nonmass.con.ins,col='purple')






