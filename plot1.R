## program to read the unzipped RDS file from the current working directory 
## and create a base plot to show the total emission from all sources for the   
## years 1999, 2002, 2005 and 2008


Plot1 <- function() {

   NEI <- readRDS("summarySCC_PM25.rds")
   SCC <- readRDS("Source_Classification_Code.rds")

   tot_emission <- aggregate(NEI$Emissions,list(NEI$year),FUN="sum") 
   png(filename = "plot1.png", width = 480, height = 480, units = "px") 
   plot(tot_emission, type ="l", xlab="Year",ylab=expression('Total PM'[2.5]*"Emission"), main ="Total Emission in US from 1999 to 2008")   

   dev.off()

   }

Plot1()

  
