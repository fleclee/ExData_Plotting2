library(ggplot2)

## Data files have been downloaded.
## Load the NEI & SCC data frames.
NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")

## Subset data for only Baltimore observations
## summing Emissions by Year then type
plot3 <- NEI[NEI$fips == "24510",]
plot3 <- aggregate(Emissions ~ year + type, plot3, sum)

ggplot(data=plot3, 
       aes(x=year, y=Emissions, group=type, color=type)) + geom_line() + geom_point(size=4, shape=21, fill="white") + xlab("Year") + ylab("Emissions (tons)") + ggtitle("Baltimore PM2.5 Emissions by Type and Year")
ggsave(file="plot3.png")