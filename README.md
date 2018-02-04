# Chuliang Song, Rudolf P. Rohr, Serguei Saavedra. "Why are some plant-pollinator networks more nested than others?"  J. of Animal Ecology, 2017. 

The file contains: 

- The R-code: 
(1) to load a plant-pollinator network, 
(2) to calculate the raw NODF as in Almeida-Neto et al. (Oikos 117, 2008), 
(3) the maximum NODF value that can be reached by a network with given connectance and size (using a greedy algorithm as explained in the manuscript), 
(4) the combined NODF statistic as described in the manuscript (NODF divided by the product of maximum NODF, connectance, and the log of the geometric mean of plants and pollinators). 

- Note that we are providing a simple example of a binary network. 
In the manuscript we used the 59 plant-pollinator networks downloaded from the Web of Life database (www.web-of-life.es): M_PL_001 to M_PL_059. 

- The temperature seasonality (variance of daily temperature) for 43 plant-pollinator networks for which we found information about latitude and longitude. 
Environmental data were downloaded from the public repository WorldClim version 1.4, release 3, resolution 2.5 min.
