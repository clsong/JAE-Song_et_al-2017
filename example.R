#R-code of "Why are some plant-pollinator networks more nested than others?" by:
#Chuliang Song, Rudolf P. Rohr, and Serguei Saavedra
#Journal of Animal Ecology
rm(list=ls())
source('toolbox.R') #load the toolbox

web <- load_data() #load network.csv
print(NODF <- nestedness_NODF(web)) # this calculates the raw value of NODF
print(max_NODF <- max_nest(web)) # this calculates the maximum value of NODF for that network
print(combined_NODF <- comb_nest(web,NODF,max_NODF)) # this calculates the combined NODF statistic as described in the manuscript


