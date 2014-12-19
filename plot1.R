## Data files have been downloaded.
## Load the NEI & SCC data frames.
NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")

## Aggregate by sum the total emissions by year
aggTotals <- aggregate(Emissions ~ year, NEI, sum)

png("plot1.png",width=720,height=480,units="px",bg="transparent")

plot(aggTotals$year, (aggTotals$Emissions)/10^3, type="b", 
    main="Total US PM2.5 Emissions", 
    xlab="Year", ylab="PM2.5 Emissions (thousands of tons)", xaxt="n")
axis(side=1, at=c("1999", "2002", "2005", "2008"))

dev.off() 