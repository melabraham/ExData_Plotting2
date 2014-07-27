## program to read the unzipped RDS file from the current working directory 
## and create a base plot to show the total emission for Baltiore for the   
## years 1999, 2002, 2005 and 2008


Plot3 <- function() {
   library(ggplot2)
   NEI <- readRDS("summarySCC_PM25.rds")
   SCC <- readRDS("Source_Classification_Code.rds")
  
   zip_data <- NEI[NEI$fips == "24510", ]
   png(filename = "plot3.png", width = 480, height = 480, units = "px") 

   g <- ggplot(zip_data, aes(year,Emissions,color = type))
   g + geom_line(stat = "summary", fun.y = "sum") +ylab(expression('Total PM'[2.5]*"Emission")) + ggtitle("Total Emission in Baltimore from 1999 to 2008")   

   dev.off()

   }

Plot3()

  
