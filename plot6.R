## program to read the unzipped RDS file from the current working directory 
## and create a base plot to show the vehicle emission for Baltimore Vs LA County in California for the   
## years 1999, 2002, 2005 and 2008


Plot6 <- function() {
   NEI <- readRDS("summarySCC_PM25.rds")
   SCC <- readRDS("Source_Classification_Code.rds")

   library(ggplot2)

   zip_data <- NEI[NEI$fips == "06037" |NEI$fips == "24510" , ]

   motor_data <- grep("motor", SCC$Short.Name, ignore.case= T)
   motor_data <- SCC[motor_data, ]
   motor_data <- zip_data[zip_data$SCC %in% motor_data$SCC, ]
   png(filename = "plot6.png", width = 480, height = 480, units = "px") 


   g <- ggplot(motor_data, aes(year,Emissions,color = fips))
   g + geom_line(stat = "summary", fun.y = "sum") +ylab(expression('Total PM'[2.5]*"Emission")) + ggtitle("Comparison of motor vehicle emission in \n Baltimore and LA County from 1999 to 2008")

   dev.off()

   }

Plot6()

  
