#reading off of github - downloads it from github and then puts it into a new folder 
download.file("https://raw.githubusercontent.com/swcarpentry/r-novice-gapminder/gh-pages/_episodes_rmd/data/gapminder-FiveYearData.csv", destfile = "data/gapminder-FiveYearData.csv")
read.csv("data/gapminder-FiveYearData.csv")
gapminder<- read.csv("data/gapminder-FiveYearData.csv")
gapminder
mean(gapminder$lifeExp)

#most recent value per country
max(gapminder$year)

# = is changing the name to 2007, == is a question to ask if its equal to 2007 
gapminder$year == 2007
#[] with nothing after the comma will then report everything from 2007 
gapminder2007<-gapminder[gapminder$year == 2007,]

mean(gapminder2007$lifeExp)

#compare to full data frame
mean(gapminder$lifeExp)

#task to do the same for the earliest year 
min(gapminder$year)
gapminder$year == 1952
gapminder1952<-gapminder[gapminder$year == 1952,]
mean(gapminder1952$lifeExp)

#can do this faster with tidyverse 


#2 major plotting techniques - preinstalled (plot)
plot(gapminder$lifeExp, gapminder$gdpPercap)
#ggplot2 is part of tidyverse
#load package that was already installed 
library(tidyverse)
#first argument is the data, then need to specify what on the X and Y
#second is asthetitc X and Y
#third is the type of plot (after the +) and call it with a geom_ type of graph
#dont need to put anything in the ()
ggplot(data=gapminder,aes(x=gdpPercap, y=lifeExp)) + geom_point()

#task: show how life exp changes over time 
ggplot(data=gapminder,aes(x=year, y=lifeExp)) + geom_point()

#if want to look at one country - can make own data frame of one country then plot again

#set different colors for different continent
ggplot(data=gapminder,aes(x=year, y=lifeExp, color=continent)) + geom_point()

#draw lines between countries and color the continents 
ggplot(data=gapminder,aes(x=year, y=lifeExp, by= country, color=continent)) + geom_point() + geom_line()

#vary colors by continent 
ggplot(data=gapminder,aes(x=gdpPercap, y=lifeExp, color=continent)) + geom_point()

#try log to make more legible - here we scale the x axis bc its so much bigger 
ggplot(data=gapminder,aes(x=gdpPercap, y=lifeExp, color=continent)) + geom_point() +scale_x_log10()

#run regression with geom_smooth for each continent
ggplot(data=gapminder,aes(x=gdpPercap, y=lifeExp, color=continent)) + geom_point() +scale_x_log10() +geom_smooth(method="lm")

#including country
ggplot(data=gapminder,aes(x=gdpPercap, y=lifeExp, color=continent, by=country)) + geom_point() +scale_x_log10() +geom_smooth(method="lm")

#faceting - one plot per variable (here by country)
ggplot(data=gapminder,aes(x=gdpPercap, y=lifeExp, color=continent, by=country)) + geom_point() +scale_x_log10() +geom_smooth(method="lm") + facet_wrap(~ continent)

#facet by country -- very small bc so many countries 
ggplot(data=gapminder,aes(x=gdpPercap, y=lifeExp, color=continent, by=country)) + geom_point() +scale_x_log10() +geom_smooth(method="lm") + facet_wrap(~ country)

#facet for Americas 
ggplot(data=gapminder[gapminder$continent=="Americas",],aes(x=gdpPercap, y=lifeExp, color=continent, by=country)) + geom_point() +scale_x_log10() +geom_smooth(method="lm") + facet_wrap(~ country)

#just canada
ggplot(data=gapminder[gapminder$country=="Canada",],aes(x=gdpPercap, y=lifeExp, color=continent, by=country)) + geom_point() +scale_x_log10() +geom_smooth(method="lm") + facet_wrap(~ country)

#interactive plotting with plotly (dont need to install every time)- can put in a conditional statement that says "if you dont have this package, install"
#loop to instal plotly if not installed 
#! flips the logical so says its not true - so its saying if theres no plotly, install it
# ! is in place of an else statement 
if(!require("plotly")) {install.packages("plotly")}


# original code without the code: install.packages("plotly")

library(plotly)
#assign ggplot to an object 
p<- ggplot(data=gapminder[gapminder$continent=="Americas",],aes(x=gdpPercap, y=lifeExp, color=continent, by=country)) + geom_point() +scale_x_log10() +geom_smooth(method="lm") + facet_wrap(~ country)
#can also save as an object and add layers that way 
p + geom_abline()

#now it will be interactive and you can zoom in on a portion of the graph 
ggplotly(p)

#making nice labels with labs()
p + labs(x="GDP Per Capita", y= "Life Expectancy (years)", title= "Figure 1") + scale_color_discrete(name="Continent")

#can scale_x_continuous and can change the numbers on the size- like can change the breaks of the data 

