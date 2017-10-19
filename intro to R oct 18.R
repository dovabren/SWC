#read in csv file
#dont want to only go from the full path (/Users/dovabrenman/Desktop/SWC/data/cat.csv)
#so set a new working directory 
# need have " around the data file and will print in the console 
read.csv("data/cat.csv")
#assign the data to a variable 

cats<-read.csv("data/cat.csv")
cats
#select a specific column 
cats$weight
mean(cats$weight)

#data frame can have vectors of both characters and numbers
#need to look at type of your columns
typeof(cats$weight)
#double means double decision and its saying its a decimal number
# can be integer or double
typeof(cats$like_string)

#can convert logicals to true=1 and false =0
as.logical(cats$like_string)
#now its converted to a string
cats$like_string

#first row, first column [row,column]
cats[1,1]
#the levels are factors 
class(cats$cat_coat)

#renaming: check name, make new vector with the names, check
#or can assign a name to a specific one >name(cats)[1]<-"coats"
names(cats)
names(cats) <- c("coat","weight","like-string")
names(cats)

#find number of rows
nrow(cats)
ncol(cats)
#all dimensions 
dim(cats)


