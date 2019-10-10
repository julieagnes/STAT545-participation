#  Created on Oct 8, 2019
#  Last updated on Oct 8, 2019

library('tidyverse')
library('gapminder')
library(here)

getwd()
"C:/Users/JPark/Documents/
STAT545-participation2019/STAT545-participation/STAT545-participation"

#--------------------------------------------------------------------------#
#1. Write csv files
write_csv(gapminder,'./gapminder.csv')


# Calculate mean life Exp per continent
gapminder_sum<-gapminder %>% 
                group_by(continent) %>% 
                summarize(ave_lifeExp=mean(lifeExp))  

View(gapminder_sum)
write_csv(gapminder_sum,'./weeks_6_to_7/data/gapminder_sum.csv')
write_csv(gapminder_sum, here::here('weeks_6_to_7','data','gapminder_sum.csv'))

gapminder_sum %>% 
  ggplot(aes(x=continent, y=ave_lifeExp))+geom_point() + theme_bw()

#--------------------------------------------------------------------------#
#2. Read csv files
gapminder_csv<-read_csv('./weeks_6_to_7/data/gapminder_sum.csv')
View(gapminder_csv)


read_csv('./weeks_6_to_7/data/gapminder_sum.csv')
#Another way using here; platform agnostic, dir-structure
read_csv(here::here('weeks_6_to_7','data','gapminder_sum.csv'))

#A couple more things about here
set_here()


#--------------------------------------------------------------------------#
#3. Read excel file
#test<-read_csv("./GreatestGivers.xls")


#3.1 Read in GreatestGivers.xls
## datafile: https://beannumber.github.io/sds192/lab-import.html#data_from_an_excel_file

data_url<-'http://gattonweb.uky.edu/sheather/book/docs/datasets/GreatestGivers.xls'

#read_csv directly import URLS but read_excel requries you to first download it
#(i.e. if data_url is csv file, read_csv(data_url) is enough)

#i) Download the file
download.file(url=data_url, destfile=paste('./weeks_6_to_7/data/',file_name ))
#Task: change above to use the "here::here" package
download.file(url=data_url, mode='wb',
              destfile=here::here('weeks_6_to_7','data','greatestGivers.xls'))#downloads file for you 

#Recommendation: use basename
file_name<-basename(data_url)
download.file(url=data_url, mode='wb',
              destfile=here::here('weeks_6_to_7','data',basename(data_url)))

#ii) Import xls file into R
library(readxl)
philanthropists<-read_excel(here::here('weeks_6_to_7','data',file_name), trim_ws=T)




#--------------------------------------------------------------------------#
#3.2 File to load in for class demo
#i) Import xlsx data
mri_file<-here::here('weeks_6_to_7','data','Firas-MRI.xlsx') #define a directory for an xls file
mri<-read_excel(mri_file, range='A1:L12')

test<-read_excel(here::here('weeks_6_to_7','data','Firas-MRI.xlsx'), trim_ws=T)

#ii) Manipulate data
mri<-mri[,-10]
mri1<-mri%>% pivot_longer(cols='Slice 1':'Slice 8', 
                          names_to='slice_no',values_to='value')








