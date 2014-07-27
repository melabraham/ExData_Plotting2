## program to read the unzipped RDS file from the current working directory 
## and create a base plot to show the total emission for Baltiore for the   
## years 1999, 2002, 2005 and 2008


Plot2 <- function() {

   NEI <- readRDS("summarySCC_PM25.rds")
   SCC <- readRDS("Source_Classification_Code.rds")

   zip_data <- NEI[NEI$fips == "24510", ]
   tot_emission <- aggregate(zip_data$Emissions,list(zip_data$year),FUN="sum") 

   png(filename = "plot2.png", width = 480, height = 480, units = "px") 
   plot(tot_emission, type ="l", xlab="Year",ylab=expression('Total PM'[2.5]*"Emission"), main ="Total Emission in Baltimore from 1999 to 2008")   

   dev.off()

   }

Plot2()

  
