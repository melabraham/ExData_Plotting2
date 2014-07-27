## program to read the unzipped RDS file from the current working directory 
## and create a base plot to show the total emission for Baltiore for the   
## years 1999, 2002, 2005 and 2008


Plot4 <- function() {
   NEI <- readRDS("summarySCC_PM25.rds")
   SCC <- readRDS("Source_Classification_Code.rds")


   coal_data <- grep("coal", SCC$Short.Name, ignore.case= T)
   coal_data <- SCC[coal_data, ]
   coal_data <- NEI[NEI$SCC %in% coal_data$SCC, ]

   coal_emission <- aggregate(coal_data$Emissions, list(coal_data$year), FUN = "sum")
 
   png(filename = "plot4.png", width = 480, height = 480, units = "px") 

   plot(coal_emission, type="l", xlab="Year",ylab= expression('Total PM'[2.5]*"Emission"),main ="Total Emission from coal combustion sources from 1999 to 2008")   

   dev.off()

   }

Plot4()

  
