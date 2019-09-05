# Lecture 2 exercise  (created on Sept 5, 2019)

number<-5+2
number*2

(times<-c(60,40,33,15,20,55,35))
times/60

mean(times)
sqrt(times)
range(times)

#This is a comment
times<30#This is an inline comment
times==20
times!=20
times>20 & times<50
times<20 | times>50
which(times<30)
sum(times<30) #identify #entries that meet the criteria
a<-all(times<30)

#Subsetting
times[3]
times[-3]
times[c(2,4)]
times[c(4,2)]
times[1:5]
times[times<30]

times[times>50]<-50

#Missing data
times[8]<-NA
mean(times)
?mean
mean(times,na.rm=T)
mean(times,0,T) #name 3rd arg

mean(x<-times,na.rm=T)
mean(na.rm=T,x<-times)

#Data frame
mtcars
str(mtcars) #structure of dataframe
names(mtcars)
mtcars$mpg

