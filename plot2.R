## Data files have been downloaded.
## Load the NEI & SCC data frames.
NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")

## Sum Emissions for each Year.
plot2 <- NEI[NEI$fips == "24510",]
plot2 <- aggregate(Emissions ~ year, plot2, sum)

png("plot2.png",width=720,height=480,units="px",bg="transparent")

plot(plot2$year,plot2$Emissions, 
     main="Total Baltimore PM2.5 Emissions", "b", 
     xlab="Year", ylab="Emissions (thousand tons)",xaxt="n")
axis(side=1, at=c("1999", "2002", "2005", "2008"))

dev.off() 