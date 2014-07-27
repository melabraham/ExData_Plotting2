## program to read the unzipped RDS file from the current working directory 
## and create a base plot to show the vehicle emission for Baltimore for the   
## years 1999, 2002, 2005 and 2008


Plot5 <- function() {
   NEI <- readRDS("summarySCC_PM25.rds")
   SCC <- readRDS("Source_Classification_Code.rds")

   zip_data <- NEI[NEI$fips == "24510", ]

   motor_data <- grep("motor", SCC$Short.Name, ignore.case= T)
   motor_data <- SCC[motor_data, ]
   motor_data <- zip_data[zip_data$SCC %in% motor_data$SCC, ]

   motor_emission <- aggregate(motor_data$Emissions, list(motor_data$year), FUN = "sum")
 
   png(filename = "plot5.png", width = 480, height = 480, units = "px") 

   plot(motor_emission, type="l", xlab="Year",ylab= expression('Total PM'[2.5]*"Emission"),main ="Total Emission from motor vehicle for Baltimore from 1999 to 2008")   

   dev.off()

   }

Plot5()

  
